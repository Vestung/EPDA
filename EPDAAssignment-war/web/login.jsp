<%-- 
    Document   : login
    Created on : Feb 8, 2021, 6:09:14 PM
    Author     : leonc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
    </head>
    <body>
        <form action="Login" method="POST">
            <table>
                <tr>
                    <td>Username: </td>
                    <td><input type="text" name="username" size="20"></td>
                </tr>
                <tr>
                    <td>Password: </td>
                    <td><input type="password" name="password" size="20"></td>
                </tr>
            </table>
            <p><input type="submit" value="Login"></p>
        </form>
    </body>
</html>
