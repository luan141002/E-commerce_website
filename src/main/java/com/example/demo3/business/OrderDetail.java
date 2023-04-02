package com.example.demo3.business;

import jakarta.persistence.*;

@Entity
@Table(name = "order_detail")
public class OrderDetail {
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "OrderDetail_SEQ")
    @SequenceGenerator(name = "OrderDetail_SEQ")
    @Column(name = "id", nullable = false)
    private Integer id;

    @ManyToOne
    private Product product;

    private Integer quantity;

    private double subtotal;


    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

}