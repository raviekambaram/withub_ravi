<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style>
div {
    margin-top: 100px;
    margin-bottom: 100px;
    margin-right: 150px;
    margin-left: 80px;
}
</style>
<link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Roboto:400,100,300,500">
        <link rel="stylesheet" href="form-1/assets/bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" href="form-1/assets/font-awesome/css/font-awesome.min.css">
<link href="css/joblisting.css" rel="stylesheet">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Posted Jobs</title>
<%@page import="withub.DBCon"%>
<%@ page import="java.sql.*" %>
<style>
h1 { 
	color : #7c795d; 
	font-family : 'Trocchi', serif; 
	font-size : 45px; 
	font-weight : normal;
	line-height : 48px;
    margin : 0; 
    }
</style>
</head>
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



<body>
<div align="center" class="viewapplicantsdiv" >

 <% 		
            Connection connection = DBCon.getConnection();
            Statement statement = connection.createStatement(); 
            HttpSession sess = request.getSession();
            String empID = (String) sess.getAttribute("employeeID");
            //String sql = "select jobID,jname,jdesc from withub.jobs where empID = \"%"+empID+"%\"";
            String sql = "select jobID,jname,jdesc from withub.jobs where empID =3";
            ResultSet resultset = 
                statement.executeQuery(sql); 
            System.out.println(sql);
            if(!resultset.next())
            {
            	%>
            	
            	<br>
            	<br>
            	<br>
            	<br>
            	
            	<h1>Sorry there are no jobs posted by you at this time</h1>
            	
            	<%
            }
            else
            {
%>


<table class="table" BORDER="1" width="400">
            <tr>
            	<th>Job Name</th>
               	<th>Job Description</th>
               	<th>Applicants</th>
           </tr>

    		

		

<%
			while(resultset.next())
			{
				%>
				
				<tr>
              <td> <%= resultset.getString(2) %> </td>
              <td> <%= resultset.getString(3) %> </td>
              <td> <p data-placement="top" data-toggle="tooltip" title="View Applicants"><a href="viewapplicants.jsp?jobID=<%= resultset.getString(1)%>" class="btn btn-primary btn-xs" data-title="View Applicants" data-toggle="modal"  ><button type="button" class="btn btn-default btn-sm">
          <span class="glyphicon glyphicon-user"></span> View Applicants 
        </button></a></p> </td>
                </tr>
					
					<%
			
			}
			
        %>   		
    		
           </table>
           <%} %>
           </div>

</body>
</html>