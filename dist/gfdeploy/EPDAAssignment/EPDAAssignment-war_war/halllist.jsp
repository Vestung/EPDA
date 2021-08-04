<%-- 
    Document   : halllist
    Created on : Feb 28, 2021, 1:06:50 PM
    Author     : leonc
--%>
<%@page import="model.EventHall"%>
<%@page import="java.util.List"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@page import="model.EventHallFacade"%>
<%!
    EventHallFacade eventHallFacade;
%>
<%  
    Context context = new InitialContext();
    eventHallFacade = (EventHallFacade) context.lookup("java:global/EPDAAssignment/EPDAAssignment-ejb/EventHallFacade");
    List<EventHall> allHall = eventHallFacade.findAll();
    int total = 0;
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Staff List</title>
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
                    <th>Name</th>
                    <th>Capacity</th>
                    <th>Price</th>
                </tr>
                <%
                    for ( EventHall a : allHall){
                %>
                <tr>
                    <td> <%= a.getId() %> </td>
                    <td> <%= a.getName() %> </td>
                    <td> <%= a.getCapacity() %> </td>
                    <td> <%= a.getPaymentAmount() %> </td>
                </tr>
                <%          
                        total++;
                        }
                    
                %>
            </table>
        </form>
            <br>
            <table>
                Total Number of Halls: <%= total %>
            </table>
            <br>
    </body>
</html>