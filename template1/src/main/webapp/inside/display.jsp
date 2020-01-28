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
	<title>A Very Simple TodoList App</title>
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

		<div class="row" style="margin-bottom: 10px;">
				<form style="float:left;" class="form-inline pull-center" action="/my-webapp/inside/addTask">
					<input type="text" class="form-control" style="width: 200px;" placeholder="Add your task here"
						name="task">
					<input type="text" class="form-control" style="width: 200px;" placeholder="Priority(1-10)"
						name="priority">
					<button type="submit" class="btn btn-success">Add New Task</button>
				</form>
				<form style="float:right;" class="form-inline pull-center" action="/my-webapp/inside/searchResult.jsp">
					<input type="text" placeholder="Search by name" style="width: 200px;"  class="form-control" name="task">
					<button type="submit" class="btn btn-info">Search</button>
				</form>
		</div>

		<div class="row">
			<div class="span10 offset1">
				<table class="table table-striped table-bordered table-hover" border="1">
					<thead>
						<tr>
							<th style='text-align:center;vertical-align:middle'>Task</th>
							<th style='text-align:center;vertical-align:middle'>Priority</th>
							<th style='text-align:center;vertical-align:middle'>Created Date</th>
							<th style='text-align:center;vertical-align:middle'>Actions</th>
						</tr>
					</thead>
					<tbody>

						<%
								int pageNumber = 0;
								boolean isSort = false;
								boolean hasNext = false;
								String pageParameter = request.getParameter("page");
								String sort = request.getParameter("sort");
								if(sort == null || sort.isEmpty()){
									isSort = false;
								} else {
									isSort = Boolean.parseBoolean(sort);
								}
								if(pageParameter == null || pageParameter.isEmpty()){
									pageNumber = 0;
								} else {
									pageNumber = Integer.parseInt(pageParameter);
								}
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
									String queryString;
									if(!isSort){
										queryString = "select thing, priority, createDate from task where name = ?";
									} else {
										queryString = "select thing, priority, createDate from task where name = ? order by priority desc, createDate asc";
									}
									PreparedStatement statement = connection.prepareStatement(queryString);
									statement.setString(1,name);
									ResultSet rset = statement.executeQuery();
									int count = 0;
									while(rset.next()){
										if((count / 6) > pageNumber){
											hasNext = true;
											break;
										}
										if((count / 6) == pageNumber){
											String task = rset.getString(1);
											String priority = rset.getString(2);
											String date = rset.getString(3);
											date = date.replace(' ','_');
											out.println("<tr>");
											out.println("<td style='text-align:center;'>" + task +"</td>");	
											out.println("<td style='text-align:center;'>" + priority +"</td>");	
											out.println("<td style='text-align:center;'>" + date +"</td>");
											out.println("<td>");
											out.print("<a class = 'btn btn-small btn-info' style = 'float:left; margin-right: 10px;' method = 'post'"); 
											out.print("href = '/my-webapp/inside/deleteTask?date=" + date + "'>");
											out.println("Done</a>");
											out.print("<a class = 'btn btn-small btn-primary' style = 'float:left;' method = 'post'"); 
											out.print("href = '/my-webapp/inside/showEditTask.jsp?date=" + date + "'>");
											out.println("Edit</a>");
											out.print("<a class = 'btn btn-small btn-danger' style = 'float:right;' method = 'post'"); 
											out.print("href = '/my-webapp/inside/deleteTask?date=" + date + "'>");
											out.println("Delete</a>");
											out.println("</td>");										
											out.println("</tr>");
										}
										count++;
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
				<%	//System.out.println("hasNext?" + hasNext);
						if(hasNext){
							int nextPage = pageNumber + 1;
							out.print("<a class = 'btn-large btn-link btn' style = 'float:right;' method = 'post'");
							if(isSort){
								out.print("href = '/my-webapp/inside/display.jsp?sort=true&page=" + nextPage + "'>");
							} else {
								out.print("href = '/my-webapp/inside/display.jsp?page=" + nextPage + "'>");
							}
							out.println("NextPage</a>");
						}

						if(pageNumber > 0){
							int lastPage = pageNumber - 1;
							out.print("<a class = 'btn-large btn-link btn' style = 'float:left;' method = 'post'");
							if(isSort){
								out.print("href = '/my-webapp/inside/display.jsp?sort=true&page=" + lastPage + "'>");
							} else {
								out.print("href = '/my-webapp/inside/display.jsp?page=" + lastPage + "'>");
							}

							out.println("LastPage</a>");
						}
						
						%>
			</div>
		</div>

		<div class="row">
			<div class="span10 offset1">
				<a class='btn-warning btn btn-block' style='float:center;'
					href='/my-webapp/inside/display.jsp?sort=true'>Sort By Priority</a>
			</div>
		</div>

	</div>

</body>

</html>