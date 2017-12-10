<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="withub.DBCon"%>
<%@ page import="java.sql.*" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
  <!--  <title>Bootstrap Login &amp; Register Templates</title>  -->
  		<title>Employer Home</title>

        <!-- CSS -->
        <link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Roboto:400,100,300,500">
        <link rel="stylesheet" href="form-1/assets/bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" href="form-1/assets/font-awesome/css/font-awesome.min.css">
        <link rel="stylesheet" href="choose-layout-assets/style.css">

        <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
            <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
            <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
        <![endif]-->

        <!-- Favicon and touch icons -->
        <link rel="shortcut icon" href="form-1/assets/ico/favicon.png">



</head>
<body>
<div class="header">
            <!-- Brand and toggle get grouped for better mobile display -->
            
            <!-- Collect the nav links, forms, and other content for toggling -->
            <% 
            String valid = (String)session.getAttribute("jobsession");
            		System.out.println(valid);
            		if(valid!=null && valid!="null")
            		{
            			
            		
            %>
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav">
                    <li>
                        <a href="index.html">Withub Home</a>
                    </li>
                    <li>
                        <a href="jobsearch.jsp">Job Search</a>
                    </li>
                    <li>
                        <a href="joblogout">Logout</a>
                    </li>
                </ul>
            </div>
            <%}
            		
            		else
            		{
            		%>
            		<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav">
                    <li>
                        <a href="index.html">Withub Home</a>
                    </li>
                    <li>
                        <a href="jobsearch.jsp">Job Search</a>
                    </li>
                    <li>
                        <a href="jobLogin.html">Login</a>
                    </li>
                </ul>
            </div>
            <%} %>



<div class="alert alert-success">
  <strong>Job created successfully</strong>
</div>
    
    	<div class="section-container">
	        <div class="container layouts">
	            <div class="row">
	                <div class="col-sm-12 section-description">
	                    <h3>Select an option</h3> <br>
	                </div>
	            </div>
	            <div class="row">
	            	<div class="col-sm-10 col-sm-offset-1">
	            		<div class="row">
		                	<div class="col-sm-4 layout-box">
		                	
		         <!--      	<a href = "form-1/index.html">
		                		<div id="onboard">d csd csd c sdhc dshjc d cd cjhdscjhdsbchjdbc<br><br>
		                		hsdbcjshbcjhsbcjdsbcjsdbcjbcj</div>
		                	</a>   -->
			                	
			              	<span class = "relative">
			                	<a href="viewpostedjobs.jsp">
			        <!--       		<img src="choose-layout-assets/1.jpg" alt="">   -->
			        <ul class="caption-style-1">
			         	<li>		<img src="form-1/assets/img/backgrounds/1.jpg" alt="" style="opacity: 0.7;"/>
			        				<p class="absolute-text"><font color=#000000>VIEW POSTED JOBS<br><br>Lets you see all the jobs that you posted</font></p>
			            <div class="caption">
						<div class="blur"></div>
						<div class="caption-text">
						<h1><strong>VIEW POSTED JOBS</strong></h1>
						<!-- <p>Whatever It Is - Always Awesome</p>  -->
						</div>
						</div>
						</li>
					</ul>
						
			            
			                	</a>
			                </span>  
			        <!--         	<p>Form 1: fullscreen background, light forms</p>    -->
		                    </div>
		                    
<!-- 
<ul class="caption-style-1">
<li> <img src="form-1/assets/img/backgrounds/1.jpg" alt="">
<div class="caption">
<div class="blur"></div>
<div class="caption-text">
<h1>MENTOR REGISTRATION</h1>
<p>Whatever It Is - Always Awesome</p>
</div>
</div>
</li>
</ul>   -->
		                    
		                    
		                    
		                    
		                    <!-- HTML -->
<!-- <div class="relative">
  <img src="image-path" alt="">
  <p class="absolute-text">Hey I am text on an Image.</a> </p>
</div>   -->
		                    
		                    
		                    <div class="col-sm-4 layout-box" style="float: right;">
		            <!--        	<a href="form-2/index.html">   -->
				    <!--           	<img src="choose-layout-assets/2.jpg" alt="">   -->
				  <!--  				<img src="form-1/assets/img/backgrounds/1.jpg" alt="">    
			                    </a>   -->
			                    
			                     	<span class = "relative">
			                	<a href="createjobs.jsp">
			        <!--       		<img src="choose-layout-assets/1.jpg" alt="">   -->
			        <ul class="caption-style-1">
			         	<li>		<img src="form-1/assets/img/backgrounds/1.jpg" alt="" style="opacity: 0.7;"/>
			        				<p class="absolute-text"><font color=#000000>ADD JOB<br><br>Lets you add new jobs</font></p>
			            <div class="caption">
						<div class="blur"></div>
						<div class="caption-text">
						<h1><strong>ADD JOB</strong></h1>
						<!-- <p>Whatever It Is - Always Awesome</p>  -->
						</div>
						</div>
						</li>
					</ul>
						
			            
			                	</a>
			                </span> 
		<!--                    <p>Form 2: fullscreen background, dark transparent forms</p>   -->
		                    </div>
		<!--                <div class="col-sm-4 layout-box">
			                	<a href="form-3/index.html">
			                		<img src="choose-layout-assets/3.jpg" alt="">
			                	</a>
			                	<p>Form 3: light background with subtle pattern, light forms</p>
		                    </div>     -->
	                    </div>
                    </div>
	            </div>
	        </div>
        </div>
        
        <div class="container footer">
            <div class="row">
                <div class="col-sm-12">
               <!-- <p>Made by Anli Zaimi at <a href="http://azmind.com" target="_blank"><strong>AZMIND</strong></a> 
        					having a lot of fun. <i class="fa fa-smile-o"></i></p>   -->
        			<p>Copyright © withub@albany.edu 2016</p>
                </div>
            </div>
        </div>
        

</body>
</html>