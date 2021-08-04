<%-- 
    Document   : payment
    Created on : Feb 11, 2021, 7:31:31 PM
    Author     : leonc
--%>

<%@page import="model.Booking"%>
<%@page import="model.Booking"%>
<%@page import="java.util.List"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@page import="javax.ejb.EJB"%>
<%@page import="model.BookingFacade"%>
<%@page import="model.Account"%>
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
    int resnum = 0;
    for (Booking a :allBooking){
        if(a.getUser().getId().equals(loginAccount.getId()) && a.getPaymentStatus().equals("Outstanding")){
            resnum++;
        }
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Payment</title>
    </head>
    <body>
        <jsp:include page="dashboard.jsp"/>
        <%
           if (resnum  == 0) {
        %>
        <label><br>You have not made any reservations</label>
        <%
            }else {
        %>
        <form action="Payment" method="POST">
            <table>
                <tr>
                    <td>Hall: </td>
                    <td>
                        <select name="hall" value="text">
                            <%
                               for (Booking a :allBooking){
                                    if(a.getUser().getId().equals(loginAccount.getId()) && a.getPaymentStatus().equals("Outstanding")){
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
                <tr>
                    <td>Feedback: </td>
                    <td><input type="text" name="feedback" style="height:20px; width:1000px"</td>
                </tr>
            </table>
            <p><input type="submit" value="Pay for hall"></p>
        </form>
        <%
            }
        %>
    </body>
</html>
