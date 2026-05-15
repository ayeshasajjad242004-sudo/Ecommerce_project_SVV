REQUIREMENT DEFECT ANALYSIS
E-Commerce Order Management System
1. INTRODUCTION

This document identifies defects found in the initial system requirements and provides their classification and corrected versions. These corrections ensure the system is suitable for formal modeling in Z-Notation, VDM, and Alloy.

2. REQUIREMENT DEFECTS
ID	Requirement	Defect Type	Explanation	Fix
D1	"The system should be easy to use."	Ambiguity	“Easy” is not measurable or verifiable	Redefined as: A user must complete checkout within 5 minutes
D2	"Users can cancel orders at any time."	Inconsistency	Conflicts with shipping state rules	Cancellation allowed only before Shipped state
D3	"System supports unlimited orders."	Overscope	Not realistic for a formal lab system	Limited to 100 concurrent orders
D4	"Payment happens normally."	Non-verifiable	No clear definition of payment process	Replaced with payment simulation step
D5	"Stock updates automatically."	Ambiguity	No rule defining when/how stock updates	Defined: stock decreases after PlaceOrder confirmation
3. SUMMARY

The above defects were resolved in the final SRS document to ensure:

Clear and measurable requirements
Consistent system behavior
Verifiable constraints for formal methods
Proper alignment with Z, VDM, and Alloy modeling
