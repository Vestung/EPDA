<%-- 
    Document   : bookinglist
    Created on : Feb 12, 2021, 9:44:15 PM
    Author     : leonc
--%>

<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@page import="model.Account"%>
<%@page import="model.Booking"%>
<%@page import="java.util.List"%>
<%@page import="model.BookingFacade"%>
<%@page import="javax.ejb.EJB"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%!
    BookingFacade bookingFacade;
%>
<%
    Context context = new InitialContext();
    bookingFacade = (BookingFacade) context.lookup("java:global/EPDAAssignment/EPDAAssignment-ejb/BookingFacade");
    List<Booking> allBooking = bookingFacade.findAll();
    HttpSession s = request.getSession();
    Account loginAccount = (Account)s.getAttribute("login");
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Booking History</title>
        <style>
            table,
            th,
            td{
                padding: 12px;
                border: 1px solid black;
                border-collapse: collapse;
            }
            </style>
    </head>
    <body>
        <jsp:include page="dashboard.jsp"/>
        <pre>
        </pre>
        <form>
            <table>
                <tr>
                    <th>ID</th>
                    <th>Hall Name</th>
                    <th>Date</th>
                    <th>Slot</th>
                    <th>Feedback</th>
                    <th>Payment Amount</th>
                    <th>Payment Status</th>
                    <th>Handler</th>
                </tr>
                <%
                    for ( Booking a :allBooking){
                        if(a.getUser().getId() == loginAccount.getId()){
                %>
                <tr>
                    <td> <%= a.getId() %> </td>
                    <td> <%= a.getHall().getName() %> </td>
                    <td> <%= a.getDate() %> </td>
                    <td> <%= a.getSlot() %> </td>
                    <td> <%= a.getFeedback() %> </td>
                    <td> <%= a.getHall().getPaymentAmount() %></td>
                    <td> <%= a.getPaymentStatus() %> </td>
                    <td> <%= a.getHandler() %> </td>
                </tr>
                <%
                        }
                    }
                %>
            </table>
        </form>
    </body>
</html>
