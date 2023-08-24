package com.example.demo3.Iterator;

import com.example.demo3.business.Product;
import com.example.demo3.business.User;

import java.io.Serializable;
import java.util.Iterator;
import java.util.List;

public class UserIterator implements Iterator<Serializable>{


    private List<User> lUser;
    private int _position=0;

    public UserIterator(List<User> lUser) {
        this.lUser = lUser;
        this._position = 0;
    }

    private int index = 0 ;
    @Override
    public boolean hasNext() {
        if(_position < lUser.size()) {
            return true;
        }else{
            return false;
        }
    }

    @Override
    public User next() {
        if (this.hasNext()) {
            return lUser.get(_position++);
        }
        return null;
    }
    @Override
    public void remove() {
        Iterator.super.remove();
    }

}
