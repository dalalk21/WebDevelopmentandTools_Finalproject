<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix = "form" %>
<%@ page session="false" %>
	
	
	


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html lang="en">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>Home Page</title>

<!-- Bootstrap Core CSS -->
<link rel="stylesheet" href="resources/css/bootstrap.min.css"
	type="text/css">

<!-- Custom Fonts -->
<link
	href='http://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800'
	rel='stylesheet' type='text/css'>
<link
	href='http://fonts.googleapis.com/css?family=Merriweather:400,300,300italic,400italic,700,700italic,900,900italic'
	rel='stylesheet' type='text/css'>
<link rel="stylesheet"
	href="resources/font-awesome/css/font-awesome.min.css" type="text/css">

<!-- Plugin CSS -->
<link rel="stylesheet" href="resources/css/animate.min.css"
	type="text/css">

<!-- Custom CSS -->
<link rel="stylesheet" href="resources/css/creative.css" type="text/css">

<style>
.media-heading{
font-style: Strong;
}

span{
background: none;

}

.media
    {
        
        margin: 20px 0;
        padding:40px;
		display: inline;
		margin-left: 130px;
		
    }
	
	.col-md-6{
	padding-bottom: 20px;
	font-family:courier;
	font-size: 15px;
	
	}
	
    .dp
    {
        border:10px solid #eee;
        transition: all 0.2s ease-in-out;
    }
    .dp:hover
    {
        border:2px solid ;
        transform:rotate(360deg);
        -ms-transform:rotate(360deg);  
        -webkit-transform:rotate(360deg);  
        /*-webkit-font-smoothing:antialiased;*/
    }
</style>

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body id="page-top">

	<div class="container">
		<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<h4 class="modal-title" id="myModalLabel">Please sign in</h4>
					</div>
					<div class="modal-body">




						<form:form method = "POST" commandName="user" class="form-signin" >

							<label for="inputEmail" class="sr-only">UserName</label> 
							<form:input  path="userName" class="form-control" placeholder="username"/> 
							<form:errors path="userName" cssStyle="color:#ff0000" ></form:errors>
								
								<label for="inputPassword" class="sr-only">Password</label> 
								<form:input type="password" path="password" class="form-control" placeholder="password"/>
                                <form:errors path="password" cssStyle="color:#ff0000"/>
								
							<div class="checkbox">
								<label> <input type="checkbox" value="remember-me">
									Remember me
								</label>
							</div>
							<button class="btn btn-lg btn-primary btn-block" type="submit" name="submit" value="Member Login"> LOGIN
								in</button>
						</form:form>




					</div>
					<!-- <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Save changes</button>
      </div> -->
				</div>
			</div>
		</div>
	</div>



	<nav id="mainNav" class="navbar navbar-default navbar-fixed-top">
	<div class="container-fluid">
		<!-- Brand and toggle get grouped for better mobile display -->
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand page-scroll" href="SignupPage"> New
				Employee ? Sign Up Here</a>
		</div>

		<!-- Collect the nav links, forms, and other content for toggling -->
		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav navbar-right">
				<li><a class="page-scroll" href="about">About</a></li>
				<li><a class="page-scroll" href="help">Help</a></li>

				<li><a class="page-scroll" href="contactUs">Contact</a></li>
			</ul>
		</div>
		<!-- /.navbar-collapse -->
	</div>
	<!-- /.container-fluid --> </nav>

	<header>
	<div class="header-content">
		<div class="header-content-inner">
			<h1>Your Personal Mail Tracker!</h1>
			<hr>
			<p>Web Email Client for GMAIL and YAHOO!</p>
			<!--<a href="#about" class="btn btn-primary btn-xl page-scroll">LOGIN HERE</a>-->


			<button type="button" class="btn btn-primary btn-xl"
				data-toggle="modal" data-target="#myModal">Login Here</button>

			<!-- <div class="modal fade bs-example-modal-sm" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">
           <div class="modal-dialog modal-sm">
           <div class="modal-content">
            ...
            </div>
            </div>
            </div> -->











		</div>
	</div>
	</header>

		<section class="bg-primary" id="about">
	<div class="container">
		<div class="row">


		<div class="col-md-6">
			<div class="media">
				<a class="pull-left" href="#">
					<img class="media-object dp img-circle" src="https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcQ0lXjGCYj1psYiLf-yBU9cCj4ldWHdj0c7-_Dr8WD_nQHELj7w" style="width: 100px;height:100px;">
				</a>
				<div class="media-body">
					<h4 class="media-heading">GOOGLE </h4>
					
					<hr style="margin:8px auto">

					<span>Built on a idea that email canbe more efficient.
					</span>
					
				</div>
			
			
			</div>
		</div>
		
		  <div class="col-md-offset-2">
        <div class="media">
            <a class="pull-left" href="#">
                <img class="media-object dp img-circle" src="http://newscenter.sdsu.edu/sdsu_newscenter/images/taip.jpg" style="width: 100px;height:100px;">
            </a>
            <div class="media-body">
                <h4 class="media-heading">LESS SPAN</h4>
                <hr style="margin:8px auto">

                <span>Keep unwanted messages out of your inbox 
				with Google's innovative technology.</span>
				
               
            </div>
        </div>
    </div>
		</div>
		
		<div class="row">

