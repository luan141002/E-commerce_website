package com.example.demo3.orderState.Observer;

import com.example.demo3.business.User;
import com.example.demo3.orderState.OrderState;

public interface Observer {
    public void update(OrderState state);
    public void updateOrder(OrderState state, User user);
}