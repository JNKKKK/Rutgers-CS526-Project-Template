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
			<div style="
			display: flex;
			flex-direction: column;
			justify-content: center;
			align-items: center;
		">
				<h1>Welcome to CS 526</h1><br><br>
				<h3>Design your own web app based on this template!</h3>
				<h4>What we have already done for you:</h4>
				<ul>
					<li>
						User Login and Sign up
					</li>
					<li>
						Create a table on the fly
					</li>
					<li>
						Basic CRUD (Create, read, update and delete)
					</li>
				</ul>
			</div>
		</div>
	</div>

</body>

</html>