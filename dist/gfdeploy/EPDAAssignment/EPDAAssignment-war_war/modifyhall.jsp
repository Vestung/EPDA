<%-- 
    Document   : registerhall
    Created on : Feb 10, 2021, 5:53:20 PM
    Author     : leonc
--%>
<%@page import="model.EventHall"%>
<%@page import="model.EventHallFacade"%>
<%@page import="java.util.List"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%!
    EventHallFacade eventHallFacade;
%>
<%  
    Context context = new InitialContext();
    eventHallFacade = (EventHallFacade) context.lookup("java:global/EPDAAssignment/EPDAAssignment-ejb/EventHallFacade");
    List<EventHall> allHall = eventHallFacade.findAll();
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Modify Hall</title>
    </head>
    <body>
        <jsp:include page="dashboard.jsp"/>
        <form action="ModifyHall" method="POST">
            <table>
                <tr>
                    <td>Hall: </td>
                    <td>
                        <select name="hallname">
                            <%
                               for ( EventHall a : allHall){
                                   
                            %>
                            <option> <%= a.getName() %></option>
                            <%
                                    }                      
                            %>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>Price: </td>
                    <td><input type="number" step="0.01" name="price" size="20"></td>
                </tr>
                <tr>
                    <td>Capacity: </td>
                    <td><input type="number" step="1" name="capacity" size="20"></td>
                </tr>
            </table>
            <p><input type="submit" value="Make Hall Changes"></p>
        </form>
    </body>
</html>
