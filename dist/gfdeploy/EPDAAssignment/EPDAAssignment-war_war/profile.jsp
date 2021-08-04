<%-- 
    Document   : profile
    Created on : Feb 9, 2021, 6:11:28 PM
    Author     : leonc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="model.Account"%>
<%Account user = (Account)session.getAttribute("login");%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Profile</title>
    </head>
    <body>
        <jsp:include page="dashboard.jsp"/>
        <form action="Profile" method="POST">
            <table>
                <tr>
                    <td>Username: </td>
                    <td><%=user.getUsername()%></td>
                </tr>
                <tr>
                    <td>Name: </td>
                    <td><input type="text" name="name" size="20" required="required" value="<%=user.getName()%>"></td>
                </tr>
                <tr>
                    <td>Age: </td>
                    <td><input type="text" name="age" size="20" required="required" value="<%=user.getAge()%>"></td>
                </tr>
                <tr>
                    <td>Password: </td>
                    <td><input type="text" name="password" size="20" required="required" value="<%=user.getPassword()%>"></td>
                </tr>
                <tr>
                    <td>Gender: </td>
                    <td>
                        <select required="required" name="gender">
                            <option value="<%=user.getGender()%>" selected="selected" hidden=""hidden><%=user.getGender()%></option>
                            <option>M</option>
                            <option>F</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>Location: </td>
                    <td>
                        <select required="required" name="location">
                            <option value="<%=user.getLocation()%>" selected="selected" hidden=""hidden><%=user.getLocation()%></option>
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
            <p><input type="submit" value="Save Changes"></p>
    </body>
</html>
