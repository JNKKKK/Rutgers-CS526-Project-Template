<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="utf-8">
	<title>TODO List Register</title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta name="description" content="">
	<meta name="author" content="">

	<!-- The styles -->
	<link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.0.0/css/bootstrap.min.css" rel="stylesheet">
	<link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.0.0/css/bootstrap-theme.min.css"
		rel="stylesheet">
	<style type="text/css">
		body {
			padding-bottom: 40px;
			background-color: #f5f5f5;
		}

		p {
			color: red;
		}

		.form-signin {
			max-width: 300px;
			padding: 19px 29px 29px;
			margin: 0 auto 20px;
			background-color: #fff;
			border: 1px solid #e5e5e5;
			-webkit-border-radius: 5px;
			-moz-border-radius: 5px;
			border-radius: 5px;
			-webkit-box-shadow: 0 1px 2px rgba(0, 0, 0, .05);
			-moz-box-shadow: 0 1px 2px rgba(0, 0, 0, .05);
			box-shadow: 0 1px 2px rgba(0, 0, 0, .05);
		}

		.form-signin .form-signin-heading,
		.form-signin .checkbox {
			margin-bottom: 10px;
		}

		.form-signin input[type="text"],
		.form-signin input[type="password"] {
			font-size: 16px;
			height: auto;
			margin-bottom: 15px;
			padding: 7px 9px;
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
				</ul>

			</div>
		</div>
	</nav>

	<div class="container">

		<div class="row">

			<div class="span12">
				<br>
				<h1 class="text-center" style="font-family:new courier;color:black;font-size:34px;">A Very
					Simple TodoList App</h1>
				<h3 class="text-center" style="font-family:new courier;color:black;font-size:22px;">Template for CS526
					Spring2020</h3>
				<hr><br>
			</div>

		</div>

		<form class="form-signin" method="post" action="register">
			<h2 class="form-signin-heading">Register Now</h2>
			<input type="text" class="input-block-level" placeholder="User name" name="name">
			<input type="password" class="input-block-level" placeholder="Password" name="password">
			<input type="password" class="input-block-level" placeholder="Confirm Password" name="password2">
			<button class="btn btn-large btn-primary" type="submit">Register</button>
			<a href="login.jsp">Already have account?</a>
			<br>
			<p>User already exists!</p>
		</form>
		<div class="row">
			<div class="span4 offset8">
				<blockquote class="pull-right">
					<h4 class="text-center">
						It is extremely unlikely that anyone coming out of school with a technical degree will go into
						one area and stay there. Today's students have to look forward to the excitement of probably
						having three or four careers.</h4>
					<small>Gordon Moore</small>
				</blockquote>
			</div>
		</div>
		<div class="row">
			<div class="span4 offset8">
				<blockquote class="pull-right">
					<h4 class="text-center">
						640K ought to be enough for anybody.
					</h4>
					<small>Bill Gates</small>
				</blockquote>
			</div>
		</div>

	</div> <!-- /container -->

</body>

</html>