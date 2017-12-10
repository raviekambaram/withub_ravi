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
            <a id="menu-close" href="#" class="btn btn-light btn-lg pull-right toggle"><i class="fa fa-times"></i></a>
            <li class="sidebar-brand">
                <a href="index.jsp#top" onclick=$("#menu-close").click();>WitHub</a>
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
                <a href="index.jsp#top" onclick=$("#menu-close").click();>Home</a>
            </li>
            
            <li>
                <a href="index.jsp#about" onclick=$("#menu-close").click();>About</a>
            </li>
            <li>
                <a href="index.jsp#services" onclick=$("#menu-close").click();>Services</a>
            </li>
<% 
				if(session.getAttribute("email") == null)
				{
			%>
            <li>
                <a href="index.jsp#login" onclick=$("#menu-close").click();>Login</a>
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
            	<a href="LogOutServlet?method=post" >Logout</a>
            </li>
            <% 
				} 
			%>
			<% 
				if(session.getAttribute("email") != null)
				{
			%>
			<li>
            	<a href="searchProfile.jsp" onclick=$("#menu-close").click()>Search Profile</a>
            </li>
           
            <% 
				} 
			%>            
            <li>
                <a href="index.jsp#contact" onclick=$("#menu-close").click();>Contact</a>
            </li>
        </ul>
    </nav>

</body>
</html>