<%-- 
    Document   : stafflist
    Created on : Feb 16, 2021, 5:32:27 PM
    Author     : leonc
--%>
<%@page import="java.util.List"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@page import="model.AccountFacade"%>
<%@page import="model.Account"%>
<%!
    AccountFacade accountFacade;
%>
<%
    Context context = new InitialContext();
    accountFacade = (AccountFacade) context.lookup("java:global/EPDAAssignment/EPDAAssignment-ejb/AccountFacade");
    List<Account> allAccount = accountFacade.findAll();
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
                    <th>Username</th>
                    <th>Password</th>
                    <th>Age</th>
                    <th>Gender</th>
                    <th>Location</th>
                    <th>Sales Rep</th>
                </tr>
                <%
                    for ( Account a : allAccount){
                        if(a.getStatus().equals("Customer")){
                %>
                <tr>
                    <td> <%= a.getId() %> </td>
                    <td> <%= a.getName() %> </td>
                    <td> <%= a.getUsername() %> </td>
                    <td> <%= a.getPassword() %> </td>
                    <td> <%= a.getAge() %> </td>
                    <td> <%= a.getGender() %></td>
                    <td> <%= a.getLocation() %> </td>
                    <td> <%= a.getSalesrep().getName() %> </td>
                </tr>
                <%          
                        total++;
                        }
                    }
                %>
            </table>
        </form>
            <br>
            <table>
                Total Number of Customers: <%= total %>
            </table>
            <br>
            <table>
        <form action ="GetGender" method="POST"> <input type ="submit" value="Get Gender Analyzation"> | </form>
        <form action ="GetLocation" method="POST"> <input type ="submit" value="Get Location Analyzation"> | </form>
        <form action ="GetAge" method="POST"> <input type ="submit" value="Get Age Analyzation"> </form>
            </table>
    </body>
</html>
