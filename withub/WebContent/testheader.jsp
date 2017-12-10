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
String name=(String)session.getAttribute("fname") + " "+ (String)session.getAttribute("lname");
%>
<!-- Navigation -->
    <a id="menu-toggle" href="#" class="btn btn-dark btn-lg toggle"><i class="fa fa-bars"></i></a>
    <nav id="sidebar-wrapper">
        <ul class="sidebar-nav">
            <a id="menu-close" href="#" class="btn btn-light btn-lg pull-right toggle">
            <i class="fa fa-times"></i>
            </a>
            <li class="sidebar-brand">
                <a href="#top" onclick=$("#menu-close").click();>WiTHub</a>
            </li>
            <% 
if(session.getAttribute("email") != null)
{
%>
            <li>
            <a>Welcome, <% out.print( session.getAttribute("email") ); %> </a>
            </li>
            <% 
} 
%>
            <li>
                <a href="#top" onclick=$("#menu-close").click();>Home</a>
            </li>
            
            <li>
                <a href="#about" onclick=$("#menu-close").click();>About</a>
            </li>
            <li>
                <a href="#services" onclick=$("#menu-close").click();>Services</a>
            </li>
            <% 
if(session.getAttribute("email") == null)
{
%>
            <li>
                <a href="#login" onclick=$("#menu-close").click();>Login</a>
            </li>
            <% 
} 
%>
<% 
if(session.getAttribute("email") != null)
{
%>
            <li>
            <a href="logout.jsp" onclick=$("#menu-close").click()>Logout</a>
            </li>
            <% 
} 
%>
            
            <li>
                <a href="#contact" onclick=$("#menu-close").click();>Contact</a>
            </li>
        </ul>
    </nav>
    <div class="container" style="background-image: url('../images/symbol.jpg');">
    <img src = "images/symbol.jpg" height="102" width="200" align="middle" alt="myimage"/>
    </div>
<% /* %>

 <!-- Navigation -->
    <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation" style="background-color: white; border: none; background-image: url('../images/symbol.jpg');">
        <div class="container" style="background-image: url('../images/symbol.jpg');">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="header_nav row-xs-1" id="bs-example-navbar-collapse-1" >
            <a id="menu-toggle" href="#" class="btn btn-dark btn-lg toggle"><i class="fa fa-bars"></i></a>
    
        <ul class="sidebar-nav">
            <a id="menu-close" href="#" class="btn btn-light btn-lg pull-right toggle">
            <i class="fa fa-times"></i>
            </a>
            <li class="sidebar-brand">
                <a href="index.html" onclick=$("#menu-close").click();>WiTHub</a>
            </li>
            <% 
if(session.getAttribute("email") != null)
{
%>
            <li>
            <a>Welcome, <% out.print( name ); %> </a>
            </li>
            <% 
} 
%>
            <li>
                <a href="index.html#top" onclick=$("#menu-close").click();>Home</a>
            </li>
            
            <li>
                <a href="index.html#about" onclick=$("#menu-close").click();>About</a>
            </li>
            <li>
                <a href="index.html#services" onclick=$("#menu-close").click();>Services</a>
            </li>
            <% 
if(session.getAttribute("email") == null)
{
%>
            <li>
                <a href="#login" onclick=$("#menu-close").click();>Login</a>
            </li>
            <% 
} 
%>
<% 
if(session.getAttribute("email") != null)
{
%>
<li>
            <a href="profile.jsp" onclick=$("#menu-close").click()>Profile</a>
            </li>
            <li>
            <a href="logout.jsp" onclick=$("#menu-close").click()>Logout</a>
            </li>
            <% 
} 
%>
            
            <li>
                <a href="index.html#contact" onclick=$("#menu-close").click();>Contact</a>
            </li>
        </ul>
        
            <img src = "images/symbol.jpg" height="102" width="200" align="middle" alt="myimage"/>
    
            </div>
            <!-- /.navbar-collapse -->
        </div>
        </nav>
<% */ %>
</body>
</html>