# Validation Checklist - E-Commerce Order System

## 1. Functional Requirement Validation

- [✓] Users can register and login securely (FR-1, FR-2)
- [✓] Products are displayed with price and stock (FR-4)
- [✓] Users can add/remove items from cart (FR-6, FR-7)
- [✓] Checkout converts cart into placed order (FR-8)
- [✓] Payment simulation updates order status to Paid (FR-9)
- [✓] Order can be cancelled before shipping (FR-10)

---

## 2. System State Validation

- [✓] Cart → Placed transition works correctly
- [✓] Placed → Paid transition works correctly
- [✓] Paid → Shipped transition only by Admin
- [✓] Cancelled orders cannot move to Delivered

---

## 3. Invariant Validation

- [✓] Stock never becomes negative (Stock ≥ 0)
- [✓] Order cannot be shipped before payment
- [✓] Cancelled order cannot be delivered
- [✓] Order total equals sum of product prices

---

## 4. Security Validation

- [✓] Users cannot access other users' orders
- [✓] Guest users cannot perform checkout
- [✓] Only Admin can change order status to Shipped

---

## 5. Edge Case Handling

- [✓] Empty cart cannot be checked out
- [✓] Cancelled order restores stock properly
- [✓] Invalid state transitions are blocked

---

## Conclusion

All system requirements and constraints are validated successfully.
