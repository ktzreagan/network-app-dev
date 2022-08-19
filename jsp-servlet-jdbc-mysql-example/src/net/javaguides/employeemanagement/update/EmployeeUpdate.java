package net.javaguides.employeemanagement.update;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.math.*;
//import java.sql.Statement;

//import net.javaguides.employeemanagement.model.Employee;

public class EmployeeUpdate {
	
	public int updateEmployee(int count) throws ClassNotFoundException {
        String UPDATE_USERS_SQL = "UPDATE employee SET" +
            "  category= ? WHERE id=?";
        //String query = "select count(*) from Cricketers_Data";
        
        int result = 0;
        

        Class.forName("com.mysql.jdbc.Driver");
        
        
        try (Connection connection = DriverManager
            .getConnection("jdbc:mysql://localhost:3306/cosmet?useSSL=false", "root", "");

            // Step 2:Create a statement using connection object
            PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_USERS_SQL)) {

            
            
            for(int i=1;i<=count;i++) {
            double r= Math.floor(Math.random()*(5-1)+1);
            int p = (int)r;
            String category = ""+p+"";
            	
            String id= ""+i+"";
			preparedStatement.setString(1, category);
			preparedStatement.setString(2, id);

            System.out.println(preparedStatement);
            // Step 3: Execute the query or update query
            result = preparedStatement.executeUpdate();
            }
        } catch (SQLException e) {
            // process sql exception
            printSQLException(e);
        }
        return result;
    }

    private void printSQLException(SQLException ex) {
        for (Throwable e: ex) {
            if (e instanceof SQLException) {
                e.printStackTrace(System.err);
                System.err.println("SQLState: " + ((SQLException) e).getSQLState());
                System.err.println("Error Code: " + ((SQLException) e).getErrorCode());
                System.err.println("Message: " + e.getMessage());
                Throwable t = ex.getCause();
                while (t != null) {
                    System.out.println("Cause: " + t);
                    t = t.getCause();
                }
            }
        }
    }
}
