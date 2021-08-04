<%-- 
    Document   : registerhall
    Created on : Feb 10, 2021, 5:53:20 PM
    Author     : leonc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register Hall</title>
    </head>
    <body>
        <jsp:include page="dashboard.jsp"/>
        <form action="RegisterHall" method="POST">
            <table>
                <tr>
                    <td>Hall: </td>
                    <td><input type="text" name="name" size="20"></td>
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
            <p><input type="submit" value="Register New Hall"></p>
        </form>
    </body>
</html>
