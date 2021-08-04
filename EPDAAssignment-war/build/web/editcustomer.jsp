<%-- 
    Document   : editcustomer
    Created on : Feb 12, 2021, 11:10:48 PM
    Author     : leonc
--%>

<%@page import="java.util.List"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@page import="model.AccountFacade"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="model.Account"%>
<%!
    AccountFacade accountFacade;
%>
<%  
    HttpSession s = request.getSession();
    Account loginAccount = (Account)s.getAttribute("login");
    Context context = new InitialContext();
    accountFacade = (AccountFacade) context.lookup("java:global/EPDAAssignment/EPDAAssignment-ejb/AccountFacade");
    List<Account> allAccount = accountFacade.findAll();
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Customer Profile</title>
    </head>
    <body>
        <jsp:include page="dashboard.jsp"/>
        <form action="EditCustomer" method="POST">
            <table>
                <tr>
                    <td>Username: </td>
                    <td>
                        <select name="username">
                            <%
                               for ( Account a : allAccount){
                                    if(a.getStatus().equals("Customer") && a.getSalesrep().equals(loginAccount)){
                            %>
                            <option> <%= a.getUsername() %></option>
                            <%
                                    }
                                }                      
                            %>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>Name: </td>
                    <td><input type="text" name="name" size="20" required="required"></td>
                </tr>
                <tr>
                    <td>Age: </td>
                    <td><input type="number" step="1" name="age" size="20" required="required"></td>
                </tr>
                <tr>
                    <td>Password: </td>
                    <td><input type="text" name="password" size="20" required="required"></td>
                </tr>
                <tr>
                    <td>Gender: </td>
                    <td>
                        <select name="gender" required="required">
                            <option>M</option>
                            <option>F</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>Location: </td>
                    <td>
                        <select name="location">
                            <option>Johor</option>
                            <option>Kedah</option>
                            <option>Kelantan</option>
                            <option>Malacca</option>
                            <option>Negeri Sembilan</option>
                            <option>Pahang</option>
                            <option>Penang</option>
                            <option>Perak</option>
                            <option>Perlis</option>
                            <option>Sabah</option>
                            <option>Sarawak</option>
                            <option>Selangor</option>
                            <option>Terengganu</option>
                            <option>Kuala Lumpur</option>
                            <option>Labuan</option>
                            <option>Putrajaya</option>
                        </select>
                    </td>
                </tr>
            </table>
            <p><input type="submit" value="Save Changes"></p>
    </body>
</html>
