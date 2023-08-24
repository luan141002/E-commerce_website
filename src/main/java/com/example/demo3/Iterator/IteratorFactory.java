package com.example.demo3.Iterator;

import com.example.demo3.data.OrderDAO;
import com.example.demo3.data.ProductDAO;
import com.example.demo3.data.UserDAO;

import java.io.Serializable;
import java.util.Iterator;

public class IteratorFactory  {
    public Iterator<Serializable> getIterator(int index)
    {
        ProductDAO pd = new ProductDAO();
        OrderDAO od = new OrderDAO();
        UserDAO ud = new UserDAO();
        switch (index){
            case (1):
                return ud.iterator();
            case (2):
                return od.iterator();
            case(3):
                return pd.iterator();
            default:
                return null;
        }
    }
}