<div class="col-md-6">
			<div class="media">
				<a class="pull-left" href="#">
					<img class="media-object dp img-circle" src="http://distriqt.com/wordpress/wp-content/themes/slate/images/icon-mobile.png" style="width: 100px;height:100px;">
				</a>
				<div class="media-body">
					<h4 class="media-heading">MOBILE ACCESS</h4>
					
					<hr style="margin:8px auto">

					<span>Read Google Mail on mobile phone by your phone web browser.</span>
					
				</div>
			
			
			</div>
		</div>
		
		  <div class="col-md-offset-2">
        <div class="media">
            <a class="pull-left" href="#">
                <img class="media-object dp img-circle" src="http://iconizer.net/files/Wireframe_mono_icons/orig/box.png" style="width: 100px;height:100px;">
            </a>
            <div class="media-body">
                <h4 class="media-heading">LOTS OF SPACE </h4>
                
                <hr style="margin:8px auto">

                <span>Over 2757.272164 megabytes of free storage so no need to delete.</span>
               
            </div>
        </div>
    </div>
		</div>
  
<div class="row">

<div class="col-md-6">
			<div class="media">
				<a class="pull-left" href="#">
					<img class="media-object dp img-circle" src="http://faantinc.com.au/images/location_icon.gif" style="width: 100px;height:100px;">
				</a>
				<div class="media-body">
					<h4 class="media-heading">LOCATION</h4>
					
					<hr style="margin:8px auto">

					<span>Hotels, restaurants, places, stores, servies..</span>
					
				</div>
			
			
			</div>
		</div>
		
		  <div class="col-md-offset-2">
        <div class="media">
            <a class="pull-left" href="#">
                <img class="media-object dp img-circle" src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSkCJcBD0QXGcKX4-BquC_wyr7AEfPCqC2Lqjog6OaQnLUpG2r6pg" style="width: 100px;height:100px;">
            </a>
            <div class="media-body">
                <h4 class="media-heading">ART & ENTERTAINMENT</h4>
               
                <hr style="margin:8px auto">

                <span>Movies, TV, Music, Books, Sports, Shows...</span>
                
            </div>
        </div>
    </div>
		</div>
    

</div>
	</div>
	</section>


	
	
	
	
	
	
	<section class="no-padding" id="portfolio">
	<div class="container-fluid">
		<div class="row no-gutter">
			<div class="col-lg-4 col-sm-6">
				<a href="#" class="portfolio-box"> <img
					src="https://unsplash.it/650/350?image=535" class="img-responsive"
					alt="">
					<div class="portfolio-box-caption">
						<div class="portfolio-box-caption-content">
							<div class="project-category text-faded">Category</div>
							<div class="project-name">Gmail</div>
						</div>
					</div>
				</a>
			</div>
			<div class="col-lg-4 col-sm-6">
				<a href="#" class="portfolio-box"> <img
					src="https://unsplash.it/650/350?image=534" class="img-responsive"
					alt="">
					<div class="portfolio-box-caption">
						<div class="portfolio-box-caption-content">
							<div class="project-category text-faded">Category</div>
							<div class="project-name">Yahoo</div>
						</div>
					</div>
				</a>
			</div>
			<div class="col-lg-4 col-sm-6">
				<a href="#" class="portfolio-box"> <img
					src="https://unsplash.it/650/350?image=532" class="img-responsive"
					alt="">
					<div class="portfolio-box-caption">
						<div class="portfolio-box-caption-content">
							<div class="project-category text-faded">Category</div>
							<div class="project-name">Technology</div>
						</div>
					</div>
				</a>
			</div>
			<div class="col-lg-4 col-sm-6">
				<a href="#" class="portfolio-box"> <img
					src="https://unsplash.it/650/350?image=533" class="img-responsive"
					alt="">
					<div class="portfolio-box-caption">
						<div class="portfolio-box-caption-content">
							<div class="project-category text-faded">Category</div>
							<div class="project-name">Networks</div>
						</div>
					</div>
				</a>
			</div>
			<div class="col-lg-4 col-sm-6">
				<a href="#" class="portfolio-box"> <img
					src="https://unsplash.it/650/350?image=531" class="img-responsive"
					alt="">
					<div class="portfolio-box-caption">
						<div class="portfolio-box-caption-content">
							<div class="project-category text-faded">Category</div>
							<div class="project-name">Ease of Access</div>
						</div>
					</div>
				</a>
			</div>
			<div class="col-lg-4 col-sm-6">
				<a href="#" class="portfolio-box"> <img
					src="https://unsplash.it/650/350?image=625" class="img-responsive"
					alt="">
					<div class="portfolio-box-caption">
						<div class="portfolio-box-caption-content">
							<div class="project-category text-faded">Category</div>
							<div class="project-name">Collaboration</div>
						</div>
					</div>
				</a>
			</div>
		</div>
	</div>
	</section>
	
	
	<section id="contact">
	<div class="container">
		<div class="row">
			<div class="col-lg-8 col-lg-offset-2 text-center">
				<h2 class="section-heading">Let's Get In Touch!</h2>
				<hr class="primary">
				<p>You can contact us anytime for careers and add ons!</p>
			</div>
			<div class="col-lg-4 col-lg-offset-2 text-center">
				<i class="fa fa-phone fa-3x wow bounceIn"></i>
				<p>+(321)234-567</p>
			</div>
			<div class="col-lg-4 text-center">
				<i class="fa fa-envelope-o fa-3x wow bounceIn" data-wow-delay=".1s"></i>
				<p>
					<a href="mailto:your-email@your-domain.com">dalalkarishma@yahoo.co.in</a>
				</p>
			</div>
		</div>
	</div>
	</section>



	

	<!-- jQuery -->
	<script src="resources/js/jquery.js"></script>

	<!-- Bootstrap Core JavaScript -->
	<script src="resources/js/bootstrap.min.js"></script>

	<!-- Plugin JavaScript-->
	<script src="js/jquery.easing.min.js"></script>
	<script src="js/jquery.fittext.js"></script>
	<script src="js/wow.min.js"></script>
	-->

	<!-- Custom Theme JavaScript-->
	<script src="js/creative.js"></script>

</body>

</html>
