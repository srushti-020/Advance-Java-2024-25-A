<%-- 
    Document   : Login
    Created on : 12 Jul, 2024, 12:40:12 PM
    Author     : Admin
--%>

<%@page import="java.sql.ResultSet"%>
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
            
            try {
                Class.forName("com.mysql.jdbc.Driver");
                Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/test", "root","root");
                PreparedStatement pst = conn.prepareStatement("select * from registration_07 where username=?");
                pst.setString(1, username);
                ResultSet rs = pst.executeQuery();
                if (rs.next()) {
                    
                    if (rs.getString(2).equals(password)) {
                        out.println("Login successful");
                    } else {
                        out.println("Password incorrect!! Login again");
                        %>
                        <jsp:include page="Login.html"></jsp:include>
                        <%
                    }
                    
                } else {
                    out.println(username+" does not exists. Please Register");
                    %>
                    <jsp:include page="Registration.html"></jsp:include>
                    <%
                }

                

            } catch (Exception e) {
                out.println("Exception occurred"+e);
            }

                
            
        %>
    </body>
</html>
