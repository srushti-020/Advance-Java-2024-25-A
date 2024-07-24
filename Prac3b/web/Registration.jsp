<%-- 
    Document   : Registration
    Created on : 12 Jul, 2024, 12:39:55 PM
    Author     : Admin
--%>

<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8" import="javax.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
       <% 
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            String repassword = request.getParameter("repassword");
            String email = request.getParameter("email");
            String country = request.getParameter("country");

            if (!(password.equals(repassword))) {
                out.println("Password mismatch Reenter all details once again");
                %>
                <jsp:include page="Registration.html"></jsp:include>
                <%
            } 

            else {
                try {
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/test", "root","root");
                    PreparedStatement pstmt = con.prepareStatement("INSERT INTO registration_07 VALUES (?,?,?,?)");
                    pstmt.setString(1, username);
                    pstmt.setString(2, password);
                    pstmt.setString(3, email);
                    pstmt.setString(4, country);

                    int rows = pstmt.executeUpdate();
                    if (rows == 1) {
                        out.println("<h1>Registration successful...</h1>");
                    } else {
                        out.println("<h1>Registration failed!! Try again</h1>");
                        %>
                            <jsp:include page="Registration.html"></jsp:include>
                        <%
                    }

                } catch (Exception e) {
                    out.println("Exception occurred"+e);
                }
            }
            %>

            
                
    </body>
</html>
