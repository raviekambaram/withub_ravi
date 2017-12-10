<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="withub.DBCon"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Job Description</title>
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


<%String jobID = request.getParameter("jobID");
Connection connection = DBCon.getConnection();
Statement statement = connection.createStatement(); 
String sql = "select * from jobs where jobID = "+jobID;
ResultSet resultset = statement.executeQuery(sql);
resultset.next();


%>
         <section id="blog" class="news" >
            <div class="container">
                <div class="row">
                    <div class="main_news sections">
                        <div class="head_title text-center">
                            <h1><b><u><%=resultset.getString(2)%></u></b></h1>
                            <div class="separator"></div>
                            <p></p>
                        </div>


                        <div class="main_news_content_area">
                            <div class="main_news_content">
                                <div class="col-sm-5 ">
                                    <div class="single_news_content_left">
                                        <!-- <div class="news_content_left_thumbnail">
                                            <img src="assets/images/blog1.jpg" alt="" />
                                        </div> -->
                                        <div class="news_content_left_content">
                                            <p class="subtitle"><strong><b><u><font size="5">Detailed Job Description :</font></u></b></strong> <%=resultset.getString(11)%></p>
                                            <div class="separator2"></div>
                                            <p><strong><b><u><font size="5">JOB Requirement:</font></u></b></strong> <%=resultset.getString(7)%></p>

                                            <div class="news_content_left_bottom">
                                                <p><strong><b><u><font size="5">Job Summary: </font></u></b></strong><%=resultset.getString(3)%></p>
                                            </div>
                                        </div>

                                    </div>
                                </div>
                                <div class="col-sm-7 col-xs-12">
                                    <div class="news_right_content">
                                        <div class="single_news_right_content">
                                            <!-- <div class="row">
                                                <div class="col-sm-3 col-xs-3 no-padding">
                                                    <div class="single_right_img">
                                                        <img src="assets/images/blog1.jpg" alt="" />
                                                    </div>
                                                </div> -->
                                                <div class="col-sm-8 col-xs-8 no-padding">
                                                    <div class="single_right_content">
                                                        <p class="subtitle"><strong><b><u><font size="5">Company Name: </font></u></b></strong><%=resultset.getString(6)%></p>
                                                        <!-- <a class="news_icon" href=""><i class="fa fa-folder"></i>guitar lessons</a> -->
                                                    </div>
                                                </div>
                                              <!--   <div class="col-sm-1 col-xs-1 no-padding">
                                                    <div class="single_icon_area text-center">
                                                        <div class="single_icon_content">
                                                            <i class="fa fa-comments"></i>
                                                            
                                                        </div>
                                                        <div class="single_icon_content single_icon_content_calander">
                                                            <i class="fa fa-calendar"></i>
                                                            <p href="">1/6</p>
                                                        </div>
                                                    </div>
                                                </div> -->
                                            </div>
                                        </div>
                                        <div class="single_news_right_content">
                                            <div class="row">
                                                <!-- <div class="col-sm-3 col-xs-3 no-padding">
                                                    <div class="single_right_img">
                                                        <img src="assets/images/blog1.jpg" alt="" />
                                                    </div>
                                                </div> -->
                                                <div class="col-sm-8 col-xs-8 no-padding">
                                                    <div class="single_right_content">
                                                        <p class="subtitle"><strong><b><u><font size="5">Job Location:</font></u></b></strong> <%=resultset.getString(9)%></p>
                                                        <!-- <a class="news_icon" href=""><i class="fa fa-folder"></i>guitar lessons</a> -->
                                                    </div>
                                                </div>
                                               <!--  <div class="col-sm-1 col-xs-1 no-padding">
                                                    <div class="single_icon_area text-center">
                                                        <div class="single_icon_content">
                                                            <i class="fa fa-comments"></i>
                                                            <p href="">16</p>
                                                        </div>
                                                        <div class="single_icon_content single_icon_content_calander">
                                                            <i class="fa fa-calendar"></i>
                                                            <p href="">1/6</p>
                                                        </div>
                                                    </div>
                                                
                                                 </div> -->
                                            </div>
                                        </div>
                                        <div class="single_news_right_content">
                                            <div class="row">
                                                <!-- <div class="col-sm-3 col-xs-3 no-padding">
                                                    <div class="single_right_img">
                                                        <img src="assets/images/blog1.jpg" alt="" />
                                                    </div>
                                                </div> -->
                                                <div class="col-sm-8 col-xs-8 no-padding">
                                                    <div class="single_right_content">
                                                        <p class="subtitle"><strong><b><u><font size="5">Contact Details: </font></u></b></strong><%=resultset.getString(10)%></p>
                                                        <!-- <a class="news_icon" href=""><i class="fa fa-folder"></i>guitar lessons</a> -->
                                                    </div>
                                                </div>
                                                <!-- <div class="col-sm-1 col-xs-1 no-padding">
                                                    <div class="single_icon_area text-center">
                                                        <div class="single_icon_content">
                                                            <i class="fa fa-comments"></i>
                                                            <p href="">16</p>
                                                        </div>
                                                        <div class="single_icon_content single_icon_content_calander">
                                                            <i class="fa fa-calendar"></i>
                                                            <p href="mentor.html">2/6</p>
                                                        </div>
                                                    </div>
                                                </div> -->
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        
                    </div>
                </div>
        </section>
        <div class="bottom_btn_area_content text-center">
                            <a href="jobdescServlet?jobID=<%=jobID%>" class="btn btn-larg btn_news_color">APPLY</a>
                            <a href="jobsearch.jsp" class="btn btn-larg btn_news_color">CANCEL</a>
                        </div>
</body>
</html>