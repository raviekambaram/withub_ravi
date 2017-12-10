<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="withub.DBCon"%>
<%@ page import="java.sql.*" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
<title>Job Search</title>
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



<%
String empID = (String)session.getAttribute("employeeID");
System.out.println("EMPLoyeeID: "+empID);
String jobID=request.getParameter("jobID");
System.out.println("search: "+jobID);
Connection connection = DBCon.getConnection();
Statement statement = connection.createStatement(); 
String sql = "select applicantID from jobs where jobID = "+jobID;
ResultSet resultset = 
    statement.executeQuery(sql); 
System.out.println(sql);
String ApplicantID = null;
boolean flag = true;
while(resultset.next())
{
 ApplicantID = resultset.getString(1);
}
//System.out.println(ApplicantID);
String [] ApplicantIDs = ApplicantID.split("\\|");
System.out.println("applicatitIDSLength"+ApplicantIDs.length);
//int userID=(int) request.getSession().getAttribute("employeeID");
//System.out.println(userID);
for(int i =0;i<ApplicantIDs.length;i++)
{
	System.out.println("applicatitIDS"+ApplicantIDs[i]);
if(!empID.equalsIgnoreCase(ApplicantIDs[i]))
{
	System.out.println("application already submitted");
	
	
}
else
{
	flag = false;
	%><div class="alert alert-danger">
  <strong>Your Application is already submitted</strong>
</div>
	<%//System.out.println("application not submitted");
}
//i++;
}
if(flag)
{
//System.out.println("applicantID before concat :"+ ApplicantID);
 ApplicantID = ApplicantID.concat("|");
 ApplicantID = ApplicantID.concat(empID);
 System.out.println("aplicantIDDDDD"+ApplicantID);
 Connection connection1 = DBCon.getConnection();
 Statement statement1 = connection.createStatement(); 
 String query = "update jobs SET applicantID=\'"+ApplicantID+"\' WHERE jobID="+jobID;
 System.out.println("query to be executed : "+query);

    statement.executeUpdate(query) ; 


 %>
   <div class="alert alert-success">
  <strong>Application is submitted successfully</strong>
</div>
<%} %>
    <!-- Header -->
    <a name="about"></a>
    <div class="intro-header">
        <div class="container">

            <div class="row">
                <div class="col-lg-12">
                    <div class="intro-message">
                        <h1 class="jobsearch">Job Search</h1>
                        <h3 class="jobsearch">Enter your criteria to search</h3>
                        <hr class="intro-divider">
                        <div class="flexsearch">
							<div class="flexsearch--wrapper">
							<form class="flexsearch--form" action="jobsearchresult.jsp" method="POST">
							<div class="flexsearch--input-wrapper">
							<input name="searchvalue" class="flexsearch--input" type="search" placeholder="Today will be your lucky day">
							</div>
							<input class="flexsearch--submit" type="submit" value="&#10140;"/>
							</form>
							</div>
						</div>
                    </div>
                </div>
            </div>

        </div>
        <!-- /.container -->

    </div>
    <div></div>
    <p></p>
    <!-- /.intro-header -->
<section id="services" class="services bg-primary bgcolor">
        <div class="container">
            <div class="row text-center">
                <div class="col-lg-10 col-lg-offset-1">
                    <h2 class="jobsearch">Featured Jobs</h2>
                    <% 
                    String emplID = request.getParameter("empID");
                    
                    request.setAttribute("empID", emplID);
            Connection connection5 = DBCon.getConnection();
            Statement statement5 = connection.createStatement(); 
            ResultSet resultset5 = 
                statement.executeQuery("select jobID,jname, jdesc from withub.jobs") ; 
	int i=1;
			while(resultset5.next())
			{
			
        %>
        <!-- Page Features -->
<!--          <div class="row text-center">-->

            <div class="boxsettings col-md-3 col-sm-6 hero-feature">
                <div class="thumbnail">
				
					<img src="images/gettogether.jpg" alt="" width="500" height="800">
					
                    <div class="caption">
                        <h3><%=resultset5.getString(2)%></h3>
                        <p><%=resultset5.getString(3)%></p>
                        <p>
                            <a href="jobdescServlet?jobID=<%= resultset5.getString(1)%>" class="btn btn-primary">Apply</a> <a href="jobDesc.jsp?jobID=<%= resultset5.getString(1)%>" class="btn btn-default">More Info</a>
                       </p>
                    </div>
                </div>
            </div>
            <%} %>
            </div>
            </div>
            
            
            
                    <hr class="small">
                    </div>
                    
                        </section>

    <!-- Page Content -->

	    <!-- Footer -->
    <footer>
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <ul class="list-inline">
                        <li>
                            <a href="#">Home</a>
                        </li>
                        <li class="footer-menu-divider">&sdot;</li>
                        <li>
                            <a href="#about">About</a>
                        </li>
                        <li class="footer-menu-divider">&sdot;</li>
                        <li>
                            <a href="index.html?#services">Services</a>
                        </li>
                        <li class="footer-menu-divider">&sdot;</li>
                        <li>
                            <a href="#contact">Contact</a>
                        </li>
                    </ul>
                    <p class="copyright text-muted small">Copyright &copy; Withub 2014. All Rights Reserved</p>
                </div>
            </div>
        </div>
    </footer>

    <!-- jQuery -->
    <script src="js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap.min.js"></script>

</body>
</html>