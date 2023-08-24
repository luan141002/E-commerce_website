package com.example.demo3.orderState;

import com.example.demo3.business.Order;

// Lớp con OrderProcessing
public class OrderProcessing extends OrderState{


    public OrderProcessing() {
        this.order = getOrder();
    }

    public OrderProcessing(Order order) {
        super(order);
    }


    @Override
    public void processOrder() {
        // Xử lý đơn hàng ở trạng thái "Đang xử lý"
        // Chuyển trạng thái đơn hàng sang "Đã giao cho đơn vị vận chuyển"
        order.setState(new OrderShipped(order));
    }

    @Override
    public void processOrder(Order order) {
        order.setState(new OrderShipped(order));
    }

    @Override
    public String getStatusMessage() {
        return "Order is on process";
    }
}
