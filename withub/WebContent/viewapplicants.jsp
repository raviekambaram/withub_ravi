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
</style></head>
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
 if(ApplicantID==null)
 {
	%>
	 <br>
            	<br>
            	<br>
            	<br>
            	
            	<h1>Sorry there are no applicants for this job at this time</h1>
	<% 
 }
 else
 {
 String [] ApplicantIDs = ApplicantID.split("\\|");
	 %>
<div align="center" class="viewapplicantsdiv">
<table class="table" BORDER="1" width="400">
            <tr>
            	<th>First Name</th>
               	<th>Last Name</th>
               	<th>Email ID</th>
               	<th>Phone Number</th>
               	<th>View Resume.</th>
           </tr>

    	 
	 <% 
  System.out.println("applicatitIDSLength"+ApplicantIDs.length);
 //int userID=(int) request.getSession().getAttribute("employeeID");
 //System.out.println(userID);
	for(int i =0;i<ApplicantIDs.length;i++)
	{
	System.out.println("applicatitIDS"+ApplicantIDs[i]);
	
            
	String sql1 = "select fname,lname,email,phoneno,resume_1 from withub.applicants where applicantID = "+ApplicantIDs[i];
	 ResultSet resultset1 = statement.executeQuery(sql1);
	

			if(resultset1.next())
			{
				%>
				
				<tr>
              <td> <%= resultset1.getString(1) %> </td>
              <td> <%= resultset1.getString(2) %> </td>
              <td> <%= resultset1.getString(3) %> </td>
              <td> <%= resultset1.getString(4) %> </td>
              <%System.out.println("applicantID to be sent "+ApplicantIDs[i] );
              String url = "displayResume?applicantID="+ApplicantIDs[i];%>
              <td> <p data-placement="top" data-toggle="tooltip" title="Edit"><a href="<%=url%>" class="btn btn-primary btn-xs" data-title="Edit" data-toggle="modal"  ><span class="glyphicon glyphicon-file"></span></a></p> </td>
             <!--  <td> <p data-placement="top" data-toggle="tooltip" title="Edit"><a href="displayResume?applicantID=18" class="btn btn-primary btn-xs" data-title="Edit" data-toggle="modal"  ><span class="glyphicon glyphicon-file"></span></a></p> </td> -->
                </tr>
					
					<%
			
			}
	}
			
        %>   		
    		
           </table>
           </div>
          <% 
           }
 
           
%>
</body>
</html>