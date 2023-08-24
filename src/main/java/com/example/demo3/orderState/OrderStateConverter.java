package com.example.demo3.orderState;

import com.example.demo3.business.Order;
import com.example.demo3.data.OrderDAO;
import jakarta.persistence.AttributeConverter;
import jakarta.persistence.Converter;

// Lớp OrderStateConverter
@Converter
public class OrderStateConverter implements AttributeConverter<OrderState, String> {

    @Override
    public String convertToDatabaseColumn(OrderState state) {
        return state.getClass().getSimpleName();
    }


    @Override
    public OrderState convertToEntityAttribute(String status) {

        switch (status.trim()) {
            case "OrderPlaced":
                return new OrderPlaced();
            case "OrderProcessing":
                return new OrderProcessing();
            case "OrderShipped":
                return new OrderShipped();
            case "OrderInTransit":
                return new OrderInTransit();
            case "OrderDelivered":
                return new OrderDelivered();
            default:
                throw new IllegalArgumentException("Trạng thái không hợp lệ: " + status);
        }
    }

}