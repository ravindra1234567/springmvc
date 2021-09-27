<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@page isELIgnored="false" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%-- <%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%> --%>
  
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit</title>
<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
	integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
	crossorigin="anonymous">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" integrity="sha512-PgQMlq+nqFLV4ylk1gwUOgm6CtIIXkKwaIHp/PAIWHzig/lKZSEGKEysh0TCVbHJXCLN7WetD8TFecIky75ZfQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
	 
	 <!-- include custom css  -->
	 <link href="<c:url value="/resources/css/style.css" />">
	 
	 <!-- include custom js -->
	 <script src="<c:url value="/resources/js/validation.js" />" ></script>

	<style>
		#info-block section {
		    border: 2px solid black;
		}
		.file-marker > div {
		    margin-top: -0.8em;
		}
		.box-title {
		    background: white none repeat scroll 0 0;
		    display: inline-block;
		    padding: 0 2px;
		    margin-left: 3em;
		}
		</style>
</head>
<body>
	<% response.setHeader("Cache-Control", "no-cache, no-store"); %>
	<div class="container">
			<!-- include header here  -->
			<%@include file="header.jsp" %>
			<aside id="info-block" >
 				 <section class="file-marker mt-4">
 				 <div>
 				 <div class="box-title">
    			    Employee Edit
      			</div>
		<form action="afteredit" method="POST" class="p-1">
		
			<input type="hidden" name="id" value="${e.id}">
			<div class="form-group">
				<label for="empcode">Employee Code</label> <input type="number"
					class="form-control" id="empcode" aria-describedby="empHelp"
					placeholder="Enter employee code" value="${e.employeeCode}"
					name="employeeCode" required />
			</div>
			<div class="form-group">
				<label for="name">Employee Name</label> <input type="text"
					class="form-control" id="name" aria-describedby="empnameHelp"
					placeholder="Enter employee name" onkeyup="checkNameFormat();" value="${e.employeeName}"
					name="employeeName">
					<span class="help-block errorMessage">
                          <div id="errname"></div>
                    </span>
			</div>

			<div class="form-group">
				<label for="email">Email address</label> <input
					type="email" class="form-control" id="email"
					aria-describedby="emailHelp" onkeyup="checkEmailFormat();" placeholder="Enter email"
					value="${e.email}" name="email" />
					<span class="help-block errorMessage">
                          <div id="erremail"></div>
                    </span>
			</div>
			<div class="form-group">
				<label for="empdob">Date of Birth</label> <input type="text"
					class="form-control" id="empdob" placeholder="" name="dob"
					value="${e.dob}" required />
			</div>
			<div class="form-group">
				<label for="location">Location</label>
				<textarea  class="form-control" id="location"
					aria-describedby="emplocationlHelp" placeholder="Enter location"
					onkeyup="checkLocationFormat();" name="location">${e.location}</textarea>
				<span class="help-block errorMessage">
                          <div id="errlocation"></div>
                    </span>
				 
			</div>
			<div class="text-center">
				<button type="submit" class="btn btn-primary text-center">Update</button>
				<a href="allemployee" type="cancel" class="btn btn-primary" data-dismiss="modal">Cancel</a>
			</div>
		</form>
		</div>
				  </section>
			</aside>
		<!-- include footer here  -->
			<%@include file="footer.jsp" %>
	</div>
</body>
</html>