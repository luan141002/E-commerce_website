package com.example.demo3.business;

import jakarta.persistence.*;
import org.hibernate.Hibernate;

import java.io.Serializable;
import java.util.Objects;

@Entity
@Table(name = "Product")
public class Product implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    private Integer id;
    @Column(nullable = true,length = 45)
    private String proName;
    @Column(nullable = true,length = 45)
    private String proCategory;
    @Column(nullable = true,length = 45)
    private Double proPrice;
    @Column(nullable = true,length = 45)
    private String proImage;

    public int getProRank() {
        return proRank;
    }

    public void setProRank(int proRank) {
        this.proRank = proRank;
    }

    @Column(nullable = true,length = 45)
    private int proRank;



    //Constructor

    public Product(Integer id, String proName, String proCategory, Double proPrice, String proImage, String proDes,int proRank) {
        this.id = id;
        this.proName = proName;
        this.proCategory = proCategory;
        this.proPrice = proPrice;
        this.proImage = proImage;
        this.proDes = proDes;
        this.proRank = proRank;
    }

    public Product() {

    }

    // Getter and Setter
    public String getProName() {
        return proName;
    }

    public void setProName(String proName) {
        this.proName = proName;
    }

    public String getProCategory() {
        return proCategory;
    }

    public void setProCategory(String proCategory) {
        this.proCategory = proCategory;
    }

    public Double getProPrice() {
        return proPrice;
    }

    public void setProPrice(Double proPrice) {
        this.proPrice = proPrice;
    }

    public String getProImage() {
        return proImage;
    }

    public void setProImage(String proImage) {
        this.proImage = proImage;
    }

    public String getProDes() {
        return proDes;
    }

    public void setProDes(String proDes) {
        this.proDes = proDes;
    }

    @Column(nullable = true,length = 45)
    private String proDes;



    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || Hibernate.getClass(this) != Hibernate.getClass(o)) return false;
        Product product = (Product) o;
        return getId() != null && Objects.equals(getId(), product.getId());
    }


}