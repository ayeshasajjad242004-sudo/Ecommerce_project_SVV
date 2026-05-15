SOFTWARE REQUIREMENTS SPECIFICATION (SRS)
E-Commerce Order Management System
1. INTRODUCTION
1.1 Purpose

This document defines the Software Requirements Specification (SRS) for the E-Commerce Order Management System. It provides a structured description of system behavior, constraints, and order lifecycle to support formal verification using Z-Notation, VDM, and Alloy in SVV Lab.

1.2 Project Scope

The system is a simplified e-commerce simulation focusing on the order lifecycle management process. Unlike real-world platforms such as Amazon or Daraz, this system only includes core functionalities:

Product browsing
Cart management
Order placement
Payment simulation
Order shipment and delivery

The main goal is to support formal verification and modeling rather than full application development.

1.3 Intended Audience
Instructor: For evaluation of requirement engineering and formal modeling
Development Team: For understanding system behavior and constraints
Testing Team: For creating test cases based on requirements

2. SYSTEM DESCRIPTION
2.1 Product Perspective

The system is a standalone application. It does not integrate with external payment gateways or courier services. Instead, all external processes are simulated internally.

2.2 System States (Core for Formal Methods)

The system follows these states:

Cart (Selection State): Items selected but not ordered
Placed (Pending State): Order created but not paid
Paid (Processing State): Payment confirmed
Shipped (Transit State): Order dispatched by admin
Delivered / Cancelled (Terminal State): Final state with no further transitions

2.3 User Roles
Customer
Browse products
Manage cart
Place orders
Track order status
Admin
Manage inventory
Update stock
Change order status (Paid → Shipped)

3. SYSTEM INVARIANTS (FORMAL RULES)

The system must always satisfy the following:

I1: An order cannot be shipped unless it is in the Paid state
I2: Product stock must always remain ≥ 0
I3: A cancelled order cannot transition to Delivered
I4: Order total must equal the sum of product prices in the cart

4. FUNCTIONAL REQUIREMENTS

4.1 User Management
FR1: User registration with unique credentials
FR2: Login and logout functionality
FR3: View user profile and order history

4.2 Product & Cart Management
FR4: Display product catalog (name, price, stock)
FR5: Search products by name
FR6: Add products to cart
FR7: Update or remove items from cart

4.3 Order Processing
FR8: Checkout converts cart into a Placed order
FR9: Payment simulation updates order to Paid
FR10: Order cancellation allowed only before Shipped state

4.4 Formal Operations (SVV Focus)
PlaceOrder
Pre-condition: Cart is not empty AND stock is available
Post-condition: Order state = Placed, stock reserved
MakePayment
Pre-condition: Order state = Placed
Post-condition: Order state = Paid
CancelOrder
Pre-condition: Order state ≠ Shipped
Post-condition: Order state = Cancelled, stock restored
ShipOrder (Admin)
Pre-condition: Order state = Paid
Post-condition: Order state = Shipped

6. NON-FUNCTIONAL REQUIREMENTS
Usability: System must be simple and user-friendly
Data Integrity: Stock must update correctly after every transaction
Security: Users cannot access other users’ orders
Reliability: System must handle invalid operations gracefully

8. SYSTEM CONSTRAINTS
No guest checkout allowed
Only one active session per user
Data stored locally (no external cloud dependency)

10. REQUIREMENT DEFECT ANALYSIS
ID	Requirement	Defect Type	Explanation	Fix
D1	"Easy to use"	Ambiguity	Not measurable	Defined as completion within 5 minutes
D2	"Cancel anytime"	Inconsistency	Conflicts with shipping rules	Allowed only before Shipped state
D3	"Unlimited orders"	Overscope	Not suitable for lab model	Limited to 100 concurrent orders
D4	Payment definition	Missing	No clear payment behavior	Added payment simulation step

12. USE CASE SCENARIOS
Scenario 1: Successful Purchase
User logs in
Adds product to cart
Places order
Makes payment
Admin ships order
Order delivered successfully
Scenario 2: Failed Cancellation
Order already shipped
User attempts cancellation
System blocks request
Error message displayed

14. CONCLUSION

This SRS defines the complete structure of the E-Commerce Order Management System, including states, invariants, functional requirements, and constraints. It forms the foundation for formal verification using Z-Notation, VDM, and Alloy in the SVV Lab.
