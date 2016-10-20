<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">


<!--Optional theme-->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap-theme.min.css">
<script src="resources/js/jquery.js"></script>
<!-- Latest compiled and minified JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
<style>
body{background-color:#65c6c3
}

</style>

</head>
<body>



<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-2">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="#">${sessionScope.user.firstName}</a>
    </div>

    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-2">
     
      
      
      <ul class="nav navbar-nav navbar-right">
        <li><a href="#">ABOUT</a></li>
         <li><a href="#">CONTACT US</a></li>
          <li><a href="#">SERVICES</a></li>
           <li><a href="logout">LOGOUT</a></li>
      </ul>
    </div>
  </div>
</nav>







	<div class="container" style="padding-top: 60px;">
	
	
	
	
	
	
		<h1 class="page-header">Edit Profile</h1>
		<div class="row">
			<!-- left column -->


			<div class="col-md-4 col-sm-6 col-xs-12">
				<div class="text-center">
					<img class="avatar img-circle img-thumbnail" alt="avatar" src="${sessionScope.user.profilePicture}">
					<form class="form-horizontal" role="form" method="POST" action="uploadFile" enctype="multipart/form-data">
        			File to upload: <input type="file" name="file"><br /> 
        
        			<input type="submit" value="Upload"> Press here to upload the file!
    			</form>
				</div>
			</div>
			<!-- edit form column -->
			<div class="col-md-8 col-sm-6 col-xs-12 personal-info">
				<div class="alert alert-info alert-dismissable">
					<a class="panel-close close" data-dismiss="alert">×</a> <i
						class="fa fa-coffee"></i><center><strong> View your profile!</strong></center>
				</div>
				<h3>Personal info</h3>




				<form class="form-horizontal" role="form">
					<div class="form-group">
						<label class="col-lg-3 control-label">First name:</label>
						<div class="col-lg-8">
							<input class="form-control" type="text" value="${user.firstName}">
						</div>
					</div>
					<div class="form-group">
						<label class="col-lg-3 control-label">Last name:</label>
						<div class="col-lg-8">
							<input class="form-control"  type="text" value="${sessionScope.user.lastName}">
						</div>
					</div>
					<div class="form-group">
						<label class="col-lg-3 control-label">Username:</label>
						<div class="col-lg-8">
							<input class="form-control"  type="text" value="${sessionScope.user.userName}">
						</div>
					</div>
					<div class="form-group">
						<label class="col-lg-3 control-label">Email:</label>
						<div class="col-lg-8">
							<input class="form-control" value="${sessionScope.user.emailAccounts[0].emailAccount}"
								type="text">
						</div>
					</div>
					
					
					
					
					<div class="form-group">
						<label class="col-md-3 control-label">Your Status:</label>
						<div class="col-md-8">
							<input class="form-control" value=" yayy! my emailsystem is working *happy* " type="text">
						</div>
					</div>
					
					<div class="form-group">
						<label class="col-md-3 control-label">Gender:</label>
						<div class="col-md-8">
							<input class="form-control" value="${sessionScope.user.gender}" type="text">
						</div>
					</div>
					
					<div class="form-group">
						<label class="col-md-3 control-label">Birthdate:</label>
						<div class="col-md-8">
							<input class="form-control" value="${sessionScope.user.birthDate}" type="text">
						</div>
					</div>
					
					
					<div class="form-group">
						<label class="col-md-3 control-label"></label>
						<div class="col-md-8">
							
							<span></span> <input class="btn btn-default" value="Cancel"
								type="reset">
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>




</body>
</html>