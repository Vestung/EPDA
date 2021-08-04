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
public class EventHallFacade extends AbstractFacade<EventHall> {

    @PersistenceContext(unitName = "EPDAAssignment-ejbPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public EventHallFacade() {
        super(EventHall.class);
    }
    public EventHall searchByName(String x){
        EventHall a = null;
        Query q = em.createNamedQuery("EventHall.searchByName");
        q.setParameter("input", x);
        List<EventHall> result = q.getResultList();
        if(result.size()>0){
            a = result.get(0);
        }
        return a;
    }
    public void updateHall(long id, int capacity, double price){
        EventHall a = getEntityManager().find(EventHall.class, id);
        a.setCapacity(capacity);
        a.setPaymentAmount(price);
        getEntityManager().merge(a);
    }
    
}
