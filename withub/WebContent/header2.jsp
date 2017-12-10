<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
String name=(String)session.getAttribute("fname1") + " "+ (String)session.getAttribute("lname1");
%>
<link rel="stylesheet" href="https://opensource.keycdn.com/fontawesome/4.6.3/font-awesome.min.css" 
integrity="sha384-Wrgq82RsEean5tP3NK3zWAemiNEXofJsTwTyHmNb/iL3dP/sZJ4+7sOld1uqYJtE" crossorigin="anonymous">

 <!-- Navigation -->
    <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation" style="background-color: white; border: none; background-image: url('../images/symbol.jpg');">
        <div class="container" style="background-image: url('../images/symbol.jpg');">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
    <!--           <a class="navbar-brand" href="#">Start Bootstrap</a>    -->
		   		
		   		<a class="navbar-brand"></a>
		   		
	<!--  		<span class="upper">
					<div><font size="15px">itHub</font>
						<div><font size="2px" face="Comic Sans MS">For the Women.</font></div>
					</div>
				</span>   -->
            </div>
            <!-- Collect the nav links, forms, and other 
            class="collapse navbar-collapse"
            content for toggling -->
            <div class="header_nav row-xs-1" id="bs-example-navbar-collapse-1" >
            
            <img src = "images/symbol.jpg" height="102" width="200" align="middle" alt="myimage"/>
    
            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container -->
    </nav>

</body>
</html>