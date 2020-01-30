package inside;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class AddTask
 */
public class AddTask extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String firstname = request.getParameter("firstname");
		String lastname = request.getParameter("lastname");
		String netid = request.getParameter("netid");
		String email = request.getParameter("email");

		if(firstname.isEmpty() || lastname.isEmpty() ||netid.isEmpty() ||email.isEmpty() )
				response.sendRedirect("/my-webapp/display");
		else{
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
					String queryString = "insert into student (firstname , lastname , email , netid) values(?,?,?,?)";
					PreparedStatement statement = connection.prepareStatement(queryString);
					statement.setString(1,firstname);
					statement.setString(2,lastname);
					statement.setString(3,netid);
					statement.setString(4,email);
					statement.executeUpdate();
					statement.close();
					connection.close();
				} catch (SQLException e) {
					e.printStackTrace(System.out);
				}
				response.sendRedirect("/my-webapp/display");
		}
	}

}
