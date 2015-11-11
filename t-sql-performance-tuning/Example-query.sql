WITH Goals_extended AS (
	SELECT
		ID
		,Value AS GoalValue
		,TeamID
		,CorpUnits.Location AS Office
		,CorpUnits.ManagerName AS Manager
	FROM GoalsV2
		INNER JOIN CorpUnits
			ON GoalsV2.UnitID = CorpUnits.UnitID
	WHERE CorpUnits.Name LIKE 'PacificNorthwest'
	AND CorpUnits.GeoID = 5
)
SELECT
	Goals.ID
	,Goals.Value AS GoalValue
	,Goals.TeamID AS TeamNum
	,CorpValues.Name
	,ConsolidatedResults.[Date]
	,ConsolidatedResults.Value
	,ConsolidatedResults.[Priority]
FROM Goals
	--Goals doesn't contain all values, need to get extended goals attributes from GoalsV2
	LEFT OUTER JOIN Goals_extended
		ON Goals.ID = AnotherGoals.ID
		AND Goals.FiscalQuarter = AnotherGoals.FiscalQuarter

	--v3: reworked to resolve bug around dates and statuses
	--after complaint from Debbie in marketing
	INNER JOIN
	(
		SELECT
			CorpValues.[ID]
			,CorpValues.[Name]
			,CorpValues.[Status]
			,CorpValues.[FYear]
			,CorpValues.[CDate]
			,CorpValues.[Unit]
			,CorpValues.[GeoID]
			,CorpValues.[Name]
			,CorpValues.[Tagging]
			,CorpValues.[Document]
			,Reference.[Structure]
			,Reference.[Metadata]
			,Reference.[ExtendedAttributes]
			,Reference.[Tags]
			,Reference.[LocalizationAttributes]
			,Reference.[LanguageTag]
			,Reference.[Keywords]
			,Reference.[URL]
		FROM Reference
			INNER JOIN
			(
				SELECT
					ID
					,[Status] AS [Status]
					,[FiscalYear] AS FYear
					,[date] AS CDate
					,[UnitID] AS Unit
					,[GeoID] AS GeoID
					,[GeoName] AS [Name]
					,[TaggingID] AS [Tagging]
					,[DocumentID] AS [Document]
				FROM CorpValues
				WHERE CorpValues.[date] > '1/1/2013'
			)
			AS CorpValues
		WHERE
			Reference.[Status] <> 'Inactive'
			AND Reference.ID = CorpValues.ID
	) AS ConsolidatedResults
		ON Goals.ID = ConsolidatedResults.ID
WHERE
	Goals.[Status] <> 'Inactive'