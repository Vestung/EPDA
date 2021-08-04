<%-- 
    Document   : booking
    Created on : Feb 10, 2021, 4:27:27 PM
    Author     : leonc
--%>
<%@page import="model.Account"%>
<%@page import="model.AccountFacade"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@page import="java.util.List"%>
<%@page import="model.EventHall"%>
<%@page import="model.EventHallFacade"%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="java.util.Locale"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%!
    EventHallFacade eventHallFacade;
    AccountFacade accountFacade;
%>
<%  
    HttpSession s = request.getSession();
    Account loginAccount = (Account)s.getAttribute("login");
    Context context = new InitialContext();
    eventHallFacade = (EventHallFacade) context.lookup("java:global/EPDAAssignment/EPDAAssignment-ejb/EventHallFacade");
    accountFacade = (AccountFacade) context.lookup("java:global/EPDAAssignment/EPDAAssignment-ejb/AccountFacade");
    List<EventHall> allHall = eventHallFacade.findAll();
    List<Account> allAccount = accountFacade.findAll();
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Book a Hall</title>
    </head>
    <body>
        <jsp:include page="dashboard.jsp"/>
        <form action="Book" method="POST">
            <table>
                <tr>
                    <td>Hall: </td>
                    <td>
                        <select name="hallname">
                            <%
                               for ( EventHall a :allHall){
                            %>
                            <option> <%= a.getName() %></option>
                            <%
                               }
                            %>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>Date: </td>
                    <td><input type="date" size = 20 name="date" size="20" min="<%=DateTimeFormatter.ofPattern("yyyy-MM-dd", Locale.ENGLISH).format(LocalDateTime.now().plusDays(1))%>"></td>
                </tr>
                <tr>
                    <td>Slot: </td>
                     <td>
                        <select name="slot">
                            <option>1// (08.00 - 09.00) </option>
                            <option>2// (09.00 - 10.00) </option>
                            <option>3// (11.00 - 12.00) </option>
                            <option>4// (12.00 - 13.00) </option>
                            <option>5// (13.00 - 14.00) </option>
                            <option>6// (14.00 - 15.00) </option>
                            <option>7// (15.00 - 16.00) </option>
                            <option>8// (16.00 - 17.00) </option>
                            <option>9// (17.00 - 18.00) </option>
                            <option>10// (18.00 - 19.00) </option>
                            <option>11// (19.00 - 20.00) </option>
                            <option>12// (20.00 - 21.00) </option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>Customer Username: </td>
                    <td>
                        <select name="customer">
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
            </table>
            <p><input type="submit" value="Book Hall"></p>
        </form>
    </body>
</html>
