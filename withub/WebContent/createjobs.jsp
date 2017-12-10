<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Create Job Page</title>
<link href="css/jobReg.css" rel="stylesheet">
    <!-- Bootstrap Core CSS -->
    <link href="css/jobbootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="css/joblanding-page.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="css/jobfont-awesome.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Lato:300,400,700,300italic,400italic,700italic" rel="stylesheet" type="text/css">

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



<div class="container">
    <h1 class="well">Create Job Page</h1>
	<div class="col-lg-12 well">
	<div class="row">
				<form action="jobCreation" method="post">
					<div class="col-sm-12">
						<div class="row">
							<div class="col-sm-6 form-group">
								<label>Job Name</label>
								<input name="jname" type="text" placeholder="Enter Job Name Here.." required class="form-control">
							</div>
							<div class="col-sm-6 form-group">
								<label>Job Description</label>
								<input name="jdesc" type="text" placeholder="Enter Short description  Here.." required class="form-control">
							</div>
						</div>					
						<div class="form-group">
							<label>Detailed Job Description</label>
							<textarea name="djdesc" placeholder="Enter Detailed Description Here.." rows="3" required class="form-control"></textarea>
						</div>	
						<div class="form-group">
							<label>Detailed Job Requirement</label>
							<textarea name="djreq" placeholder="Enter Detailed requirements Here.." rows="3" required class="form-control"></textarea>
						</div>
						<div class="row">
							<div class="col-sm-4 form-group">
								<label>Location</label>
								<input name="location" type="text" placeholder="Enter Location Here.." required class="form-control">
							</div>	
							<div class="col-sm-4 form-group">
								<label>Contact Number</label>
								<input name="contact" type="text" placeholder="Enter Contact Number Here.." required class="form-control">
							</div>	
							<div class="col-sm-4 form-group">
								<label>Employer Name</label>
								<input name="emprname" type="text" placeholder="Enter Employer name Here.." required class="form-control">
							</div>		
						</div>
						
					<button type="submit" class="btn btn-lg btn-info">Submit</button>					
					</div>
				</form> 
				</div>
	</div>
	</div>
</body>
</html>