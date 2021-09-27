<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page isELIgnored="false" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ page session="true" %>
    
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>  
<!doctype html>
<html lang="en">
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
	integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
	crossorigin="anonymous">
<link rel="shortcut icon" href="https://www.nagarro.com/hubfs/favicon-1.ico">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" integrity="sha512-PgQMlq+nqFLV4ylk1gwUOgm6CtIIXkKwaIHp/PAIWHzig/lKZSEGKEysh0TCVbHJXCLN7WetD8TFecIky75ZfQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />

 <!-- include custom js -->
	 <script src="<c:url value="/resources/js/validation.js" />" ></script>
	 
<title>Employee Details</title>
<style>
/* Error message  */
.errorMessage{
    font-family:Times New Roman;
    font-size:small;
}

/* Error message color */
.help-block{
    color:#F00;
} 

	/* table scrollbar */
		.my-custom-scrollbar {
			position: relative;
			height: 300px;
			overflow: auto;
		}
		
		/* remove y-axis scrollbar  */
		.table-wrapper-scroll-y {
			display: block;
			}

	fieldset {
    border: 1px solid #000;
}
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
    			    Employee Listings
      			</div>
			<div class="row" >
				<div class="col-sm-4 ">
						<%
							String status = status = (String) request.getAttribute("success");
							if (status.equalsIgnoreCase("added")) {
							%>

							<div class="alert alert-success alert-dismissible fade show"
								role="alert">
								Successfully Added !!
								<button type="button" class="close" data-dismiss="alert"
									aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
							</div>
							<%
							} if (status.equalsIgnoreCase("edited")) {
							%>

							<div class="alert alert-primary alert-dismissible fade show"
								role="alert">
								Successfully Edited !!
								<button type="button" class="close" data-dismiss="alert"
									aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
							</div>
							<%
							}if (status.equalsIgnoreCase("deleted")) {
							%>

							<div class="alert alert-danger alert-dismissible fade show"
								role="alert">
								Successfully Deleted !!
								<button type="button" class="close" data-dismiss="alert"
									aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
							</div>
							<%
							}
							%>



					</div>
					<div class="col-sm-8 text-right">
					<button type="button" class="btn btn " data-toggle="modal" data-target="#myModal">Upload Employee Details</button>
					<button type="button" class="btn btn" download="HTML 5 PDF" onclick="window.open('http://localhost:8081/employees/pdf' + location.search)">Download Employee Details</button>
				</div>
			</div>
			<div class="row mt-2 p-4  my-custom-scrollbar ">
				<table class="table table-hover table-striped table-bordered ">
					<thead>
						<tr>
							<th scope="col">Employee Code</th>
							<th scope="col">Employee Name</th>
							<th scope="col">Email</th>
							<th scope="col">Location</th>
							<th scope="col">Date of Birth</th>
							<th scope="col">Action</th>
						</tr>
					</thead>
					<tbody>
					
					
					<c:forEach var="e" items="${list}">
						<tr>
							
							<%-- <td>${e.id}</td> --%>
							<td>${e.employeeCode}</td>
							<td>${e.employeeName}</td>
							<td>${e.email}</td>
							<td>${e.location}</td>
							
							<c:set var="date" scope="request" value="${e.dob}"/>
							<%  String  fdate = (String)request.getAttribute("date");
							String s1 = fdate.substring(0, 4);
							String s2 = fdate.substring(4, 5);
							String s3 = fdate.substring(5, 7);
							String s4 = fdate.substring(7, 8);
							String s5 = fdate.substring(8);
							String ss = (s5 + s4 + s3 + s2 + s1);
							%>
							<td><%= ss %></td>
							<td>
								<button type="button" class="btn btn " ><a href="editemployee?id=${e.id}" style="font-size:30px;"><i class="fa fa-edit" aria-hidden="true"></i></a></button>
								<button type="button" class="btn btn " ><a href="deleteemployee?id=${e.id}" style="color:red;font-size:30px;"><i class="fa fa-trash" aria-hidden="true"></i></a></button>
							</td>
						</tr>
						</c:forEach>
					</tbody>
				</table>
			</div> 
			</div>
				  </section>
			</aside>
			<!-- include footer here  -->
			<%@include file="footer.jsp" %>
		</div>

		<!-- Modal for add user-->
		<div class="modal fade" id="myModal" role="dialog">
			<div class="modal-dialog">

				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
						<h4 class="modal-title">Add Employee</h4>
						<button type="button" class="close" data-dismiss="modal">&times;</button> 
						
					</div>
					<div class="modal-body">
						<form action="addemployee" method="POST" class="border p-3">
							<div class="form-group">
								<label for="empcode">Employee Code</label> <input
									type="number" class="form-control" id="empcode"
									aria-describedby="empHelp" placeholder="Enter employee code"
									name="employeeCode" required />
							</div>
							<div class="form-group">
								<label for="name">Employee Name</label>
								 <input
									type="text" class="form-control" id="name"
									aria-describedby="empnameHelp" onkeyup="checkNameFormat();" placeholder="Enter employee name"
									name="employeeName">
									<span class="help-block errorMessage">
                                		<div id="errname"></div>
                            		</span>
							</div>
							
							<div class="form-group">
								<label for="email">Email address</label> 
								 <input type="email" name="email" class="form-control" id="email" placeholder="Email Address"
                                required onkeyup="checkEmailFormat();" />
                            <span class="help-block errorMessage">
                                <div id="erremail"></div>
                            </span>
							</div>
							<div class="form-group">
								<label for="empdob">Date of Birth</label> <input
									type="date" class="form-control" id="empdob"
									placeholder="" name="dob" required />
							</div>
							<div class="form-group">
								<label for="location">Location</label> 
								<textarea class="form-control" id="location"
									aria-describedby="emplocationlHelp" placeholder="Enter location"
									name="location" onkeyup="checkLocationFormat();" ></textarea>
									<span class="help-block errorMessage">
                                		<div id="errlocation"></div>
                           			 </span>
							</div>
							<div class="text-center">
								<button type="submit" class="btn btn-primary text-center">Add</button>
							</div>
						</form>
					</div>
					<!-- <div class="modal-footer">
						<button type="submit" class="btn btn-default" data-dismiss="modal">Save</button>
					</div> -->
				</div>

			</div>
		</div>
		


	<!-- Optional JavaScript -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
		integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"
		integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
		crossorigin="anonymous"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"
		integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy"
		crossorigin="anonymous"></script>
		
		<script>
		
			var myModal = document.getElementById('myModal')
			var myInput = document.getElementById('myInput')

			myModal.addEventListener('shown.bs.modal', function() {
				myInput.focus()
			})
		</script>
</body>
</html>