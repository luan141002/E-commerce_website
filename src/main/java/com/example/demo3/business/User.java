package com.example.demo3.business;

import jakarta.persistence.*;

import java.io.Serializable;
import java.util.List;



@Entity
@Table(name = "users")
public class User implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer userID;
    private  String Email;
    private String firstName;
    private String lastName;
    @Column(length = 15, nullable = false)
    private int type;
    private String userAddress;
    private String userCredit;
    private int userPhone;

    public int getUserStatus() {
        return userStatus;
    }

    public void setUserStatus(int userStatus) {
        this.userStatus = userStatus;
    }

    private double vipBudget;
    private int userStatus;

    public double getVipBudget() {
        return vipBudget;
    }

    public void setVipBudget(double vipBudget) {
        this.vipBudget = vipBudget;
    }

    @OneToOne
    private Account account;
/*    @OneToMany(fetch = EAGER, cascade = CascadeType.ALL)
    private List<ShippingInfo> userShipInfo;*/

    public User() {

    }

    public Account getAccount() {
        return account;
    }
    public void setAccount(Account account) {
        this.account = account;
    }


    public Integer getUserID() {
        return userID;
    }

    public void setUserID(Integer userID) {
        this.userID = userID;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getEmail() {
        return Email;
    }

    public void setEmail(String email) {
        Email = email;
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

    /*public List<ShippingInfo> getUserShipInfo() {
        return userShipInfo;
    }

    public void setUserShipInfo(List<ShippingInfo> userShipInfo) {
        this.userShipInfo = userShipInfo;
    }
*/
    public int getType() {
        return type;
    }

    public void setType(int type) {
        this.type = type;
    }



    public User(String firstName, String lastName, String email, String userAddress, int userPhone, List<ShippingInfo> userShipInfo, Account account, int type) {
        this.firstName = firstName;
        this.lastName = lastName;
        Email = email;
        this.userAddress = userAddress;
        this.userPhone = userPhone;
        /*this.userShipInfo = userShipInfo;*/
        this.account = account;
        this.type = type;
    }
}