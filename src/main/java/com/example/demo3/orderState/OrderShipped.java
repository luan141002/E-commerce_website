package com.example.demo3.orderState;

import com.example.demo3.business.Order;

// Lớp con OrderShipped
public class OrderShipped extends OrderState  {
    public OrderShipped(Order order) {
        super(order);
    }
    public OrderShipped(){
        this.order = getOrder();
    }
    @Override
    public void processOrder() {
        order.setState(new OrderInTransit(order));
    }

    @Override
    public void processOrder(Order order) {
        order.setState(new OrderInTransit(order));
    }

    @Override
    public String getStatusMessage() {
        return "Order is transcended to the Shipping Agency" ;
    }
}
