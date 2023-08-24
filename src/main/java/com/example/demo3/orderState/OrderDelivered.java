package com.example.demo3.orderState;

import com.example.demo3.business.Order;

// Lớp con OrderDelivered
public class OrderDelivered extends OrderState {
    public OrderDelivered(Order order) {
        super(order);
    }

    public OrderDelivered() {
        this.order = getOrder();
    }

    @Override
    public void processOrder() {
        // Xử lý đơn hàng ở trạng thái "Đã giao hàng"
        // Không có chuyển trạng thái nào khác cần thiết
    }

    @Override
    public void processOrder(Order order) {

    }

    @Override
    public String getStatusMessage() {
        return "Delivered";
    }
}
