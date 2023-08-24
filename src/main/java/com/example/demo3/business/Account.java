package com.example.demo3.business;

import jakarta.persistence.*;

import java.io.Serializable;

@Entity
@Table(name = "accounts")
public class Account implements Serializable {
    public int getType() {
        return type;
    }

    public void setType(int type) {
        this.type = type;
    }

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    private Integer id;
    public Account() {

    }


    @Column(nullable = false,length = 45)
    private String username;
    @Column(nullable = true,length = 45)
    private String password;


    @Column(length = 15, nullable = true)
    private int type;


    public Account(String username, String password) {
        this.username = username;
        this.password = password;
    }
    public Account(String username, String password,int type) {
        this.username = username;
        this.password = password;
        this.type = 1;
    }

    public Account(Integer id, String username, String password) {
        this.id = id;
        this.username = username;
        this.password = password;

    }
    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }


    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

}