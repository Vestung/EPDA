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
public class AccountFacade extends AbstractFacade<Account> {

    @PersistenceContext(unitName = "EPDAAssignment-ejbPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public AccountFacade() {
        super(Account.class);
    }
    public Account searchByName(String x){
        Account a = null;
        Query q = em.createNamedQuery("Account.searchByName");
        q.setParameter("input", x);
        List<Account> result = q.getResultList();
        if(result.size()>0){
            a = result.get(0);
        }
        return a;
    }  
    
    public void updateProfile(long id, String name, int age,String password, char gender, String location){
        Account a = getEntityManager().find(Account.class, id);
        a.setName(name);
        a.setAge(age);
        a.setPassword(password);
        a.setGender(gender);
        a.setLocation(location);
        getEntityManager().merge(a);
    }
}


