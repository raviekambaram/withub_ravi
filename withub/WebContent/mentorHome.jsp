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
<title>Mentor Home</title>
<style>
table {
    border-collapse: collapse;
    width: 100%;
}

th, td {
    text-align: left;
    padding: 8px;
}

tr:nth-child(even){background-color: #f2f2f2}

th {
    background-color: #363536;
    color: white;
}
</style>
</head>

<body>
<%@ include file="header1.jsp" %>
<%
String urlpath = request.getRequestURL().toString();
session.setAttribute("urlpath", urlpath);
%>
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
<a href="profile.jsp">Back</a>
<br><br>

<h4 align="center">Mentees who are trying to contact you:</h4><br><br>

<table>
  <tr>
    <th></th>
    <th>Mentee Name</th>
    <th></th>
  </tr>
  
  <c:forEach var="i" begin="1" end="${menteeProfileList.get(1).get(0)}">
  <tr>
    <td><img src="${menteeProfileList.get(2).get(i)}" width="15" height="15"/></td>
    <td><a href="${pageContext.request.contextPath}/ProfileManager?member_name=${menteeProfileList.get(1).get(i)}&memberID=${menteeProfileList.get(0).get(i)}">${menteeProfileList.get(1).get(i)}</a></td>
    <td><a href="${pageContext.request.contextPath}/ChatManager?recipient=${menteeProfileList.get(1).get(i)}&menteeID=${menteeProfileList.get(0).get(i)}&mentorID=${MID}&role=${role}">View/Reply messages</a></td>
  </tr>
  </c:forEach>
 
</table>
<%@ include file="footer.jsp" %>
</body>
</html>