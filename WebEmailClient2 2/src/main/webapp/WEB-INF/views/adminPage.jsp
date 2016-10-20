<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix = "form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>


<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">

<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap-theme.min.css">

<!-- Latest compiled and minified JavaScript -->
<script src="resources/js/jquery.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
<script src="//ajax.googleapis.com/ajax/libs/jqueryui/1.10.4/jquery-ui.min.js"></script>

<style>
.table-sortable tbody tr {
    cursor: move;
}

</style>
<script>
function func(id){
$.ajax(
		{
			
			url : 'suspendUser',
			data:{'id':id},
			type:'GET'
				}
);	
}

</script>
</head>
<body>

<nav class="navbar navbar-inverse">
		<div class="container-fluid">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#bs-example-navbar-collapse-2">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="#">${sessionScope.user.firstName}</a>
			</div>

			<div class="collapse navbar-collapse"
				id="bs-example-navbar-collapse-2">

				<form class="navbar-form navbar-left" role="search" method="get"
					onsubmit="return false;">
					<div class="form-group">
						<input id="searchWord" type="text" class="form-control"
							placeholder="Search">
					</div>
					<button type="submit" class="btn btn-default" onclick=search();>Search</button>
				</form>

				<ul class="nav navbar-nav navbar-right">
					
					<li><a href="logout">LOGOUT</a></li>
				</ul>
			</div>
		</div>
	</nav>
	
	<div class="jumbotron">
	<h1>Admin Dashboard</h1>
	</div>
	
	

<div class="container">
    <div class="row clearfix">
    	<div class="col-md-12 table-responsive">
			<table class="table table-bordered table-hover table-sortable" id="tab_logic">
				<thead>
					<tr >
						<th class="text-center">
							User Name
						</th>
						<th class="text-center">
							Email Id
						</th>
						<th class="text-center">
							Action
						</th>
    					
        				
					</tr>
				</thead>
				
				
				<tbody>
				<c:forEach items="${users}" var="user" varStatus="count">
    				<tr id='addr0'>
						<td>${user.firstName}</td>
						<td>${user.emailAccounts[0].emailAccount}</td>
						<td><button onclick="func(${user.userID});">suspend</button></td>
    					
					</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
	
</div>
	





</body>
</html>