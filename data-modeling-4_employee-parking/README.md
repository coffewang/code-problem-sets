# Data Modeling 4: Employee Parking

## Background

The Diamond Corporation owns over 100 parking lots throughout Seattle.  The Ajax Company leases 5 of these parking lots from the Diamond Corporation.

* Parking Lot A is a 5 story parking garage with 100 parking spaces per level.  10 of the parking spaces on the first level are designated for disabled parking, and the remaining are designated for carpooling.
* Parking Lot B is a 3 story parking garage with 50 parking spaces per level.  The first level is designated for carpooling only.
* Parking Lots C and D are the same as Parking Lot A.
* Parking Lot 5 is a single level parking consisting of 50 regular parking spaces, and is reserved for overflow parking.

The Ajax Company employs approximately 1000 employees that work during the day and evening shifts. Employees are assigned to either the regular, disabled or carpool parking spaces in Parking Lots A through D, during the hours they work. Parking Lot 5 is reserved for the overflow parking. 

## Problem

You are hired as a consultant to develop an application that will help the Ajax Company manage employee parking assignments. The client wants to be able to track what parking spaces are assigned to employees, and where the available parking spaces are that can be assigned in the future.

1. Create a Conceptual Data Model that contains all of the entities needed to support the business requirements express in the above statement.
2. Create a corresponding Logical Data Model that contains all of the attributes needed to support the business requirements.  
3. Include a sample data set to demonstrate that you have validated the model.