<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
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
<title>Register</title>

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

<script>
  $(function() {
    $( "#dob" ).datepicker({changeMonth:true,changeYear: true,yearRange:"-50:+0"});
  });
  </script>
  <script type="text/javascript" src="JavaScript/register2.js">
</script>
  
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

 

<form action="RegistrationServlet" method="post" onsubmit="return myFunction()">
<h1 align="center">Registration:</h1>
<h5 align="center">*Please enter all mandatory fields</h5>
<hr>
<div class="tableform">
<table align="center">

<%if(request.getAttribute("email")!=null) {%>
<tr><td><div id="error"><%=request.getAttribute("email") %> already exist</div></td></tr>
<%} %>

<tr><td><label for="firstName">First Name:*</label></td><td><input type="text" name="firstName" id="firstName"></td><td><div id ="fnameError"></div></td></tr>
<tr><td><label for="lastName">Last Name:*</label></td><td><input type="text" name="lastName" id="lastName"></td><td><div id ="lnameError"></div></td></tr>
<tr><td><label for="email">Email:*</label></td><td><input type="text" name="email" id="email"></td><td><div id ="emailError"></div></td></tr>
<tr><td><label for="password">Password:*</label></td><td><input type="password" name="password" id="password"></td><td><div id ="passwordError"></div></td></tr>
<tr><td><label for="confirmPassword">Confirm Password:*</label></td><td><input type="password" name="confirmPassword" id="confirmPassword"></td><td><div id ="confirmPasswordError"></div></td></tr>
<tr><td><label for="secQuestion">Security Question:*</label></td><td><input type="text" name="secQuestion" id="secQuestion"></td><td><div id ="secQuestionError"></div></td></tr>
<tr><td><label for="secAnswer">Security Answer:*</label></td><td><input type="text" name="secAnswer" id="secAnswer"></td><td>${fileUploadMessage}</div></td></tr>
<input type="hidden" name="file_path" value='${file_path}'>
<tr></td><td><td><input class="button" type="submit" value="Submit"  ></td></tr><tr>
</table>
</div>
</form>
</div>
<div class="form" align="center">
   <div class="form">
	<form action="UploadPicServlet" method="post" enctype="multipart/form-data" align="center">
		<table cellspacing="15px">
			<tr>
				<td width="22%">Profile Picture: </td>
				<td>Select an image to upload:  &nbsp; &nbsp;<input type="file" name="image" size="50" /> &nbsp; &nbsp;
	<input type="submit" name="upload" value="Upload File"/> <font color="red"> &nbsp;&nbsp; ${fileUploadMessage}</font></td>
			</tr>
			<tr><td><img src='${file_path}' width="100" height="100"/></td></tr>
		</table>
	</form>
	</div>
	<%@ include file="footer.jsp" %>
</body>
</html>