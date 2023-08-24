package com.example.demo3.Iterator.filter;

import com.example.demo3.business.Product;

public class brandProductFilter implements Filter{
    @Override
    public boolean satisfies(Product product, String type) {
        return product.getProBrand().equals(type);
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
