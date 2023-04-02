package com.example.demo3.business;

import jakarta.persistence.*;

import java.io.Serializable;

@Entity
@Table(name = "user")
public class User implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer userID;
    private  String userName;
    private String userAddress;
    private int userPhone;
    private String userCredit;
    private String userShipInfo;

    @Column(length = 15, nullable = false)
    private int type;

    public int getType() {
        return type;
    }

    public User(Integer id, String username, String password, Integer userID, String userName, String userAddress, int userPhone, String userCredit, String userShipInfo, int type) {
        this.userID = userID;
        this.userName = userName;
        this.userAddress = userAddress;
        this.userPhone = userPhone;
        this.userCredit = userCredit;
        this.userShipInfo = userShipInfo;
        this.type = type;
    }

    public void setUserID(Integer userID) {
        this.userID = userID;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getUserAddress() {
        return userAddress;
    }

    public void setUserAddress(String userAddress) {
        this.userAddress = userAddress;
    }

    public int getUserPhone() {
        return userPhone;
    }

    public void setUserPhone(int userPhone) {
        this.userPhone = userPhone;
    }

    public String getUserCredit() {
        return userCredit;
    }

    public void setUserCredit(String userCredit) {
        this.userCredit = userCredit;
    }

    public String getUserShipInfo() {
        return userShipInfo;
    }

    public void setUserShipInfo(String userShipInfo) {
        this.userShipInfo = userShipInfo;
    }

    public void setType(int type) {
        this.type = type;
    }



    public User() {

    }

    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }



    //-------------------------------------------------------




}