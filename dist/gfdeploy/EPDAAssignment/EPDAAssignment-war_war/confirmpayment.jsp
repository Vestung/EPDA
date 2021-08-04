<%-- 
    Document   : confirmpayment
    Created on : Feb 16, 2021, 9:43:35 AM
    Author     : leonc
--%>

<%@page import="model.Booking"%>
<%@page import="model.Booking"%>
<%@page import="java.util.List"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
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
        if(a.getHandler().equals(loginAccount.getUsername()) && a.getPaymentStatus().equals("Paid")){
            resnum++;
        }
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Confirm Payment</title>
    </head>
    <body>
        <jsp:include page="dashboard.jsp"/>
        <%
           if (resnum  == 0) {
        %>
        <label><br>No payment to be confirmed</label>
        <%
            }else {
        %>
        <form action="ConfirmPayment" method="POST">
            <table>
                <tr>
                    <td>Hall: </td>
                    <td>
                        <select name="hall" value="text">
                            <%
                               for (Booking a :allBooking){
                                   if(a.getHandler().equals(loginAccount.getUsername()) && a.getPaymentStatus().equals("Paid")){
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
            <p><input type="submit" value="Confirm Customer Payment"></p>
        </form>
        <%
            }
        %>
    </body>
</html>
