package com.example.demo3.Iterator;

import com.example.demo3.business.Order;

import java.io.Serializable;
import java.util.Iterator;
import java.util.List;

public class OrderIterator implements Iterator<Serializable> {
    private List<Order> lOrder;
    private int _position = 0;
    public OrderIterator() {
    }

    public OrderIterator(List<Order> lOrder) {
        this.lOrder = lOrder;
        this._position = 0;
    }

    @Override
    public boolean hasNext() {
        if(_position < lOrder.size()) {
            return true;
        }else{
            return false;
        }
    }

    @Override
    public Order next() {
        if (this.hasNext()) {
            return lOrder.get(_position++);
        }
        return null;
    }

    @Override
    public void remove() {
        Iterator.super.remove();
    }
}
