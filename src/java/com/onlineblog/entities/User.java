
package com.onlineblog.entities;
import java.sql.*;

public class User {
    
    private int id;
    private String name;
    private String email;
    private String number;
    private String gender;
    private String password;
    private Timestamp dataTime;
    private String query;
     
    public User(int id, String name, String email, String password,String number,String gender, Timestamp dataTime) {
        this.id = id;
        this.name = name;
        this.email = email;
        this.number=number;
        this.gender=gender;
        this.password = password;
        this.dataTime = dataTime;
    }
    
    public User() {
    }

    public User(String name, String email,String number,String gender ,String password) {
        this.name = name;
        this.email = email;
        this.number=number;
        this.gender=gender;
        this.password = password;
    }

    public User(int id,String name, String email, String number, String query) {
        this.id=id;
        this.name = name;
        this.email = email;
        this.number = number;
        this.query = query;
    }

    public User(int id, String name, String email, String number, String gender, String password) {
        this.id = id;
        this.name = name;
        this.email = email;
        this.number = number;
        this.gender = gender;
        this.password = password;
    }

    public User(String name, String email, String number, String query) {
        this.name = name;
        this.email = email;
        this.number = number;
        this.query = query;
    }
    

    public String getQuery() {
        return query;
    }

    public void setQuery(String query) {
        this.query = query;
    }
    

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Timestamp getDataTime() {
        return dataTime;
    }

    public void setDataTime(Timestamp dataTime) {
        this.dataTime = dataTime;
    }

    public String getNumber() {
        return number;
    }

    public void setNumber(String number) {
        this.number = number;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }
   
    
    
}
