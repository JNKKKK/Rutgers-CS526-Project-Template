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
		String task = request.getParameter("task");
		String pri = request.getParameter("priority");
		int priority;

		if(task.isEmpty() || !pri.matches("[1-9][0-9]*"))
				response.sendRedirect("/my-webapp/inside/display");
		else{
				priority = Integer.parseInt(pri);
				String name = (String)(request.getSession(false).getAttribute("name"));
				Date date = new Date();
				
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
					String queryString = "insert into task values(?,?,?,?)";
					PreparedStatement statement = connection.prepareStatement(queryString);
					statement.setString(1,name);
					statement.setString(2,task);
					statement.setString(3,Integer.toString(priority));
					statement.setString(4,date.toString().replace(' ', '_'));
					statement.executeUpdate();
					statement.close();
					connection.close();
				} catch (SQLException e) {
					e.printStackTrace(System.out);
				}
				response.sendRedirect("/my-webapp/inside/display");
		}
	}

}
