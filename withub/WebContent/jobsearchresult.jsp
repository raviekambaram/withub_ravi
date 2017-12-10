<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="withub.DBCon"%>
<%@ page import="java.sql.*" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Roboto:400,100,300,500">
        <link rel="stylesheet" href="form-1/assets/bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" href="form-1/assets/font-awesome/css/font-awesome.min.css">
<link href="css/joblisting.css" rel="stylesheet">
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
      <div class="row">
            <section class="content">
 
<div class="container">
      <div class="row">
           
       
        <div class="col-md-12">
        <h4>Job Search Results</h4>
        <div class="table-responsive">
 
             
              <table id="mytable" class="table table-bordred table-striped">
                  
                   <thead>
                   <th>Job Title</th>
                    <th>Job Description</th>
                     <th>Employer</th>
                      <th>Apply</th>
                   </thead>
    <tbody>
    <%     
            String empID = request.getParameter("empID");
            System.out.println("jobsearchresult"+empID);
            request.setAttribute("empID", empID);
                 String search=request.getParameter("searchvalue");
System.out.println("search: "+search);
            Connection connection = DBCon.getConnection();
            Statement statement = connection.createStatement();
            String sql = "select jobID,jname,jdesc,employer from jobs where jname like  \"%"+search+"%\"";
            ResultSet resultset =
                statement.executeQuery(sql);
            System.out.println(sql);
           
%>
   
    
<%
                  if(!resultset.next())
                  {
                  /*    System.out.println("if no result set . next");
                        System.out.println(sql1);
                        ResultSet rs = statement.executeQuery(sql1);
                        System.out.println("after result set");
                        if(!rs.next())
                        {
                              System.out.println("no result in both the query");
                        */    %>
                             
                              <!-- <h1>Hello</h1> -->
                             
                             
                              <%/*
                        }
                        else{
                              System.out.println("checking for rs.next");
                              do
                              {
                                    System.out.println("result available for second query");
                             
                              */%>
                             
                 
          <%--  <tr>
               <td> <%= rs.getString(1) %> </td>
               <td> <%= rs.getString(2) %> </td>
               <td> <%= rs.getString(3) %> </td>
               <td> <%= rs.getString(4) %> </td>
               <td> <%= rs.getString(5) %> </td>
               <td> <%= rs.getString(6) %> </td>
               <td> <%= rs.getString(7) %> </td>
           </tr> --%>
                              <%/*
                       
                 
                        }while(rs.next());
                        }
                       
                 
                  */}
                  else
                  {
                        System.out.println("entering mm else");
                        %>
                        <h1>Job Search Results</h1>
                        <%
                        do
                        {
                              System.out.println("result available for first query");
                              %>
                              <tr>
              <td> <%= resultset.getString(2) %> </td>
               <td> <%= resultset.getString(3) %> </td>
               <td> <%= resultset.getString(4) %> </td>
               <td><p data-placement="top" data-toggle="tooltip" title="Edit"><a href="jobdescServlet?jobID=<%= resultset.getString(1)%>" class="btn btn-primary btn-xs" data-title="Edit" data-toggle="modal"  ><span class="glyphicon glyphicon-ok"></span></a></p></td>
           </tr>
                             
                              <%
                 
                  }while(resultset.next());
                  }
                 
        %>             
           
        
    
   
    
    </tbody>
       
</table>
 
<!-- <div class="clearfix"></div>
<ul class="pagination pull-right">
  <li class="disabled"><a href="#"><span class="glyphicon glyphicon-chevron-left"></span></a></li>
  <li class="active"><a href="#">1</a></li>
  <li><a href="#">2</a></li>
  <li><a href="#">3</a></li>
  <li><a href="#">4</a></li>
  <li><a href="#">5</a></li>
  <li><a href="#"><span class="glyphicon glyphicon-chevron-right"></span></a></li>
</ul>
               
            </div>
-->           
        </div>
      </div>
</div>
 <!-- 
 
<div class="modal fade" id="edit" tabindex="-1" role="dialog" aria-labelledby="edit" aria-hidden="true">
      <div class="modal-dialog">
    <div class="modal-content">
          <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span></button>
        <h4 class="modal-title custom_align" id="Heading">Edit Your Detail</h4>
      </div>
          <div class="modal-body">
          <div class="form-group">
        <input class="form-control " type="text" placeholder="Mohsin">
        </div>
        <div class="form-group">
       
        <input class="form-control " type="text" placeholder="Irshad">
        </div>
        <div class="form-group">
        <textarea rows="2" class="form-control" placeholder="CB 106/107 Street # 11 Wah Cantt Islamabad Pakistan"></textarea>
   
        
        </div>
      </div>
          <div class="modal-footer ">
        <button type="button" class="btn btn-warning btn-lg" style="width: 100%;"><span class="glyphicon glyphicon-ok-sign"></span> Update</button>
      </div>
        </div>
    /.modal-content
  </div>
      /.modal-dialog
    </div>
   
    
    
    <div class="modal fade" id="delete" tabindex="-1" role="dialog" aria-labelledby="edit" aria-hidden="true">
      <div class="modal-dialog">
    <div class="modal-content">
          <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span></button>
        <h4 class="modal-title custom_align" id="Heading">Delete this entry</h4>
      </div>
          <div class="modal-body">
      
       <div class="alert alert-danger"><span class="glyphicon glyphicon-warning-sign"></span> Are you sure you want to delete this Record?</div>
      
      </div>
        <div class="modal-footer ">
        <button type="button" class="btn btn-success" ><span class="glyphicon glyphicon-ok-sign"></span> Yes</button>
        <button type="button" class="btn btn-default" data-dismiss="modal"><span class="glyphicon glyphicon-remove"></span> No</button>
      </div>
        </div>
    /.modal-content
  </div>
      /.modal-dialog
    </div> 
                  </div>
            </section>
           
      </div>
</div> -->
</body>
</html>
 