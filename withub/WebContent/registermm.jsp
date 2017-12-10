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
<script type="text/javascript" src="JavaScript/profile.js">
</script>
<!-- Bootstrap Core CSS -->
   <link href="cssiyer/bootstrap.min.css" rel="stylesheet">
	<link href="cssiyer/bootstrap.css" rel="stylesheet">
    <link href="cssiyer/heroic-features.css" rel="stylesheet">
<link href="css/profile.css" rel="stylesheet">
<title>Register for Mentors-Mentees</title>
<title>Insert title here</title>
</head>
<body>
<%@ include file="header.jsp" %>
<section>

<div class="container" style="margin-top: 30px;">
<div class="profile-head">
<div class="col-md- col-sm-4 col-xs-12">
<img src="http://www.newlifefamilychiropractic.net/wp-content/uploads/2014/07/300x300.gif" class="img-responsive" />
<h6><%out.print(name);%></h6>
</div><!--col-md-4 col-sm-4 col-xs-12 close-->


<div class="col-md-5 col-sm-5 col-xs-12">
<h5><%out.print(name);%></h5>
<p><%out.print(session.getAttribute("industry"));%> </p>
<ul>
<li><span class="glyphicon glyphicon-briefcase" ></span><%out.print(session.getAttribute("experience"));%></li>
<li><span class="glyphicon glyphicon-map-marker"></span><%out.print(session.getAttribute("address"));%></li>
<li><span class="glyphicon glyphicon-home"></span><%out.print(session.getAttribute("prefered_location"));%></li>
<li><span class="glyphicon glyphicon-phone"></span> <a href="#" title="call"><%out.print(session.getAttribute("phone"));%></a></li>
<li><span class="glyphicon glyphicon-envelope"></span><a href="#" title="mail"><%out.print(session.getAttribute("email"));%></a></li>

</ul>


</div><!--col-md-8 col-sm-8 col-xs-12 close-->




</div><!--profile-head close-->
</div><!--container close-->


<div id="sticky" class="container">
    
    <!-- Nav tabs -->
    <ul class="nav nav-tabs nav-menu" role="tablist">
      <li class="active">
          <a href="#" role="tab" data-toggle="tab">
              <i class="fa fa-male"></i> Register M-M
          </a>
      </li>
      <li><a href="profile.jsp" role="tab" data-toggle="tab">
          <i class="fa fa-key"></i> Profile
          </a>
      </li>
      <li><a href="edit.jsp" role="tab" data-toggle="tab">
          <i class="fa fa-key"></i> Edit Profile
          </a>
      </li>      <li><a href="mentors.jsp" role="tab" data-toggle="tab">
          <i class="fa fa-key"></i> Mentors
          </a>
      </li>
       </li>      <li><a href="mentees.jsp" role="tab" data-toggle="tab">
          <i class="fa fa-key"></i> Mentees
          </a>
      </li> 	
     
    </ul><!--nav-tabs close-->
    
    <!-- Tab panes -->
    <div class="tab-content">
    <div class="tab-pane fade active in" id="profile">
    <div class="container">
<div class="col-sm-11" style="float:left;">
<div class="hve-pro">
<p><%out.print(session.getAttribute("qualification"));%> </p>
</div><!--hve-pro close-->
</div><!--col-sm-12 close-->
<br clear="all" />
<div class="row">
<div class="col-md-12">
<h4 class="pro-title">Register</h4>
</div><!--col-md-12 close-->


<div class="col-md-6">

<div class="table-responsive responsiv-table">
  <table align="center">
      
     <tr>      
        <td>Firstname</td>
        <td>: <%out.print(session.getAttribute("fname"));%> </td> 
     </tr>
     <tr>    
        <td>Lastname</td>
        <td>: <%out.print(session.getAttribute("lname"));%></td>       
     </tr>
     

  </table>
  </div><!--table-responsive close-->


</div><!--row close-->




</div><!--container close-->
</div><!--tab-pane close-->
      
</section><!--section close-->

<%@ include file="footer.jsp" %>
</body>
</html>