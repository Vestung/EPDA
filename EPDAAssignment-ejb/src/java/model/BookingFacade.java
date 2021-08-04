/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

/**
 *
 * @author leonc
 */
@Stateless
public class BookingFacade extends AbstractFacade<Booking> {

    @PersistenceContext(unitName = "EPDAAssignment-ejbPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public BookingFacade() {
        super(Booking.class);
    }
    
    public Booking searchByID(long x){
        Booking a = null;
        Query q = em.createNamedQuery("Booking.searchByID");
        q.setParameter("input", x);
        List<Booking> result = q.getResultList();
        if(result.size()>0){
            a = result.get(0);
        }
        return a;
    }
    
    public void pay(long id, String feedback){
        Booking a = getEntityManager().find(Booking.class, id);
        a.setPaymentStatus("Paid");
        a.setFeedback(feedback);
        getEntityManager().merge(a);
    }
    
    public void confirm(long id){
    Booking a = getEntityManager().find(Booking.class, id);
    a.setPaymentStatus("Confirmed");
    getEntityManager().merge(a);
    }
    
    public void cancel(long id){
    Booking a = getEntityManager().find(Booking.class, id);
    a.setPaymentStatus("Canceled");
    getEntityManager().merge(a);
    }
    
}
