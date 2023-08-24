package com.example.demo3.orderState;

import com.example.demo3.business.Order;

// Lớp con OrderInTransit
public class OrderInTransit extends OrderState {
    public OrderInTransit(Order order) {
        super(order);
    }

    @Override
    public void processOrder() {
        // Xử lý đơn hàng ở trạng thái "Đang vận chuyển"
        // Chuyển trạng thái đơn hàng sang "Đã giao hàng"
        order.setState(new OrderDelivered(order));
    }

    @Override
    public void processOrder(Order order) {
        order.setState(new OrderDelivered(order));
    }

    public OrderInTransit() {
        this.order = getOrder();
    }

    @Override
    public String getStatusMessage() {
        return "Order is in Transit";
    }
}
