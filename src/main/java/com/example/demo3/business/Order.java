package com.example.demo3.business;

import jakarta.persistence.*;

import java.util.Date;

@Entity
@Table(name = "order")
public class Order {
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "Order_SEQ")
    @SequenceGenerator(name = "Order_SEQ")
    @Column(name = "id", nullable = false)
    private Integer id;

    @OneToOne
    private OrderDetail orderDetail;
    private Date dateCreated;

    public OrderDetail getOrderDetail() {
        return orderDetail;
    }

    public void setOrderDetail(OrderDetail orderDetail) {
        this.orderDetail = orderDetail;
    }

    public Order(Integer id, OrderDetail orderDetail, Date dateCreated, Date dateShipped, User user, ShippingInfo shipInfo, String status) {
        this.id = id;
        this.orderDetail = orderDetail;
        this.dateCreated = dateCreated;
        this.dateShipped = dateShipped;
        this.user = user;
        this.shipInfo = shipInfo;
        this.status = status;
    }

    private Date dateShipped;
    @ManyToOne
    private User user;
    @OneToOne
    private  ShippingInfo shipInfo;
    private String status;

    public Order(Integer id, Date dateCreated, Date dateShipped, User user, ShippingInfo shipInfo, String status) {
        this.id = id;
        this.dateCreated = dateCreated;
        this.dateShipped = dateShipped;
        this.user = user;
        this.shipInfo = shipInfo;
        this.status = status;
    }

    public Order() {
    }

    public Date getDateCreated() {
        return dateCreated;
    }

    public void setDateCreated(Date dateCreated) {
        this.dateCreated = dateCreated;
    }

    public Date getDateShipped() {
        return dateShipped;
    }

    public void setDateShipped(Date dateShipped) {
        this.dateShipped = dateShipped;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public ShippingInfo getShipInfo() {
        return shipInfo;
    }

    public void setShipInfo(ShippingInfo shipInfo) {
        this.shipInfo = shipInfo;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

}