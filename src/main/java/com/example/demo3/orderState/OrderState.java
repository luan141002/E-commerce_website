package com.example.demo3.orderState;

import com.example.demo3.business.Order;

public abstract class OrderState {
    protected Order order;

    public Order getOrder() {
        return order;
    }

    public OrderState() {
        order = getOrder();
    }

    public OrderState(Order order) {
        this.order = order;
    }
    //chuyển đến state tiếp theo
    public abstract void processOrder();
    public abstract void processOrder(Order order);

    public abstract String getStatusMessage();
}



