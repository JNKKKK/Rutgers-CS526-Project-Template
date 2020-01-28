package inside;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Delete
 */

public class Delete extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String date = request.getParameter("date");
//		System.out.println("the parameter is " + date);
		try {
		     Class.forName("com.mysql.jdbc.Driver" );
		 } catch (Exception e) {
		     System.err.println("ERROR: failed to load HSQLDB JDBC driver");
		     e.printStackTrace(System.out);
		     return;
		 }
		try {
			Connection connection = DriverManager.getConnection("jdbc:mysql://" + 
					"localhost:3306/list" , "boss", "AAAAAbbbbb888;8");
			String queryString = "delete from task where createDate = ?";
			PreparedStatement statement = connection.prepareStatement(queryString);
			statement.setString(1,date);
			statement.executeUpdate();
			statement.close();
			connection.close();
		} catch (SQLException e) {
			e.printStackTrace(System.out);
		}
		response.sendRedirect("/my-webapp/inside/display");
	}
}
