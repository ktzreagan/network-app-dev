package net.javaguides.employeemanagement.controller2;

import java.io.IOException;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import net.javaguides.employeemanagement.update.EmployeeUpdate;
//import net.javaguides.employeemanagement.model.Employee;


@WebServlet("/update")
public class EmployeeUpdateServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    private EmployeeUpdate employeeUpdate = new EmployeeUpdate();

   // public void init() {
     //   employeeDao = new EmployeeDao();
    //}
    public EmployeeUpdateServlet() {
    	super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    	    throws ServletException, IOException {
    	response.getWriter().append("Served at: ").append(request.getContextPath());
    
    	RequestDispatcher dispatcher = request.getRequestDispatcher("employeeregister.jsp");
    	dispatcher.forward(request, response);
    
    }
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {

//        String category = request.getParameter("category");
    	int count= 0;
    	 try { 
			DriverManager.registerDriver(new com.mysql.jdbc.Driver());
         //Getting the connection
         String mysqlUrl = "jdbc:mysql://localhost/cosmet";
         Connection con = DriverManager.getConnection(mysqlUrl, "root", "");
         System.out.println("Connection established......");
         //Creating the Statement object
         Statement stmt = con.createStatement();
         //Query to get the number of rows in a table
         String query = "select count(*) from employee";
         //Executing the query
         ResultSet rs = stmt.executeQuery(query);
         //Retrieving the result
         rs.next();
         count = rs.getInt(1);
    } catch (SQLException e1) {
		// TODO Auto-generated catch block
		e1.printStackTrace();
	}
    	

        try {
            employeeUpdate.updateEmployee(count);
        } catch (ClassNotFoundException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

        RequestDispatcher dispatcher = request.getRequestDispatcher("employeeregister.jsp");
    	dispatcher.forward(request, response);
    }
}