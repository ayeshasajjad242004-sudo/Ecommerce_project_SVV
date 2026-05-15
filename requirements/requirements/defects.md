1. INTRODUCTION

This document identifies and classifies defects found in the initial system requirements. Each defect is explained along with its correction to ensure the system is clear, consistent, and suitable for formal verification using Z-Notation, VDM, and Alloy.

2. REQUIREMENT DEFECTS
D1: Ambiguity in Usability Requirement

The requirement states that “the system should be easy to use.” This is ambiguous because the term “easy” is subjective and cannot be measured or verified in formal models.

Fix:
The requirement has been refined to:
A new user must be able to complete the checkout process within 5 minutes.

D2: Inconsistency in Order Cancellation Rule

The requirement states that users can cancel orders at any time. This conflicts with the system state model where shipped orders are final and cannot be modified.

Fix:
Cancellation is only allowed if the order status is not “Shipped”.

D3: Overscope in System Capacity Requirement

The requirement mentions support for unlimited or very large numbers of orders. This is unrealistic for a lab-based formal verification project.

Fix:
The system is limited to supporting up to 100 concurrent active orders.

D4: Non-verifiable Payment Requirement

The requirement states that payment happens normally, but it does not define how payment is processed or validated.

Fix:
Payment is redefined as a simulation step where the system changes order status from “Placed” to “Paid”.

D5: Ambiguity in Stock Update Behavior

The requirement states that stock updates automatically, but does not specify when or under what conditions this happens.

Fix:
Stock is reduced only after a successful “PlaceOrder” operation and restored if an order is cancelled before shipping.

3. SUMMARY

After correcting the above defects, the requirements are now:

Clear and measurable
Consistent with system states
Suitable for formal verification
Ready for modeling in Z, VDM, and Alloy
