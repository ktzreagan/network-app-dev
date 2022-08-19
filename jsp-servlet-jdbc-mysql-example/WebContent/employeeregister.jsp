<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
 pageEncoding="ISO-8859-1"%>
 <%@page import="net.javaguides.employeemanagement.dao.*"%>
 <%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>HR Management</title>
<link rel="stylesheet" href="generalstyle.css">
</head>
<body>
 <jsp:include page="adminHeader.jsp"></jsp:include>
 <div class="tr-login">
  <h1>Employee Register Form</h1>
  <form action="<%= request.getContextPath() %>/register" method="post">
   First Name<br>
   <div class="inputfeild">
     <input type="text" name="firstName" /><br>
   </div>
    Last Name<br>
    <div class="inputfeild">
    <input type="text" name="lastName" /><br>
    </div>
    UserName<br>
    <div class="inputfeild">
    <input type="text" name="username" /><br>
    </div>
    Category<br>
    <div class="inputfeild">
    <input type="text" name="category" /><br>
    </div>
    Address<br>
    <div class="inputfeild">
    <input type="text" name="address" /><br>
    </div>
    Contact No<br>
    <div class="inputfeild">
    <input type="text" name="contact" /><br>
    </div>
    <div class="s_bttn">
   <input type="submit" value="Submit" />
    </div> 
    <br>
    <br>
</form>
 </div>
 <br>
 <br>
 <div>
	<%
 try{
	 Class.forName("com.mysql.jdbc.Driver").newInstance();
	 Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cosmet?useSSL=false", "root", "");
     String sql = "select * from employee;";
     PreparedStatement stmt = con.prepareStatement(sql);
     ResultSet rs = stmt.executeQuery();
     if(rs.next()==false)
     {
    	 out.println("No records found");
     }
     else
     {%>
    	<table>
    	<tr><th>id</th> <th>first_name</th> <th>last_name</th> <th>username</th> <th>category</th> <th>address</th> <th>contact</th> <%
    do
    {%>
    	<tr><td><%= rs.getString(1) %></td><td><%= rs.getString(2) %></td><td><%= rs.getString(3) %></td><td><%= rs.getString(4) %></td><td><%= rs.getString(5) %></td><td><%= rs.getString(6) %></td><td><%= rs.getString(7) %></td></tr><%
    }while(rs.next());%>
    </table><%
     }
     
 } catch (Exception e) {
     
     e.getStackTrace();
 }
 %> 
 </div>
 <form action="<%= request.getContextPath() %>/update" method="post">
<div class="s_bttn">
 <input type="submit" value="Reallocate" />
</div> 
</form>
</body>
</html>