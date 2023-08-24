package com.example.demo3.Iterator;

import com.example.demo3.Iterator.filter.Filter;
import com.example.demo3.business.Product;

import java.util.Iterator;
import java.util.List;

public class productFilterIterator implements Iterator<Product> {
    private List<Product> products;
    private int currentIndex;
    private Filter filter;
    private String type;
    double priceFrom = 0;
    double priceTo = 1000000;


    public productFilterIterator(List<Product> products, Filter filter) {
        this.products = products;
        this.filter = filter;
    }
    public productFilterIterator(List<Product> products, Filter filter,String type) {
        this.products = products;
        this.filter = filter;
        this.type = type;
    }
    public productFilterIterator(List<Product> products, Filter filter,String type,double priceFrom, double priceTo) {
        this.products = products;
        this.filter = filter;
        this.type = type;
        this.priceFrom= priceFrom;
        this.priceTo=priceFrom;
    }
    @Override
    public boolean hasNext() {
        while (currentIndex < products.size()) {
            Product product = products.get(currentIndex);
            if (filter.satisfies(product,type)) {
                if (priceTo!=1000000 ){
                    if (filter.satisfiesPrice(product,priceFrom,priceTo))
                    {
                        return true;
                    }
                }
                else if (priceTo ==1000000 ) {
                    return true;
                }
                else{
                    return false;
                }
            }
            currentIndex++;
        }
        return false;
    }

    public void setFilter(Filter filter) {
        this.filter = filter;
    }


    @Override
    public Product next() {
        Product product = products.get(currentIndex);
        currentIndex++;
        return product;
    }

    @Override
    public void remove() {
        Iterator.super.remove();
    }
}
