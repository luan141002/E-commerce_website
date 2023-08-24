package com.example.demo3.business;

import jakarta.persistence.*;
import org.hibernate.Hibernate;

import java.io.Serializable;
import java.util.List;
import java.util.Objects;

import static jakarta.persistence.FetchType.EAGER;

@Entity
@Table(name = "products")
public class Product implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    private Integer id;

    private String proName;

    private String proCategory;

    private Double proPrice;

    private String proImage;

    private int proRank;

    public int getProStatus() {
        return proStatus;
    }

    public void setProStatus(int proStatus) {
        this.proStatus = proStatus;
    }

    private String proDes;
    private String proBrand;
    private int proStatus;
    private int proquan;

    public String getProBrand() {
        return proBrand;
    }

    public void setProBrand(String proBrand) {
        this.proBrand = proBrand;
    }

    public String getProCollection() {
        return proCollection;
    }

    public void setProCollection(String proCollection) {
        this.proCollection = proCollection;
    }

    private String proCollection;

/*    public List<Size> getProSize() {
        return proSize;
    }

    public void setProSize(List<Size> proSize) {
        this.proSize = proSize;
    }

    @OneToMany(fetch = EAGER, cascade = CascadeType.ALL)
    private List<Size> proSize;*/

    public int getProRank() {
        return proRank;
    }

    public void setProRank(int proRank) {
        this.proRank = proRank;
    }



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

    public int getProquan() {
        return proquan;
    }

    public void setProquan(int proquan) {
        this.proquan = proquan;
    }
}