package register;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


/**
 * Servlet implementation class Register
 */


public class Register extends HttpServlet {
	@Override
	public void init() throws ServletException {
		 try {
		     Class.forName("com.mysql.jdbc.Driver" );
		 } catch (Exception e) {
		     System.err.println("ERROR: failed to load HSQLDB JDBC driver");
		     e.printStackTrace(System.out);
		     return;
		 }
		try {
			Connection connection = DriverManager.getConnection("jdbc:mysql://" + 
					"localhost/list" , "boss", "AAAAAbbbbb888;8");
			Statement statement = connection.createStatement();
			statement.executeUpdate("create table accounts (name varchar(32),"
					+ " password varchar(32))");
			statement.executeUpdate("create table task (name varchar(32),"
					+ " thing varchar(60), priority integer, createDate varchar(80),primary key (createDate))");
			statement.close();
			connection.close();
		} catch (SQLException e) {
			e.printStackTrace(System.out);
		}
		
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
			
			String name = request.getParameter("name");
			String password = request.getParameter("password");
			String password2 = request.getParameter("password2");
			boolean exists = false;

			
			try {
			    Class.forName("com.mysql.jdbc.Driver" );

				Connection connection = DriverManager.getConnection("jdbc:mysql://" + 
						"localhost:3306/list" , "boss", "AAAAAbbbbb888;8");

				Statement statement = connection.createStatement();

				ResultSet resultSet = statement.executeQuery("select name from accounts");

				while (resultSet.next()){
					if(resultSet.getString(1).equals(name))
						exists = true;
				}
				resultSet.close();
				statement.close();
				connection.close();

			} catch (SQLException e) {
				e.printStackTrace(System.out);
			} catch (Exception e) {
			     System.err.println("ERROR: failed to load HSQLDB JDBC driver");
			     e.printStackTrace(System.out);
			}
			
			
				
		if(password == null || password.isEmpty() || name == null || name.isEmpty() || !password.equals(password2)){
			response.sendRedirect(request.getContextPath() + "/wrongRegister.jsp");
		} else if(exists){
			response.sendRedirect(request.getContextPath() + "/userExists.jsp");
		} else {
			try {
			    Class.forName("com.mysql.jdbc.Driver" );

				Connection connection = DriverManager.getConnection("jdbc:" +
						"mysql://localhost:3306/list" , "boss", "AAAAAbbbbb888;8");
				PreparedStatement statement = connection.prepareStatement("insert into accounts(name,password) values(?, ?)");

				statement.setString(1, name);
				statement.setString(2, password);
				
				statement.executeUpdate();
				
				statement.close();
				connection.close();
			} catch (SQLException e) {
				e.printStackTrace(System.out);
			} catch (Exception e) {
			     System.err.println("ERROR: failed to load HSQLDB JDBC driver");
			     e.printStackTrace(System.out);
			}
			response.sendRedirect(request.getContextPath() + "/login.jsp");
		}
	}
}

