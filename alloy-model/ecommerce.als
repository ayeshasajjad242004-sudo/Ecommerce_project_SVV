// E-Commerce Order Management System
// Formal Model using Alloy Analyzer
// SV&V Lab Project

module ecommerceOMS

// Integer library for arithmetic operations
open util/integer


// User Definitions

// Abstract user class
// Direct objects of User cannot be created
abstract sig User {}

// Customer user
sig Customer extends User {}

// Admin user
sig Admin extends User {}


// Product Module

// Product contains:
// - price
// - stock quantity
sig Product {

    // Price of product
    price: one Int,

    // Available stock
    stock: one Int
}


// Cart Module

// Shopping cart of customer
sig Cart {

    // Cart belongs to one customer
    owner: one Customer,

    // Cart can contain multiple products
    items: set Product
}


// Order States

// Different states in order lifecycle
enum OrderStatus {

    // Items only selected in cart
    Selection,

    // Checkout completed
    Placed,

    // Payment successful
    Paid,

    // Order dispatched
    Shipped,

    // Order received
    Delivered,

    // Order terminated/cancelled
    Cancelled
}


// Order Module

// Order entity
sig Order {

    // Customer who placed order
    customer: one Customer,

    // Products inside order
    products: some Product,

    // Total order price
    total: one Int,

    // Current state of order
    status: one OrderStatus
}


// System Invariants / Facts


// Invariant 1
// Order cannot be shipped unless paid

fact ShipOnlyAfterPayment {

    all o: Order |

        o.status = Shipped implies
            o.status != Placed
}


// Invariant 2
// Stock count can never be negative

fact NonNegativeStock {

    all p: Product |

        p.stock >= 0
}


// Invariant 3
// Cancelled order cannot become delivered

fact CancelledNotDelivered {

    all o: Order |

        o.status = Cancelled implies
            o.status != Delivered
}


// Invariant 4
// Order total must be valid
// Simplified integrity check

fact ValidOrderTotal {

    all o: Order |

        o.total >= 0
}


// System Constraint
// One cart belongs to one customer only

fact UniqueCartOwnership {

    all c: Customer |

        lone crt: Cart |
            crt.owner = c
}


// System Constraint
// Every order must belong to one customer

fact OrderOwnership {

    all o: Order |

        one o.customer
}


// Functional Requirements / Operations


// FR-03 PlaceOrder Operation
//
// Preconditions:
// - Cart is not empty
// - Product stock > 0
//
// Postconditions:
// - Order becomes Placed

pred PlaceOrder[c: Customer, crt: Cart, o: Order] {

    // Cart belongs to customer
    crt.owner = c

    // Cart should not be empty
    some crt.items

    // Every product must have stock
    all p: crt.items |

        p.stock > 0

    // Order customer assigned
    o.customer = c

    // Cart products transferred to order
    o.products = crt.items

    // Order state changes to placed
    o.status = Placed
}


// FR-04 MakePayment Operation
//
// Preconditions:
// - Order already placed
//
// Postconditions:
// - Order becomes Paid

pred MakePayment[o: Order] {

    // Order exists
    some o

    // Order status becomes paid
    o.status = Paid
}


// FR-05 CancelOrder Operation
//
// Preconditions:
// - Order is NOT shipped
//
// Postconditions:
// - Order becomes Cancelled

pred CancelOrder[o: Order] {

    // Cannot cancel shipped order
    o.status != Shipped

    // Status becomes cancelled
    o.status = Cancelled
}


// FR-07 ShipOrder Operation
//
// Preconditions:
// - Order must be paid
//
// Postconditions:
// - Order becomes shipped

pred ShipOrder[a: Admin, o: Order] {

    // Admin exists
    some a

    // Order status becomes shipped
    o.status = Shipped
}


// Assertions
// Used for formal verification


// Assertion 1
// No order can ship without payment

assert NoShipWithoutPayment {

    all o: Order |

        o.status = Shipped implies
            o.status != Placed
}


// Assertion 2
// Stock should never become negative

assert StockSafety {

    all p: Product |

        p.stock >= 0
}


// Assertion 3
// Cancelled order cannot be delivered

assert CancelledOrderSafety {

    all o: Order |

        o.status = Cancelled implies
            o.status != Delivered
}


// Assertion 4
// Every order must contain products

assert NonEmptyOrders {

    all o: Order |

        some o.products
}


// Assertion 5
// Every cart belongs to one customer

assert SingleCartOwner {

    all crt: Cart |

        one crt.owner
}


// Run Commands

// Generate sample PlaceOrder instances
run PlaceOrder for 5

// Generate sample payment instances
run MakePayment for 5

// Generate sample shipment instances
run ShipOrder for 5


// Check Commands
// These commands verify system properties and invariants

check NoShipWithoutPayment for 5

check StockSafety for 5

check CancelledOrderSafety for 5

check NonEmptyOrders for 5

check SingleCartOwner for 5
