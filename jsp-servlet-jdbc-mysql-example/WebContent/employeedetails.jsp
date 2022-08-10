<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
 pageEncoding="ISO-8859-1"%>
<%@page import="net.javaguides.employeemanagement.dao.*"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
 <h1>User successfully registered!</h1>
 <%
 try{
	 Class.forName("com.mysql.jdbc.Driver").newInstance();
	 Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/employee?useSSL=false", "root", "");
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
    	<tr><th>id</th> <th>first_name</th> <th>last_name</th> <th>username</th> <th>password</th> <th>address</th> <th>contact</th> <%
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
</body>
</html>