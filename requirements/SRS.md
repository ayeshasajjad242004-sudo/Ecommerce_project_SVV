SOFTWARE REQUIREMENTS SPECIFICATION (SRS)
E-Commerce Order Management System

1. INTRODUCTION
1.1 Purpose

This document defines the Software Requirements Specification (SRS) for the E-Commerce Order Management System. It serves as a formal reference for requirement understanding and acts as a foundation for Z-Notation, VDM, and Alloy modeling in the SVV Lab. It clearly defines system behavior, constraints, and order lifecycle rules.

1.2 Project Scope

The system is a simplified e-commerce simulation focusing only on the order lifecycle. It does not include full-scale commercial features like payment gateways or logistics APIs. Instead, it focuses on core operations such as product browsing, cart management, order placement, payment simulation, and shipping.

The main objective is to enable formal verification of system behavior using mathematical modeling techniques.

1.3 Intended Audience
The instructor for evaluation of requirement engineering and formal modeling
The development team for understanding system behavior
The testing team for deriving test cases from requirements
2. SYSTEM DESCRIPTION
2.1 Product Perspective

The system is a standalone application that does not depend on external services such as banks or courier APIs. Instead, all external interactions are simulated internally.

2.2 System States

The system maintains a strict order lifecycle consisting of the following states:

The first state is the Cart (Selection State), where items are selected but no order is created.

The second state is the Placed (Pending State), where the cart is converted into an order but payment has not been completed.

The third state is the Paid (Processing State), where payment is successfully simulated.

The fourth state is the Shipped (Transit State), where the admin dispatches the order.

The final states are Delivered or Cancelled (Terminal States), where no further transitions are allowed.

2.3 User Roles
Customer

The customer can browse products, manage a cart, place orders, and track order status.

Admin

The admin manages product inventory, updates stock, and changes order status from Paid to Shipped.

3. SYSTEM INVARIANTS (FORMAL RULES)

The system must always satisfy the following constraints:

An order cannot be shipped unless its status is Paid.

Product stock must never become negative; it must always remain greater than or equal to zero.

A cancelled order must never transition to the Delivered state.

The total cost of an order must always equal the sum of the prices of all items in the cart.

4. FUNCTIONAL REQUIREMENTS
4.1 User Management

The system allows user registration with unique credentials.

Users must be able to log in and log out securely.

Users must be able to view their profile and order history.

4.2 Product and Cart Management

The system displays all available products with name, price, and stock.

Users can search for products by name.

Users can add products to the cart.

Users can update quantities or remove items from the cart.

4.3 Order Processing

Users can convert their cart into an order using checkout functionality.

The system simulates payment and updates order status to Paid.

Users are allowed to cancel orders only before they reach the Shipped state.

4.4 Formal Operations (SVV Core)
PlaceOrder Operation

Before placing an order, the cart must not be empty and sufficient stock must be available.

After execution, the order state becomes Placed and stock is reserved.

MakePayment Operation

This operation can only be executed if the order is in the Placed state.

After execution, the order state becomes Paid.

CancelOrder Operation

This operation is allowed only if the order is not in the Shipped state.

After execution, the order state becomes Cancelled and stock is restored.

ShipOrder Operation (Admin)

This operation can only be performed if the order is in the Paid state.

After execution, the order state becomes Shipped.

5. NON-FUNCTIONAL REQUIREMENTS

The system must be simple and easy to use for all users.

The system must ensure data integrity by correctly updating stock after every operation.

The system must ensure security so that users cannot access other users’ orders.

The system must handle invalid actions gracefully, such as preventing checkout with an empty cart.

6. SYSTEM CONSTRAINTS

The system does not allow guest checkout; all users must be registered.

Each user can have only one active session at a time.

The system stores data locally and does not rely on external cloud services.

7. USE CASE SCENARIOS
Successful Purchase Scenario

A customer logs in, adds products to the cart, places an order, completes payment, and the admin ships the order successfully. The order is eventually delivered.

Failed Cancellation Scenario

A customer attempts to cancel an order that has already been shipped. The system rejects the request and displays an error message indicating that cancellation is not allowed.

8. CONCLUSION

This SRS defines a complete and structured specification of the E-Commerce Order Management System. It clearly defines system states, invariants, functional behavior, and constraints. This document serves as the foundation for formal verification using Z-Notation, VDM, and Alloy in the SVV Lab.
