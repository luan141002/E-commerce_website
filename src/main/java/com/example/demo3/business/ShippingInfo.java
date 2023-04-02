package com.example.demo3.business;

import jakarta.persistence.*;

@Entity
@Table(name = "shipping_info")
public class ShippingInfo {
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "ShippingInfo_SEQ")
    @SequenceGenerator(name = "ShippingInfo_SEQ")
    @Column(name = "id", nullable = false)
    private Integer id;

    private String shippingType;

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

    private Double shippingCost;
    private Integer shippingRegionId;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

}