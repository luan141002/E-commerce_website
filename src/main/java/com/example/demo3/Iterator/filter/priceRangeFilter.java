package com.example.demo3.Iterator.filter;

import com.example.demo3.business.Product;

public class priceRangeFilter implements Filter {
    @Override
    public boolean satisfies(Product product, String type) {
        return true;
    }

    @Override
    public boolean satisfiesPrice(Product product, double priceFrom, double priceTO) {
        return false;
    }
}
