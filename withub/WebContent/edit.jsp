<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="EUC-KR">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script type="text/javascript" src="JavaScript/profile.js">
</script>
<!-- Bootstrap Core CSS -->
   <link href="cssiyer/bootstrap.min.css" rel="stylesheet">
	<link href="cssiyer/bootstrap.css" rel="stylesheet">
    <link href="cssiyer/heroic-features.css" rel="stylesheet">
<link href="css/profile.css" rel="stylesheet">
<title>Edit Profile</title>
</head>
<body>

<%@ include file="header.jsp" %>

<br>
<br>
<a href="profile.jsp">Back</a>

<section>



<div class="container" style="margin-top: 30px;">
<div class="profile-head">
<div class="col-md- col-sm-4 col-xs-12">
<img src="${File_Path}" class="img-responsive" />
<h6><%out.print(name);%></h6>
</div><!--col-md-4 col-sm-4 col-xs-12 close-->


<div class="col-md-5 col-sm-5 col-xs-12">
<h5><%out.print(name);%></h5>
<p><%out.print(session.getAttribute("industry"));%> </p>
<ul>
<li><span class="glyphicon glyphicon-briefcase" ></span><%out.print(session.getAttribute("experience"));%></li>
<li><span class="glyphicon glyphicon-map-marker"></span><%out.print(session.getAttribute("address"));%></li>
<li><span class="glyphicon glyphicon-home"></span><%out.print(session.getAttribute("prefered_location"));%></li>
<li><span class="glyphicon glyphicon-phone"></span> <a href="#" title="call"><%out.print(session.getAttribute("phone"));%></a></li>
<li><span class="glyphicon glyphicon-envelope"></span><a href="#" title="mail"><%out.print(session.getAttribute("email"));%></a></li>

</ul>


</div><!--col-md-8 col-sm-8 col-xs-12 close-->




</div><!--profile-head close-->
</div><!--container close-->


<div id="sticky" class="container">
    
    <!-- Nav tabs -->
    <ul class="nav nav-tabs nav-menu" role="tablist">
      <li class="active">
          <a href="edit.jsp" role="tab" data-toggle="tab">
              <i class="fa fa-male"></i> Edit Profile
          </a>
      </li>
      <li><a href="profile.jsp" role="tab" data-toggle="tab">
          <i class="fa fa-key"></i>Profile
          </a>
 <%/* %> <li><a href="mentors.jsp" role="tab" data-toggle="tab">
          <i class="fa fa-key"></i> Mentors
          </a>
      </li>
       </li>      <li><a href="mentees.jsp" role="tab" data-toggle="tab">
          <i class="fa fa-key"></i> Mentees
          </a>
          <%*/ %>
      </li> 	<li><a href="${pageContext.request.contextPath}/MentorMenteeManager?memberID=${MID}" role="tab" data-toggle="tab">
          <i class="fa fa-key"></i> Mentor-Mentee Forum 
          </a>
      </li>
    </ul><!--nav-tabs close-->
    
    <!-- Tab panes -->
    <div class="tab-content">
    <div class="container">

<div class="row">
<div class="col-sm-12">
<h2 class="register">Edit Your Profile</h2>
</div><!--col-sm-12 close-->

</div><!--row close-->
<br />
<div class="row">

<form class="form-horizontal main_form text-left" action="EditServlet" method="post"  id="contact_form">
<fieldset>


<div class="form-group col-md-12">
  <label class="col-md-10 control-label">First Name</label>  
  <div class="col-md-12 inputGroupContainer">
  <div class="input-group">
  <input  name="fname"   id="fname" value="<%out.print(session.getAttribute("fname"));%>" class="form-control"  type="text">
    </div>
  </div>
</div>

<!-- Text input-->

<div class="form-group col-md-12">
  <label class="col-md-10 control-label" >Last Name</label> 
    <div class="col-md-12 inputGroupContainer">
    <div class="input-group">
  <input name="lname" id="lname" value="<%out.print(session.getAttribute("lname"));%>" class="form-control"  type="text">
    </div>
  </div>
</div>

<!-- Text input-->
       <div class="form-group col-md-12">
  <label class="col-md-10 control-label">E-Mail</label>  
    <div class="col-md-12 inputGroupContainer">
    <div class="input-group">
  <input name="email" id="email" value="<%out.print(session.getAttribute("email"));%>"  class="form-control"  type="text">
    </div>
  </div>
</div>


<!-- Text input-->
       
<div class="form-group col-md-12">
  <label class="col-md-10 control-label">Phone #</label>  
    <div class="col-md-12 inputGroupContainer">
    <div class="input-group">
  <input name="phone"  id="phone" value="<%out.print(session.getAttribute("phone"));%>"  class="form-control" type="text">
    </div>
  </div>
</div>

<!-- Text input-->
      
 <div class="form-group col-md-12">
  <label class="col-md-10 control-label">Address</label>
    <div class="col-md-12 inputGroupContainer">
    <div class="input-group">
            <input name="address"  id="address" value="<%out.print(session.getAttribute("address"));%>"  class="form-control" type="text">
  </div>
  </div>
</div>

 <div class="form-group col-md-12">
  <label class="col-md-10 control-label">Project Description</label>
    <div class="col-md-12 inputGroupContainer">
    <div class="input-group">
        	<textarea class="form-control" name="project_description" id="project_description" value="<%out.print(session.getAttribute("project_description"));%>" ></textarea>
  </div>
  </div>
</div>



<div class="form-group col-md-12"> 
  <label class="col-md-10 control-label">Industry</label>
    <div class="col-md-12 selectContainer">
    <div class="input-group">
    <select name="industry" id="industry" class="form-control selectpicker" >
      <option value="<%out.print(session.getAttribute("industry"));%>" >Industry</option>
      <option>Business Analyst</option>
      <option>Finance</option>
      <option>Data Science</option>
      <option>Marketing</option>
      <option>Information Technology</option>
      <option>Telecommunication</option>
    </select>
  </div>
