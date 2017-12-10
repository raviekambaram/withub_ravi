<%@ page language="java" import="java.util.HashMap,java.util.ArrayList" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="EUC-KR">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login</title>
    <!-- Bootstrap Core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="css/stylish-portfolio.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,700,300italic,400italic,700italic" rel="stylesheet" type="text/css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>
<body>
<%@ include file="header1.jsp" %>
 <!-- About -->
    <section id="about" class="about">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    </div>
            </div>
            <!-- /.row -->
        </div>
        <!-- /.container -->
    </section>


 <div>
	<h2 align="center">Login</h2>
	<form action="LoginServlet" method="post">
	<center>
	<table align="center">

<tr>
<td>Email ID</td>
<td><input type="text" name="emailid"/></td>
</tr>
<tr>
<td>Password</td>
<td><input type="password" name="pass"/></td>
</tr>
<tr>
<td></td>
<td><input type="submit" value="LOGIN"/></td>
</tr>
<tr>
<td>
</td>
<td>
<a href="Registration.jsp" class="btn btn-lg btn-light">Sign me up</a>
</td>
</tr>
<tr>
<td></td>

</table>
	</center>
	</form>	
</div>
 <br><br>
<div class="section">
<h3 align="center">${msg}</h3>
<h3 align="center">${msgg}</h3>
</div>
<%@ include file="footer.jsp" %>
</body>
</html>