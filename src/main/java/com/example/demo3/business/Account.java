package com.example.demo3.business;

import jakarta.persistence.*;

@Entity
@Table(name = "account")
public class Account {
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE)
    @Column(name = "id", nullable = false)
    private Integer id;
    public Account() {

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

    @Column(nullable = false,length = 45)
    private String username;
    @Column(nullable = true,length = 45)
    private String password;

    @Column(length = 15, nullable = false)
    private int type;


    public Account(String username, String password) {
        this.username = username;
        this.password = password;
    }

    public Account(Integer id, String username, String password) {
        this.id = id;
        this.username = username;
        this.password = password;
    }



    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

}