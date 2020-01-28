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
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class Edit
 */

public class Edit extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		String date = request.getParameter("date");
		HttpSession session = request.getSession(false);
		String name = (String)session.getAttribute("name");
		String priority = request.getParameter("priority");
		String task = request.getParameter("task");
		if(task == null || priority == null || task.isEmpty() || priority.isEmpty()){
			String link = "/my-webapp/inside/showEditTask.jsp?date=" + date;
			response.sendRedirect(link);
		} else {
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
				String queryString = "update task set thing = ?, priority = ? where createDate = ? and name = ?";
				PreparedStatement statement = connection.prepareStatement(queryString);
				statement.setString(1,task);
				statement.setString(2,priority);
				statement.setString(3,date);
				statement.setString(4,name);
				System.out.println("task is " + task);
				System.out.println("p is " + priority);
				System.out.println("time is " + date);
				System.out.println("name is " + name);
				statement.executeUpdate();
				statement.close();
				connection.close();
				response.sendRedirect("/my-webapp/inside/display");
			} catch (SQLException e) {
				e.printStackTrace(System.out);
			}
		}
	}
	
}
