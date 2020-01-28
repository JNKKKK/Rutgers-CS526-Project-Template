package login;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class RequestLogin
 */
@WebServlet("/RequestLogin")
public class RequestLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name = request.getParameter("name");
		String password = request.getParameter("password");
		String remember = request.getParameter("remember");
		boolean success = false;
		if(password == null || password.isEmpty() || name == null || name.isEmpty()){
			response.sendRedirect(request.getContextPath() + "/loginFault.jsp");
		} else {
			try {
			    Class.forName("com.mysql.jdbc.Driver" );
			
				Connection connection = DriverManager.getConnection("jdbc:mysql://" + 
						"localhost:3306/list" , "boss", "AAAAAbbbbb888;8");
								
				Statement statement = connection.createStatement();
								
				ResultSet resultSet = statement.executeQuery("select name, password from accounts");
								
				while (resultSet.next()){
					if(resultSet.getString(1).equals(name)){
						if(resultSet.getString(2).equals(password)){
							success = true;
							break;
						}
					}
				}
				resultSet.close();
				statement.close();
				connection.close();
				if(success){
					request.getSession().setAttribute("name", name);
					if(remember == null){
						request.getSession().setMaxInactiveInterval(1200);
					} else {
						request.getSession().setMaxInactiveInterval(86400 * 7);
					}
					response.sendRedirect(request.getContextPath() + "/inside/display");				
				} else {
					response.sendRedirect(request.getContextPath() + "/loginFault.jsp");					
				}
			} catch (SQLException e) {
				e.printStackTrace(System.out);
			} catch (Exception e) {
				e.printStackTrace(System.out);
			}
		}
	}
}
