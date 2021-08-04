<%-- 
    Document   : customer
    Created on : Feb 8, 2021, 6:34:40 PM
    Author     : leonc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.Account"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Dashboard</title>
    </head>
    <body>
        <a href="profile.jsp">Profile</a> | 
        <% 
            Account user = (Account)session.getAttribute("login");
            String role = user.getStatus();
            if (role.equals("Staff")){
        %>
        <a href="stafflist.jsp">Staff List</a> | 
        <a href="customerlist.jsp">Customer List</a> |  
        <a href="halllist.jsp">Hall List</a> |
        <a href="salesreport.jsp">Sales Report</a> |
        <a href="register.jsp">Register New Staff/Sales Representative</a> | 
        <a href="registerhall.jsp">Register New Hall</a> |
        <a href="modifyhall.jsp">Modify Hall</a> |
        <%           
            }else if(role.equals("Sales Representative")){
        %>
        <a href="bookingreport.jsp">Customer Booking</a> | 
        <a href="registercustomer.jsp">Register New Customer</a> | 
        <a href="editcustomer.jsp">Modify Customer Account</a> | 
        <a href="booking.jsp">Book Hall</a> |
        <a href="cancelbooking.jsp">Cancel a Booking</a> |
        <a href="confirmpayment.jsp">Confirm Payments</a> |
        <%
            }else if(role.equals("Customer")){
        %>  
        <a href="bookinglist.jsp">Booking History</a> | 
        <a href="payment.jsp">Payment</a> |
        <%
            }
        %>
        <a href="Logout">Logout</a> 
    </body>
</html>
