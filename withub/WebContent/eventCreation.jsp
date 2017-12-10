<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Create new event</title>
	<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7; IE=EmulateIE9">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1.0, user-scalable=no"/>
    <link rel="stylesheet" type="text/css" href="css/style.css" media="all" />
    <link rel="stylesheet" type="text/css" href="css/demo.css" media="all" />
    
  <script type="text/javascript">
            var x = 0;
            
            function hideBoth()  
            {  
               document.getElementById("fee").style.visibility="hidden";  
                
            }
            
            function hola() {
                if(document.getElementById("paid").equals("f")) {
                    document.getElementById("fee").style="disabled";
                }
            }
            function myFunction() {
                document.getElementById("fee").classList.toggle("show");
            }
        </script>   
</head>
<body>
<div class="container">
            <div class="eventCreation-top">
                <a href="index.jsp" target="_blank">Home</a>
                <span class="right">
                    <a href="eventlist1.jsp">
                        <strong>Back to the Events page</strong>
                    </a>
                </span>
                <div class="clr"></div>
            </div>
			<header>
				<div class="header_event"><h1 style="color:black;  font-size: 250%;"><strong>Event Creation.</strong></h1></div>
            </header>
            <div class="event_creation">       
      <div  class="form">
    		<form id="contactform" action="UploadServlet1" method="post" > 
    			<p class="contact"><label for="eventname">Event Name</label></p> 
    			<input id="ename" name="ename" value="" required="" tabindex="1" type="text"> 
    			    
    			<p class="contact"><label for="description">Description of the event</label></p> 
    			<textarea id="desc" name="desc" value="" required="" rows="8" cols="50"></textarea> 
  
         		<p class="contact"><label for="eventtype">Event Type</label></p> 
    			<input id="eventtype" name="eventtype" value="" required="" tabindex="3" type="text">
    			
            
            	<p class="contact"><label for="fee">Registration fee</label></p> 
    			<input id="fee" name="fee" value="" required="" tabindex="2" type="text">
    			
    			
            
     <!--   <p class="contact"><label for="phone">Mobile phone</label></p> 
            <input id="phone" name="phone" placeholder="phone number" required="" type="text"> -->
            
            <br><br>
            <input type="hidden" name="poster_path" value='${poster_path}'>	
            <input class="button" name="submit" id="submit" tabindex="5" value="Create event!" type="submit"> 	 
   </form>
   	
   	<br><br>
	<form action="UploadServlet2" method="post" enctype="multipart/form-data">
		<table >
			<tr>
				<td  >Event poster: </td>
				<td>Select a poster to upload:  &nbsp; &nbsp;<input type="file" name="image" size="50" /> &nbsp; &nbsp;
	<input type="submit" name="upload" value="Upload"/> <font color="red"> &nbsp;&nbsp; ${posterUploadMessage}</font></td>
			</tr>
			<tr><td><img src='${poster_path}' width="100" height="100"/></td></tr>
		</table>
	</form> 
   </div>
</div>      
</div>
</body>
</html>