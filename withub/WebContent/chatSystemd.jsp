<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
<title>Insert title here</title>
</head>
<body>

<%
response.setHeader("Cache-Control","no-cache");
response.setHeader("Cache-Control","no-store"); 
response.setDateHeader("Expires", 0); 
response.setHeader("Pragma","no-cache"); 
%>

<%String referer = request.getHeader("Referer");
String urlpath = request.getRequestURL().toString();
%>
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
<a href='${urlpath}'>Back</a>
<br><br>
		<form action = "ChatManager" method="post">
		To: &nbsp;&nbsp; <label for="mentor_name">${recipient}</label> <br><br>
				<textarea name="commentBox" rows="4" cols="50"></textarea> <br><br>
				<input type="hidden" name="role" value='${role}'>
				<input type="hidden" name="mentorID" value='${mentorID}'>
				<input type="hidden" name="menteeID" value='${menteeID}'>
				<input type="hidden" name="recipient" value='${recipient}'>
				<input type="hidden" name="refresh" value="http://localhost:8082/withub/chatSystemd.jsp">
				<input type="submit" name="send_message" value="Send">
		</form>
		
		<br><hr><br>
		<ul style="list-style-type: none;">
			<c:forEach var="i" begin="1" end="${conversation.get(3).get(0)}">
	<li><font style="size: 1px;">${conversation.get(1).get(i)}</font> &nbsp;&nbsp;&nbsp;&nbsp; <img src='${conversation.get(2).get(i)}' width="15" height="15"/> &nbsp;&nbsp; ${conversation.get(3).get(i)} : &nbsp;&nbsp;&nbsp; ${conversation.get(4).get(i)}</li>
						<br>
			</c:forEach>
		</ul>
<%@ include file="footer.jsp" %>		
</body>
</html>