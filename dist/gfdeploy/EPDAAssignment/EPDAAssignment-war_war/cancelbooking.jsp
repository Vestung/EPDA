<%-- 
    Document   : cancelbooking
    Created on : Feb 16, 2021, 5:14:21 PM
    Author     : leonc
--%>

<%@page import="model.Booking"%>
<%@page import="java.util.List"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@page import="model.BookingFacade"%>
<%@page import="model.Account"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%!
    BookingFacade bookingFacade;
%>
<%
    Context context = new InitialContext();
    bookingFacade = (BookingFacade) context.lookup("java:global/EPDAAssignment/EPDAAssignment-ejb/BookingFacade");
    List<Booking> allBooking = bookingFacade.findAll();
    HttpSession s = request.getSession();
    Account loginAccount = (Account)s.getAttribute("login");
    int resnum = 0;
    for (Booking a :allBooking){
        if(a.getHandler().equals(loginAccount.getUsername()) && a.getPaymentStatus().equals("Outstanding")){
            resnum++;
        }
    }
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cancel Booking</title>
    </head>
    <body>
        <jsp:include page="dashboard.jsp"/>
        <%
           if (resnum  == 0) {
        %>
        <label><br>No Reservations to cancel</label>
        <%
            }else {
        %>
        <form action="Cancel" method="POST">
            <table>
                <tr>
                    <td>Hall: </td>
                    <td>
                        <select name="hall" value="text">
                            <%
                               for (Booking a :allBooking){
                                   if(a.getHandler().equals(loginAccount.getUsername()) && a.getPaymentStatus().equals("Outstanding")){
                            %>
                            <option><%=a.getId()%>// <%=a.getHall().getName()%> //<%=a.getSlot()%>//Amount(<%=a.getHall().getPaymentAmount()%>) </option>
                            <%
                                   }
                                }
                            %>
                        </select>
                        <label><br>Booking ID//Hall Name//Slot//Amount to pay</label>
                    </td>
                </tr>
            </table>
            <p><input type="submit" value="Cancel Booking"></p>
        </form>
        <%
            }
        %>
    </body>
</html>
