package com.example.demo3.Iterator.filter;

import com.example.demo3.business.Product;

public class Search implements Filter{

    @Override
    public boolean satisfies(Product product, String type) {
        return product.getProName().trim().equals(type.trim());
    }

    @Override
    public boolean satisfiesPrice(Product product, double priceFrom, double priceTO) {
        if (priceFrom<=product.getProPrice() && product.getProPrice() <=priceTO)
        {
            return true;
        }
        else {
            return false;
        }
    }
}
