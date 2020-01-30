<%@page import = "java.io.IOException" %>
<%@page import = "java.sql.Connection" %>
<%@page import = "java.sql.DriverManager" %>
<%@page import = "java.sql.PreparedStatement" %>
<%@page import = "java.sql.ResultSet" %>
<%@page import = "java.sql.SQLException" %>
<%@page import = "java.sql.Statement" %>


<!doctype html>
<html lang="en">

<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<meta name="description" content="">
	<title>Template 2</title>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
		crossorigin="anonymous">
	<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
		crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
		crossorigin="anonymous"></script>

	<style>
		.bd-placeholder-img {
			font-size: 1.125rem;
			text-anchor: middle;
			-webkit-user-select: none;
			-moz-user-select: none;
			-ms-user-select: none;
			user-select: none;
		}

		@media (min-width: 768px) {
			.bd-placeholder-img-lg {
				font-size: 3.5rem;
			}
		}

		.jumbotron {
			padding-top: 3rem;
			padding-bottom: 3rem;
			margin-bottom: 0;
			background-color: #fff;
		}

		@media (min-width: 768px) {
			.jumbotron {
				padding-top: 6rem;
				padding-bottom: 6rem;
			}
		}

		.jumbotron p:last-child {
			margin-bottom: 0;
		}

		.jumbotron h1 {
			font-weight: 300;
		}

		.jumbotron .container {
			max-width: 40rem;
		}

		footer {
			padding-top: 3rem;
			padding-bottom: 3rem;
		}

		footer p {
			margin-bottom: .25rem;
		}

		.main-container {
			margin: 20px auto;
		}

		.main-container h2 {
			margin-bottom: 20px;
		}
	</style>
</head>

<body>
	<header>
		<div class="collapse bg-dark" id="navbarHeader">
			<div class="container">
				<div class="row">
					<div class="col-sm-8 col-md-7 py-4">
						<h4 class="text-white">About</h4>
						<p class="text-muted">The Computer Science Department was founded in 1969.

							It has valuable research connections with other units at the University including Mathematics, DIMACS, SCILS, ECE, Cognitive Science, WINLAB and RDI2 to name a few.</p>
					</div>
					<div class="col-sm-4 offset-md-1 py-4">
						<h4 class="text-white">Contact</h4>
						<ul class="list-unstyled">
							<li><a href="#" class="text-white">Follow on Twitter</a></li>
							<li><a href="#" class="text-white">Like on Facebook</a></li>
							<li><a href="#" class="text-white">Email me</a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
		<div style="background-color: #cc0033!important; " class="navbar navbar-dark bg-dark shadow-sm">
			<div class="container d-flex justify-content-between">
				<a href="#" class="navbar-brand d-flex align-items-center">
					<strong>RUTGERS</strong>
				</a>
				<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarHeader" aria-controls="navbarHeader" aria-expanded="false" aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
			</div>
		</div>
	</header>
	<main role="main">
		<div class="container main-container">
			<h2>Student List</h2>
			<table class="table">
				<thead>
					<tr>
						<th scope="col">#</th>
						<th scope="col">FirstName</th>
						<th scope="col">LastName</th>
						<th scope="col">Email</th>
						<th scope="col">Netid</th>
					</tr>
				</thead>
				<tbody>
					<%
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
						queryString = "select * from student";
						PreparedStatement statement = connection.prepareStatement(queryString);
						ResultSet rset = statement.executeQuery();
						int count = 1;
						while(rset.next()){
								String firstname = rset.getString(2);
								String lastname = rset.getString(3);
								String email = rset.getString(4);
								String netid = rset.getString(5);
								out.println("<tr>");
								out.println("<th scope='row'>"+count+"</th>");
								out.println("<td>" + firstname +"</td>");	
								out.println("<td>" + lastname +"</td>");	
								out.println("<td>" + email +"</td>");
								out.println("<td>" + netid +"</td>");
								out.println("</tr>");
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
			<!-- Button trigger modal -->
			<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal">
				Add New Student
			</button>

			<!-- Modal -->
			<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
				<div class="modal-dialog" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="exampleModalLabel">New Student</h5>
							<button type="button" class="close" data-dismiss="modal" aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>
						<div class="modal-body">
							<form id="newStudentForm" action="/my-webapp/inside/addTask">
								<div class="form-group">
									<label for="exampleFormControlInput1">First Name</label>
									<input type="email" class="form-control" placeholder="First Name" name="firstname">
								</div>
								<div class="form-group">
									<label for="exampleFormControlInput1">Last Name</label>
									<input class="form-control" placeholder="Last Name" name="lastname">
								</div>
								<div class="form-group">
									<label for="exampleFormControlInput1">Netid</label>
									<input class="form-control" placeholder="Netid" name="netid">
								</div>
								<div class="form-group">
									<label for="exampleFormControlInput1">Email address</label>
									<input type="email" class="form-control" placeholder="name@example.com" name="email">
								</div>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
							<button type="button" onclick="document.getElementById('newStudentForm').submit();" class="btn btn-primary">Save changes</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</main>
</body>

</html>