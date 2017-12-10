<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<%@page import="withub.DBCon"%>
<%@page session="false" %>
<%@ page import="java.sql.*" %>
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/bootstrap.css" rel="stylesheet">
<link href="css/applyconf.css" rel="stylesheet">
<link href='http://fonts.googleapis.com/css?family=Oswald' rel='stylesheet' type='text/css'>
<link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css'>
<title>JOB Application Form</title>
</head>
<body>
<div class="header">
            <!-- Brand and toggle get grouped for better mobile display -->
            
            <!-- Collect the nav links, forms, and other content for toggling -->
            <% 
			HttpSession session= request.getSession();
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


  <div class="header">
  
  <h1>JOB Application Form</h1>
  <p></p>
  <p>All your Data are pre-populated. If you wish to change any details edit it before it is sent to the particular employer.</p>
 </div>
 <div class="wrapper">
 <% 
                    String empID = request.getParameter("empID");
 String jobID = request.getParameter("jobID");
		HttpSession sess=request.getSession();
		String emplID =(String)sess.getAttribute("employeeID");
		System.out.println("emplID: "+emplID);
 Connection connection = DBCon.getConnection();
            Statement statement = connection.createStatement(); 
            ResultSet resultset = 
                statement.executeQuery("select fname,lname,address,city,state,zip,phoneno,email from withub.applicants where userID='"+emplID+"'") ;
            if(resultset.next())
            {
            %>
  <form class="form" method="post" action="applyconfservlet?jobID=<%=jobID%>" enctype="multipart/form-data">
    
    <span>First Name</span>  <input name="fname" type="text" class="name" value="<%=resultset.getString(1)%>"><br>
    <span>Last Name</span>  <input name="lname" type="text" class="name" value="<%=resultset.getString(2)%>"><br>
    <span>address</span>  <input name="address" type="text" class="name" value="<%=resultset.getString(3)%>"><br>
    <span>City</span>  <input name="city" type="text" class="name" value="<%=resultset.getString(4)%>"><br>
    <span>State</span>  <input name="state" type="text" class="name" value="<%=resultset.getString(5)%>"><br>
    <span>Zip</span>  <input name="zip" type="text" class="name" value="<%=resultset.getString(6)%>"><br>
    <span>Phone Number:</span>  <input name="phoneno" type="text" class="name" value="<%=resultset.getString(7)%>"><br>
    <span>Email Address</span>  <input name="email" type="text" class="name" value="<%=resultset.getString(8)%>"><br>
    <span>Resume</span> <input name="resume" type="file" class="email" required value="Upload your Resume in PDF format">
    <div class="button"><input type="submit" class="submit" value="APPLY"> </div>
  </form>
  <%} 
  else
  {
  %>
  <form class="form" method="post" action="applyconfservlet?jobID<%=jobID%>" enctype="multipart/form-data">
    
    <span>First Name</span>  <input name="fname" type="text" class="name" value=""><br>
    <span>Last Name</span>  <input name="lname" type="text" class="name" value=""><br>
    <span>address</span>  <input name="address" type="text" class="name" value=""><br>
    <span>City</span>  <input name="city" type="text" class="name" value=""><br>
    <span>State</span>  <input name="state" type="text" class="name" value=""><br>
    <span>Zip</span>  <input name="zip" type="text" class="name" value=""><br>
    <span>Phone Number:</span>  <input name="phoneno" type="text" class="name" value=""><br>
    <span>Email Address</span>  <input name="email" type="text" class="name" value=""><br>
    <span>Resume</span> <input name="resume" type="file" required class="email" value="Upload your Resume in PDF format">
    <div class="button"><input type="submit" class="submit" value="APPLY"> </div>
  </form>
  <%} %>
</div>

</body>
</html>