</div>
</div>


<!-- Select Basic -->
   
<div class="form-group col-md-12"> 
  <label class="col-md-10 control-label">Qualification</label>
    <div class="col-md-12 selectContainer">
    <div class="input-group">
    <select name="qualification" id="qualification" class="form-control selectpicker" >
           <option value="<%out.print(session.getAttribute("qualification"));%> " >Qualification</option>
      <option>Bachelor of Science</option>
      <option>Master of Science</option>
      <option >PhD</option>
      <option>MAster of Business Administration</option>
    </select>
  </div>
</div>
</div>



<div class="form-group col-md-12"> 
  <label class="col-md-10 control-label">Expertise areas</label>
    <div class="col-md-12 selectContainer">
    <div class="input-group">
    <select name="expertise_areas" id="expertise_areas" class="form-control selectpicker" >
      <option value=" <%out.print(session.getAttribute("expertise_areas"));%>" >Expertise areas</option>
      <option>Data Science</option>
      <option>Computer science</option>
      <option>Marketing</option>
      <option>Finance</option>
      <option>Telecommunication</option>
      <option>Business Analyst</option>
    </select>
  </div>
</div>
</div>

<div class="form-group col-md-12"> 
  <label class="col-md-10 control-label">Experience</label>
    <div class="col-md-12 selectContainer">
    <div class="input-group">
    <select name="experience" id="experience" class="form-control selectpicker" >
      <option value="  <%out.print(session.getAttribute("experience"));%>" >your Experience</option>
      <option>1-2 year</option>
      <option>2-3 years</option>
      <option >3-4 years</option>
      <option >4-5 years</option>
      <option >5+ years</option>
    </select>
  </div>
</div>
</div>

<div class="form-group col-md-12"> 
  <label class="col-md-10 control-label">Salary expected</label>
    <div class="col-md-12 selectContainer">
    <div class="input-group">
    <select name="salary_expected" id="salary_expected" class="form-control selectpicker" >
      <option value="  <%out.print(session.getAttribute("salary_expected"));%>" >Salary expected</option>
      <option>Above 100 thousand</option>
      <option>90-100 thousand</option>
      <option>70-90 thousand</option>
      <option>70-80 thousand</option>
      <option>60-70 thousand</option>
      <option>50-60 thousand</option>
    </select>
  </div>
</div>
</div>

<div class="form-group col-md-12"> 
  <label class="col-md-10 control-label">Preferred Location</label>
    <div class="col-md-12 selectContainer">
    <div class="input-group">
    <select name="prefered_location" id="prefered_location" class="form-control selectpicker" >
      <option value=" <%out.print(session.getAttribute("prefered_location"));%>" >Preferred Location</option>
      <option>New York</option>
      <option>Chicago</option>
      <option>Houston</option>
      <option>Miami</option>
      <option>Las Vegas</option>
      <option>San Antonio</option>
      <option>Los Angeles</option>
      <option>Gotham</option>
      <option>Washington DC</option>
      <option>Palo Alto</option>
      <option>San Francisco</option>
    </select>
  </div>
</div>
</div>

<!--<div class="form-group col-md-12">
  <label class="col-md-10 control-label">Project Description</label>
    <div class="col-md-10 inputGroupContainer">
    <div class="input-group">
        <span class="input-group-addon"><i class="glyphicon glyphicon-pencil hint_icon"></i></span>
        	<textarea class="form-control" name="comment" placeholder="Project Description"></textarea>
  </div>
  </div>
</div>-->

<% /* %>
<div class="form-group col-md-12">
  <label class="col-md-10 control-label">Password</label>  
  <div class="col-md-12 inputGroupContainer">
  <div class="input-group">
  <input  name="password" id="password"  placeholder="Password" class="form-control"  type="password">
    </div>
  </div>
</div>



<div class="form-group col-md-12">
  <label class="col-md-10 control-label">Confirm Password</label>  
  <div class="col-md-12 inputGroupContainer">
  <div class="input-group">
  <input  name="con_password" id="con_password" placeholder="Confirm Password" class="form-control"  type="password">
    </div>
  </div>
</div>


<!-- radio checks -->
 <div class="form-group col-md-12">
                        <label class="col-md-10 control-label">Gender</label>
                        <div class="col-md-6">
                            <div class="radio col-md-2">
                                <label>
                                    <input type="radio" name="gender" id="gender" value="yes" /> Male
                                </label>
                            </div>
                            <div class="radio col-md-2">
                                <label>
                                    <input type="radio" name="gender" id="gender" value="no" /> Female
                                </label>
                            </div>
                        </div>
                    </div>

<!-- upload profile picture -->
<div class="col-md-12 text-left">
<div class="upload-picture">
<span class="btn btn-default upload-file">
    Upload Photo <input type="file" />
</span>
<span class="btn btn-default upload-file">
    Upload Resume <input type="file" />
</span>
<span class="btn btn-default upload-file">
    Upload Video <input type="file" />
</span>
</div><!--upload-picture close-->
</div><!--col-md-12 close-->
<% */ %>
<!-- Button -->
<div class="form-group col-md-10">
  <div class="col-md-6">
    <button type="submit" name="action" value="save" class="btn btn-warning submit-button" >Save</button>
    <button type="submit" name="action" value="cancel" class="btn btn-warning submit-button" >Cancel</button>

  </div>
</div>
</fieldset>
</form>


</div><!--tab-pane close-->

</div><!--container close-->
</div><!--tab-pane close-->

      
</section><!--section close-->



</body>

</html>