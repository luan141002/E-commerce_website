package com.example.demo3.Iterator.filter;

import com.example.demo3.business.Product;

public interface Filter {
    boolean satisfies(Product product,String type); //Strategy
    boolean satisfiesPrice(Product product,double priceFrom , double priceTO);

}
