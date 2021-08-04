/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.io.Serializable;
import java.sql.Date;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;

/**
 *
 * @author leonc
 */
@Entity
@NamedQueries({
    @NamedQuery(name = "Booking.searchByID",
            query = "SELECT a FROM Booking a WHERE a.id = :input"),
})
public class Booking implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
   
    private Long id;
    private String handler;
    private Date date;
    private int slot;
    private String paymentstatus;
    private String feedback;
    
    @ManyToOne
    private EventHall hall;
    
    @ManyToOne
    private Account user;

    public Booking() {
    }

    public Booking(String handler,Account user,Date date, int slot, EventHall hall) {
        this.handler = handler;
        this.user = user;
        this.date = date;
        this.slot = slot;
        this.hall = hall;
        this.feedback = "";
        this.paymentstatus = "Outstanding";
    }

    public String getHandler() {
        return handler;
    }

    public void setHandler(String handler) {
        this.handler = handler;
    }

    public Account getUser() {
        return user;
    }

    public void setUser(Account user) {
        this.user = user;
    }

    public int getSlot() {
        return slot;
    }

    public void setSlot(int slot) {
        this.slot = slot;
    }

    public String getFeedback() {
        return feedback;
    }

    public void setFeedback(String feedback) {
        this.feedback = feedback;
    }

    
    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public String getPaymentStatus() {
        return paymentstatus;
    }

    public void setPaymentStatus(String paymentStatus) {
        this.paymentstatus = paymentStatus;
    }

    public EventHall getHall() {
        return hall;
    }

    public void setHall(EventHall hall) {
        this.hall = hall;
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
        if (!(object instanceof Booking)) {
            return false;
        }
        Booking other = (Booking) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "model.Booking[ id=" + id + " ]";
    }
    
}