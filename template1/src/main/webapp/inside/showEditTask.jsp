<%@page import = "java.io.IOException" %>
<%@page import = "java.sql.Connection" %>
<%@page import = "java.sql.DriverManager" %>
<%@page import = "java.sql.PreparedStatement" %>
<%@page import = "java.sql.ResultSet" %>
<%@page import = "java.sql.SQLException" %>
<%@page import = "java.sql.Statement" %>


<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="utf-8">
	<title>Makarovski's Awesome TODO List</title>
	<link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.0.0/css/bootstrap.min.css" rel="stylesheet">
	<link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.0.0/css/bootstrap-theme.min.css"
		rel="stylesheet">
	<style type="text/css">
		body {
			padding-bottom: 40px;
			background-color: #f5f5f5;
		}
	</style>

</head>

<body>
	<nav class="navbar navbar-default">
		<div class="container-fluid">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar"
					aria-expanded="false" aria-controls="navbar">
					<span class="sr-only">Toggle navigation</span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="">A Very Simple TodoList App</a>
			</div>
			<div id="navbar" class="navbar-collapse collapse">
				<ul class="nav navbar-nav">
					<li><a href="/my-webapp/about">About</a></li>
					<li><a href="/my-webapp/inside/display">My TODO List</a></li>
				</ul>
				<ul class="nav navbar-nav navbar-right">
					<li><a href="/my-webapp/login">Logout</a></li>
				</ul>
			</div>
		</div>
	</nav>



	<div class="container">

		<div class="row">
			<div class="span8 offset2">

				<%String name = (String)session.getAttribute("name");%>
				<%out.println("<div class=\"page-header text-center\"><h1>"
						+ name + "'s TODO List</h1></div>");%>

			</div>
		</div>

		<div class="row">
			<div class="span10 offset1">
				<table class="table table-striped table-bordered table-hover" border="1">
					<thead>
						<tr>
							<th style='text-align:center;vertical-align:middle'>Task</th>
							<th style='text-align:center;vertical-align:middle'>Priority</th>
							<th style='text-align:center;vertical-align:middle'>Created Date</th>
						</tr>
					</thead>
					<tbody>

						<%		String date = request.getParameter("date");
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
									
									String queryString = "select thing, priority " +
											"from task where name = ? and createDate = ?";
									PreparedStatement statement = connection.prepareStatement(queryString);
									statement.setString(1,name);
									statement.setString(2,date);
									
									ResultSet rset = statement.executeQuery();
									
									while(rset.next()){
										String task = rset.getString(1);
										String priority = rset.getString(2);
										date = date.replace(' ','_');
										out.println("<tr>");
										out.println("<td style='text-align:center;'>" + task +"</td>");	
										out.println("<td style='text-align:center;'>" + priority +"</td>");	
										out.println("<td style='text-align:center;'>" + date +"</td>");								
										out.println("</tr>");
									}
									rset.close();
									statement.close();
									connection.close();
								} catch (SQLException e) {
									e.printStackTrace(System.out);
								}
								
						%>
					</tbody>
				</table>
			</div>
		</div>


		<div class="row">
			<div class="span10 offset1">
				<form class="form-inline pull-center" style="margin-left:15px;margin-right:15px;"
					action="/my-webapp/inside/editTask">
					<input type="text" class="form-control" style="width: 250px;" placeholder="Task" name="task">
					<input type="text" class="form-control" style="width: 250px;" placeholder="Priority(1-10)"
						name="priority">
					<%out.println("<input class='input-xlarge' style='width: 250px;' name = 'date' type='text' value='" + date + "' readonly='readonly'>"); %>
					<br><br>
					<button type="submit" style="width: 100%;" class="btn btn-large btn-success">OK</button>
					<a class="btn btn-large" style="width: 100%;" href="/my-webapp/inside/display">Back</a>
				</form>
			</div>
		</div>

	</div>

</body>

</html>