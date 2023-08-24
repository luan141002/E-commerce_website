package com.example.demo3.business;

import jakarta.persistence.*;

import java.io.Serializable;

@Entity
@Table(name = "shipping_infos")
public class ShippingInfo implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    private Integer id;
    private String shippingType;
    private Double shippingCost;
    private String Address;

    public ShippingInfo(Integer id, String shippingType, Double shippingCost, String address, Integer shippingRegionId) {
        this.id = id;
        this.shippingType = shippingType;
        this.shippingCost = shippingCost;
        this.Address = address;
        this.shippingRegionId = shippingRegionId;
    }
    public ShippingInfo(String shippingType, Double shippingCost, String address, Integer shippingRegionId) {
        this.shippingType = shippingType;
        this.shippingCost = shippingCost;
        this.Address = address;
        this.shippingRegionId = shippingRegionId;
    }

    private Integer shippingRegionId;
    public ShippingInfo() {
    }

    public String getShippingType() {
        return shippingType;
    }

    public void setShippingType(String shippingType) {
        this.shippingType = shippingType;
    }

    public Double getShippingCost() {
        return shippingCost;
    }

    public void setShippingCost(Double shippingCost) {
        this.shippingCost = shippingCost;
    }

    public Integer getShippingRegionId() {
        return shippingRegionId;
    }

    public void setShippingRegionId(Integer shippingRegionId) {
        this.shippingRegionId = shippingRegionId;
    }

    public ShippingInfo(Integer id, String shippingType, Double shippingCost, Integer shippingRegionId) {
        this.id = id;
        this.shippingType = shippingType;
        this.shippingCost = shippingCost;
        this.shippingRegionId = shippingRegionId;
    }

    public String getAddress() {
        return Address;
    }

    public void setAddress(String address) {
        Address = address;
    }
    @Override
    public String toString() {
        return "ShippingInfo{" +
                "id=" + id +
                ", shippingType='" + shippingType + '\'' +
                ", shippingCost=" + shippingCost +
                ", shippingRegionId=" + shippingRegionId +
                '}';
    }

    public double Shippingfee(String shippingType, Integer shippingRegionId) {
        if(shippingRegionId > 3 && shippingType!=null)
        {
            double ship = shippingRegionId*30;
            this.shippingCost= ship;
        }
        return this.shippingCost;
    }



    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

}