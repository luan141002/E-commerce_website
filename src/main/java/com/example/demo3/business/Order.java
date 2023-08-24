package com.example.demo3.business;

import com.example.demo3.orderState.Observer.Observer;
import com.example.demo3.orderState.Observer.Subject;
import com.example.demo3.orderState.Observer.keepTrackOrder;
import com.example.demo3.orderState.OrderPlaced;
import com.example.demo3.orderState.OrderState;
import com.example.demo3.orderState.OrderStateConverter;
import jakarta.persistence.*;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;


@Entity
@Table(name = "orders")
public class Order implements Serializable, Subject {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "order_id", nullable = false)
    private Integer id;

    @OneToOne(cascade = CascadeType.ALL)  //đồng bộ dữ liệu
    //@JoinColumn(name = "shipping_id", referencedColumnName = "id")
    private ShippingInfo shipInfo;
    @OneToOne(cascade = CascadeType.ALL) //đồng bộ dữ liệu
    //@JoinColumn(name = "cartid", referencedColumnName = "cartid")
    private Cart orderDetail;
    @ManyToOne
    private User user;
    private Date dateCreated;
    @Transient
    private List<Observer> observers ;
    private Date dateShipped;

    @Column(name = "status")
    @Convert(converter = OrderStateConverter.class)
    private OrderState state;
    private int notify ;


    public Cart getOrderDetail() {
        return orderDetail;
    }

    public void setOrderDetail(Cart orderDetail) {
        this.orderDetail = orderDetail;
    }

    public Order(ShippingInfo shipInfo, Cart orderDetail, User user, Date dateCreated, Date dateShipped) {
        this.shipInfo = shipInfo;
        this.orderDetail = orderDetail;
        this.user = user;
        this.dateCreated = dateCreated;
        this.dateShipped = dateShipped;
        state = new OrderPlaced(this);
        observers = new ArrayList<Observer>();
    }

    public Order(int id, Date dateCreated, Date dateShipped, User user, ShippingInfo shipInfo) {
        this.id = id;
        this.dateCreated = dateCreated;
        this.dateShipped = dateShipped;
        this.user = user;
        this.shipInfo = shipInfo;
        state = new OrderPlaced(this);
        observers = new ArrayList<Observer>();
    }

    public Order() {

        this.state = new OrderPlaced(this);
        observers = new ArrayList<Observer>();
    }

    public int getNotify() {
        return notify;
    }

    public void setNotify(int notify) {
        this.notify = notify;
    }

    //state
    public void process() {
        state.processOrder(this);
        if(this.notify == 1){
            keepTrackOrder observer = new keepTrackOrder();
            observers.add(observer);
        }
        this.notifyObservers();
    }

    public void setState(OrderState state) {
        this.state = state;
        if(this.notify == 1){
            keepTrackOrder observer = new keepTrackOrder();
            observers.add(observer);
        }
        this.notifyObservers();
    }

    public String getStatusMessage() {
        return state.getStatusMessage();
    }



    //End state
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


    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Order(Integer id, ShippingInfo shipInfo, Cart orderDetail, User user, Date dateCreated, Date dateShipped, String status) {
        this.id = id;
        this.shipInfo = shipInfo;
        this.orderDetail = orderDetail;
        this.user = user;
        this.dateCreated = dateCreated;
        this.dateShipped = dateShipped;
        state = new OrderPlaced(this);
        observers = new ArrayList<Observer>();

    }


    @Override
    public void registerObserver(Observer observer) {
        observers.add(observer);

    }

    @Override
    public void removeObserver(Observer observer) {
        observers.remove(observer);
    }

    @Override
    public void notifyObservers() {
        for (Observer observer : observers) {
            observer.updateOrder(this.state,this.getUser());
        }
    }
}