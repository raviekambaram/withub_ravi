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
<title>Event View</title>
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
<a href="eventlist1.jsp">Back</a>
    
    <div>
    <h2 align="center">View Event</h2>
    <h3 align="center"> Event Name : ${eventDetails.get(1)}</h3>
    <table align="center">
    <tr>
    	<td>
    	<img src="${eventDetails.get(4)}">
  <!-- 	Event Poster : ${eventDetails.get(4)}    --><br><br>
    	<td>
    </tr>
     <tr>
    <td>Event Type : ${eventDetails.get(2)} </td>
    <tr>
    <tr>
    <td>Event Description : ${eventDetails.get(3)} </td>
    <tr>
    </table>
    </div>
<br>




    <%@ include file="footer.jsp" %>
</body>
</html>