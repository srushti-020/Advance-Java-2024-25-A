<%@page import="java.util.Iterator, java.util.List, javax.naming.InitialContext, ejb.ShoppingCart"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%!
private static ShoppingCart cart;
public void jspInit() {
try {
InitialContext ic = new InitialContext();
cart = (ShoppingCart) ic.lookup("java:global/ShoppingCart/ShoppingCart");
} catch (Exception ex) {
System.out.println("Could not create cart bean." + ex.getMessage());
}
}
%>
<%
if(request.getParameter("txtCustomerName") != null) {
cart.initialize(request.getParameter("txtCustomerName"));
} else {
cart.initialize("Guest");
}
if (request.getParameter("btnRmvBook") != null) {
String books[] = request.getParameterValues("chkBook");
if (books != null) {
for (int i=0; i<books.length; i++) {
cart.removeBook(books[i]);
}
}
}
if (request.getParameter("btnAddBook") != null) {
String books[] = request.getParameterValues("chkBook");
if (books != null) {
for (int i=0; i<books.length; i++) {
cart.addBook(books[i]);
}
}
}
%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Shopping Cart</title>
</head>
<body style="background-color: pink;">
<h1 style="text-align: center;">Books For Sale</h1><br>
<form name="frmBooks" method="post">
<table style="background-color: pink; width: 100%; padding: 1px; border-spacing: 1px;">
<tr style="background-color: pink;">
<td style="width: 70%">
<table style="padding: 1px 1px 1px 1px; border-spacing: 1px; border: 2px solid maroon; width: 400px;">
<tr>
<td style="border: 2px solid maroon;">Customer</td>
<td style="border: 2px solid maroon;">
<input type="text" name="txtCustomerName" value=<%= request.getParameter("txtCustomerName")%> />
</td>
</tr>
<tr style="background-color: maroon;">
<th style="text-align: left; width: 340px; color: white; border: 2px solid maroon;" colspan="2">
<b>Book Titles</b>
</th>
</tr>
<tr>
<td style="border: 2px solid maroon;">
<input type="checkbox" name="chkBook" value="Struts 2.0 For Beginners">
</td>
<td style="width: 340px; border: 2px solid maroon;">Struts 2.0 For Beginners</td>
</tr>
<tr>
<td style="border: 2px solid maroon;">
<input type="checkbox" name="chkBook" value="Oracle 11g For Professionals">
</td>
<td style="width: 340px; border: 2px solid maroon;">Oracle 11g For Professionals</td>
</tr>
<tr>
<td style="border: 2px solid maroon;">
<input type="checkbox" name="chkBook" value="Hibernate 3 For Beginners">
</td>
<td style="width: 340px; border: 2px solid maroon;">Hibernate 3 For Beginners</td>
</tr>
<tr>
<td style="border: 2px solid maroon;">
<input type="checkbox" name="chkBook" value="Java Persistence API In EJB 3 For Beginners">
</td>
<td style="width: 340px; height: 24px; border: 2px solid maroon;">Java Persistence API In EJB 3 For Beginners</td>
</tr>

<tr>
 <td colspan="4" style="border: 2px solid maroon;">
 <table style="background-color: pink; text-align: center;">
 <tr>
 <td style="text-align: center;">
 <input type='submit' value='Add To My Basket' name='btnAddBook'>
 </td>
<td style="text-align: center;">
 <input type='submit' value='Remove From My Basket' name='btnRmvBook'>
 </td>
 </tr>
 </table>
 </td>
 </tr>
 </table>
 </td>
 <td>
 <table style="border: 1px solid blue; width: 300px; height: 180px; text-align: right;">
 <tr>
 <td style="text-align: center; background-color: lightblue; border: 1px solid blue; height: 20px;">Basket</td>
 </tr>
 <%
 if(cart!=null){
 List<String> bookList = cart.getContents();
 Iterator iterator = bookList.iterator();
 while (iterator.hasNext()) {
 String title = (String) iterator.next();
 %>
 <tr>
 <td style="text-align: left; background-color: lightblue; border: 1px solid blue;"><%= title %></td>
 </tr>
 <%
 }
 }
 %>
 </table>
 </td>
 </tr>
 </table>
 </form>
 </body>
</html>
