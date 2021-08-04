package model;

import java.sql.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;
import model.Account;
import model.EventHall;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2021-03-07T19:13:33")
@StaticMetamodel(Booking.class)
public class Booking_ { 

    public static volatile SingularAttribute<Booking, Date> date;
    public static volatile SingularAttribute<Booking, String> feedback;
    public static volatile SingularAttribute<Booking, String> handler;
    public static volatile SingularAttribute<Booking, String> paymentstatus;
    public static volatile SingularAttribute<Booking, EventHall> hall;
    public static volatile SingularAttribute<Booking, Long> id;
    public static volatile SingularAttribute<Booking, Integer> slot;
    public static volatile SingularAttribute<Booking, Account> user;

}