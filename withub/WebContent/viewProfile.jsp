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
<title>Profile</title>
</head>
<body>

<%@ include file="header2.jsp" %>


<section>

<div class="container" style="margin-top: 30px;">
<div class="profile-head">
<div class="col-md- col-sm-4 col-xs-12">
<img src="${File_Path1}" class="img-responsive" />
<h6><%out.print(name);%></h6>
</div><!--col-md-4 col-sm-4 col-xs-12 close-->


<div class="col-md-5 col-sm-5 col-xs-12">
<h5><%out.print(name);%></h5>
<p><%out.print(session.getAttribute("industry1"));%> </p>
<ul>
<li><span class="glyphicon glyphicon-briefcase" ></span><%out.print(session.getAttribute("experience1"));%></li>
<li><span class="glyphicon glyphicon-map-marker"></span><%out.print(session.getAttribute("address1"));%></li>
<li><span class="glyphicon glyphicon-home"></span><%out.print(session.getAttribute("prefered_location1"));%></li>
<li><span class="glyphicon glyphicon-phone"></span> <a href="#" title="call"><%out.print(session.getAttribute("phone1"));%></a></li>
<li><span class="glyphicon glyphicon-envelope"></span><a href="#" title="mail"><%out.print(session.getAttribute("email1"));%></a></li>

</ul>


</div><!--col-md-8 col-sm-8 col-xs-12 close-->




</div><!--profile-head close-->
</div><!--container close-->


<div id="sticky" class="container">
    
    <!-- Nav tabs -->
    <ul class="nav nav-tabs nav-menu" role="tablist">
      <li class="active">
          <a href="profile.jsp" role="tab" data-toggle="tab">
              <i class="fa fa-male"></i> Profile
          </a>
      </li>

    </ul><!--nav-tabs close-->
    
    <!-- Tab panes -->
    <div class="tab-content">
    <div class="tab-pane fade active in" id="profile">
    <div class="container">
<div class="col-sm-11" style="float:left;">
<div class="hve-pro">
<p><%out.print(session.getAttribute("qualification1"));%> </p>
</div><!--hve-pro close-->
</div><!--col-sm-12 close-->
<br clear="all" />
<div class="row">
<div class="col-md-12">
<h4 class="pro-title">Bio Graph</h4>
</div><!--col-md-12 close-->


<div class="col-md-6">

<div class="table-responsive responsiv-table">
  <table class="table bio-table">
      <tbody>
     <tr>      
        <td>Firstname</td>
        <td>: <%out.print(session.getAttribute("fname1"));%> </td> 
     </tr>
     <tr>    
        <td>Lastname</td>
        <td>: <%out.print(session.getAttribute("lname1"));%></td>       
     </tr>
     <tr>    
        <td>Birthday</td>
        <td>: 23 september 1992</td>       
    </tr>
    <tr>    
        <td>Contury</td>
        <td>:<%out.print(session.getAttribute("address1"));%></td>       
    </tr>
    <tr>
        <td>Occupation</td>
        <td>: <%out.print(session.getAttribute("industry1"));%> </td> 
     </tr>

    </tbody>
  </table>
  </div><!--table-responsive close-->
</div><!--col-md-6 close-->

<div class="col-md-6">

<div class="table-responsive responsiv-table">
  <table class="table bio-table">
      <tbody>
     <tr>  
        <td>Emai Id</td>
        <td>: <%out.print(session.getAttribute("email1"));%></td> 
     </tr>
     <tr>    
        <td>Mobile</td>
        <td>: <%out.print(session.getAttribute("phone1"));%></td>       
     </tr>
     <tr>    
        <td>Phone</td>
        <td>:<%out.print(session.getAttribute("phone1"));%></td>       
    </tr>
    <tr>    
        <td>Experience</td>
        <td>:<%out.print(session.getAttribute("experience1"));%></td>       
    </tr>
 

    </tbody>
  </table>
  </div><!--table-responsive close-->
</div><!--col-md-6 close-->

</div><!--row close-->




</div><!--container close-->
</div><!--tab-pane close-->
      
</section><!--section close-->

<%@ include file="footer.jsp" %>
</body>
</html>