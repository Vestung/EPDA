package model;

import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;
import model.Account;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2021-03-07T19:13:33")
@StaticMetamodel(Account.class)
public class Account_ { 

    public static volatile SingularAttribute<Account, String> password;
    public static volatile SingularAttribute<Account, Character> gender;
    public static volatile SingularAttribute<Account, Account> salesrep;
    public static volatile SingularAttribute<Account, String> name;
    public static volatile SingularAttribute<Account, String> location;
    public static volatile SingularAttribute<Account, Long> id;
    public static volatile SingularAttribute<Account, Integer> age;
    public static volatile SingularAttribute<Account, String> status;
    public static volatile SingularAttribute<Account, String> username;

}