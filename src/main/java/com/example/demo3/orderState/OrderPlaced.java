package com.example.demo3.orderState;

import com.example.demo3.business.Order;

// Lớp con OrderPlaced
public class OrderPlaced extends OrderState {

    public OrderPlaced(Order order) {
        this.order = order;
    }

    public OrderPlaced() {
        this.order = getOrder();
    }

    @Override
    public void processOrder() {
        // Xử lý đơn hàng ở trạng thái "Đã đặt hàng"
        // Chuyển trạng thái đơn hàng sang "Đang xử lý"
        order.setState(new OrderProcessing(order));
    }
    public void processOrder(Order order) {
        // Xử lý đơn hàng ở trạng thái "Đã đặt hàng"
        // Chuyển trạng thái đơn hàng sang "Đang xử lý"
        order.setState(new OrderProcessing(order));
    }

    @Override
    public String getStatusMessage() {
        return "Order Placed.";
    }
}
