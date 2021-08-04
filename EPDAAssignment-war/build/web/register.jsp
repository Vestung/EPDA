<%-- 
    Document   : register
    Created on : Jan 14, 2021, 5:20:31 PM
    Author     : guan.kiat
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.Account"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register</title>
    </head>
    <body>
        <jsp:include page="dashboard.jsp"/>
        <form action="Register" method="POST">
            <table>
                <tr>
                    <td>Name: </td>
                    <td><input type="text" name="name" size="20"></td>
                </tr>
                <tr>
                    <td>Age: </td>
                    <td><input type="number" step="1" name="age" size="20"></td>
                </tr>
                <tr>
                    <td>Username: </td>
                    <td><input type="text" name="username" size="20"></td>
                </tr>
                <tr>
                    <td>Password: </td>
                    <td><input type="text" name="password" size="20"></td>
                </tr>
                <tr>
                    <td>Gender: </td>
                    <td>
                        <select name="gender">
                            <option>M</option>
                            <option>F</option>
                        </select>
                    </td>
                </tr>
                    <td>Role: </td>
                    <td><select name="role">
                            <option>Staff</option>
                            <option>Sales Representative</option>
                        </select>
                    </td>
                <tr>
                    <td>Location: </td>
                    <td>
                        <select name="location">
                            <option>Johor</option>
                            <option>Kedah</option>
                            <option>Kelantan</option>
                            <option>Malacca</option>
                            <option>Negeri Sembilan</option>
                            <option>Pahang</option>
                            <option>Penang</option>
                            <option>Perak</option>
                            <option>Perlis</option>
                            <option>Sabah</option>
                            <option>Sarawak</option>
                            <option>Selangor</option>
                            <option>Terengganu</option>
                            <option>Kuala Lumpur</option>
                            <option>Labuan</option>
                            <option>Putrajaya</option>
                        </select>
                    </td>
                </tr>
            </table>
            <p><input type="submit" value="Register"></p>
        </form>
    </body>
</html>
