/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToOne;

/**
 *
 * @author leonc
 */
@Entity
@NamedQueries({
    @NamedQuery(name = "Account.searchByName",
            query = "SELECT a FROM Account a WHERE a.username = :input"),
})

public class Account implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    
    private Long id;
    private String name;
    private int age;
    private String password;
    private char gender;
    private String status;
    private String location;
    
    
    @ManyToOne
    private Account salesrep;
    
    @Column(unique = true, name = "USERNAME")
    private String username;

    public Account(String name, int age, String username, String password, char gender, String status, String location, Account salesrep) {
        this.name = name;
        this.age = age;
        this.username = username;
        this.password = password;
        this.gender = gender;
        this.status = status;
        this.location = location;
        this.salesrep = salesrep;
    }
    
    public String getName() {
        return name;
    }

    public Account getSalesrep() {
        return salesrep;
    }

    public void setSalesrep(Account salesrep) {
        this.salesrep = salesrep;
    }

    public void setName(String name) {
        this.name = name;
    }
    

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
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

    public char getGender() {
        return gender;
    }

    public void setGender(char gender) {
        this.gender = gender;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public Account() {
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (id != null ? id.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Account)) {
            return false;
        }
        Account other = (Account) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "model.Account[ id=" + id + " ]";
    }
    
}
