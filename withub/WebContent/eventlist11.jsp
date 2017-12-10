<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Featured Events</title>
    

    <link href="cssiyer/bootstrap.min.css" rel="stylesheet">
	<link href="cssiyer/bootstrap.css" rel="stylesheet">
    <link href="cssiyer/heroic-features.css" rel="stylesheet">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
      
    
    <script type="text/javascript">
            
            function hideButton()  
            {  
               document.getElementById("termsandconditionsbutton").style.visibility="hidden";  
                
            }
            
            function holacreate() {
                if(document.getElementById("termsandconditions").checked) {
                	//console.log(document.getElementById("paid").value);
                	document.getElementById("termsandconditionsbutton").style.visibility="visible";
                }
                
                else {
                	//console.log(document.getElementById("paid").value);
                	document.getElementById("termsandconditionsbutton").style.visibility="hidden";
                }
            }
        </script>   
    

</head>

<body onload="hideButton()">

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
            <div class="header_nav row-xs-1" id="bs-example-navbar-collapse-1" style="background-color:black" >
            
            <img src = "images/symbol.jpg" height="102" width="200" align="middle" alt="myimage" />
    
            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container -->
    </nav>

    <!-- Page Content -->
    <div class="container">

        <!-- Jumbotron Header -->
        <header class="jumbotron hero-spacer">
 		<h1>Event Creation</h1><h3>If you wish to create an event, carefully review and sign the terms and conditions </h3>
         <br><br><p>Terms and Conditions:<br>1. The event must be held within UAlbany campus.<br>2. The event must be according to the guidelines of the university<br>3. The event should be in the daytime and not at night.</p>
          <br>  <input type="checkbox" id="termsandconditions" name="termsandconditions" onclick="holacreate()">&nbsp;I have read and understood the terms and conditions for creating an event.
           <br><br> <p><a class="btn btn-primary btn-large" id="termsandconditionsbutton" href="eventCreation.jsp">Create event!</a>
            </p>
        </header>

        <hr>
<br>
<br>
<a href="index.jsp">Back</a>
        <div>
         	<form action="EventManager">
		<span style="float: right; display: inline-block;">
			<span style="display: inline-block;">
		<input type="text" name="search_event" style="width: 100%">
		<input type="hidden" name="purpose" value="searchEvent">
		
		</span>
		&nbsp;&nbsp;
		<input type="submit" value="Search" >
</span>
</form>
        </div>
        <br><br>
        ${searchEvents_message}
        <br><br>
<section>
        <!-- Title -->
        <div class="row">
            <div class="col-lg-12">
                <h3>Featured Events</h3>
                
            </div>
        </div>


        <!-- /.row -->

        
        <!-- Page Features -->
<!--          <div class="row text-center">-->
			<c:forEach var="i" begin="1" end="${searchEventsList.get(0).get(0)}">
			
            <div class="col-md-3 col-sm-6 hero-feature" >
                <div class="thumbnail">
				
                    <img src='${searchEventsList.get(2).get(i)}' alt="" width="400" height="400">
					
                    <div class="caption">
                        <h3>${searchEventsList.get(0).get(i)}</h3>
                        <p>${searchEventsList.get(3).get(i)}</p>
                        <p>${searchEventsList.get(1).get(i)}</p>
                        <p><% if(session.getAttribute("email") != null)
        				      { %>
                            <a href="eventcon.jsp" class="btn btn-primary">Register!</a> 
                            <% }
                        		else {  %>
                            <a href="Login.jsp" class="btn btn-primary">Register!</a>
                            <% } %>
                            <a href="${pageContext.request.contextPath}/EventManager?event_name=${searchEventsList.get(0).get(i)}" class="btn btn-default">More Info</a>
                        </p>
                    </div>
                </div>
            </div>
		<!-- </div> -->
		</c:forEach>
            

    <!-- jQuery -->
    <script src="js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap.min.js"></script>

</body>

</html>
