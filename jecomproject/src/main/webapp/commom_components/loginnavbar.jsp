<%@ page import="com.entity.User"%>

<div class="container-fluid">

	<div class="row">
		<div class="col-md-10 col-sm-6 col-6 d-flex align-items-center">
			<h3 class="ms-3 m-2">Company</h3>
		</div>
		</nav>

		<%
		if (session.getAttribute("loggedInUser") != null) {
			User loggedInUser = (User) session.getAttribute("loggedInUser");
		%>
		<div
			class="col-md-2 col-sm-6 col-6 p-3 d-flex align-items-center justify-content-end">
			<p class="mb-1 pt-2 fs-4">Welcome,</p>
			<a href="account.jsp"
				class="text-decoration-none text-dark fs-3 mx-2 "><%=loggedInUser.getFirst()%></a>
			<!-- Add any other information you want to display for the logged-in user -->
			<a href="register.jsp" class="btn btn-danger m-2"
				data-bs-toggle="modal" data-bs-target="#exampleModal" type="button">Logout</a>
		</div>
		<%
		} else if (session.getAttribute("userObj") != null) {
		User loggedInAdmin = (User) session.getAttribute("userObj");
		%>
		<div
			class="col-md-2 col-sm-6 col-6 p-3 d-flex align-items-center justify-content-end">
			<p class="mb-1 pt-2 fs-4">Welcome,</p>
			<a href="account.jsp"
				class="text-decoration-none text-dark fs-3 mx-2 "><%=loggedInAdmin.getFirst()%></a>
			<!-- Add any other information you want to display for the logged-in user -->
			<a href="register.jsp" class="btn btn-danger m-2"
				data-bs-toggle="modal" data-bs-target="#exampleModal" type="button">Logout</a>
		</div>
		<%
		} else {
		%>
		<div
			class="col-md-2 col-sm-6 col-6 p-3 d-flex align-items-center justify-content-end">
			<a href="login.jsp" class="btn btn-outline-primary m-2"
				style="width: 80px">Login</a> <a href="register.jsp"
				class="btn btn-outline-success m-2" type="button">Register</a>
		</div>
		<%
		}
		%>

	</div>

</div>



<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1"
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<p class="modal-title">Logout</p>
			<div class="modal-body ">
				<div class="align-items-center text-center ">
					<p class="mt-1 fs-2">Are you sure?</p>
					<hr>
					<a type="button" class="btn btn-primary" data-bs-dismiss="modal">Close</a>
					<a href="logout" ="button" class="btn btn-danger">Logout</a>
				</div>
			</div>
		</div>
	</div>
</div>



<div class="modal" tabindex="-1">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">Modal title</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal"
					aria-label="Close"></button>
			</div>
			<div class="modal-body">
				<p>Modal body text goes here.</p>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary"
					data-bs-dismiss="modal">Close</button>
				<button type="button" class="btn btn-primary">Save changes</button>
			</div>
		</div>
	</div>
</div>
