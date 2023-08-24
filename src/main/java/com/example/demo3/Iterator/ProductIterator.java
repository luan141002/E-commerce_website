package com.example.demo3.Iterator;

import com.example.demo3.business.Product;
import com.example.demo3.data.ProductDAO;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

public class ProductIterator implements Iterator<Serializable> {
    private  List<Product> lProduct;
    private int _position=0;
    private int index = 0 ;

    public ProductIterator(List<Product> lProduct) {
        this.lProduct = lProduct;
       // this.totalPage = lProduct.size()/12;
        this._position = 0;
    }


    @Override
    public boolean hasNext() {
        if(_position < lProduct.size()) {
            return true;
        }else{
            return false;
        }

    }

    @Override
    public Product next() {
        if (this.hasNext()) {
            return lProduct.get(_position++);
        }
        return null;
    }

    @Override
    public void remove() {
        Iterator.super.remove();
    }
}
