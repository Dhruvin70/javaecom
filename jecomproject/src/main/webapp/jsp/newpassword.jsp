<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html lang="en">
<head>
<title>New Password</title>
<meta charset="ISO-8859-1">
<!-- Meta -->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="shortcut icon" href="favicon.ico">

<!-- FontAwesome JS-->
<script defer src="../assets/plugins/fontawesome/js/all.min.js"></script>

<!-- App CSS -->
<link id="theme-style" rel="stylesheet" href="../assets/css/portal.css">

</head>

<body class="app app-reset-password p-0">
	<div class="row g-0 app-auth-wrapper">
		<div class="col-12 col-md-7 col-lg-6 auth-main-col text-center p-5">
			<div class="d-flex flex-column align-content-end">
				<div class="app-auth-body mx-auto">
					<div class="app-auth-branding mb-4">
						<a class="app-logo" href="index.html"><img
							class="logo-icon me-2" src="../assets/images/app-logo.svg"
							alt="logo"></a>
					</div>
					<h2 class="auth-heading text-center mb-4">Password Reset</h2>

					<div class="auth-intro mb-4 text-center">


						<%
						String message = (String) session.getAttribute("newpassmessage");
				

						if (message != null) {
						%>
						<p class="form-outline ms-2" style="color: red;"><%=message%></p>

						<%
						} else
						%>
						<p class="form-outline ms-2"></p>
						<%
						session.removeAttribute("newpassmessage");
					
						%>



					</div>

					<div class="auth-form-container text-left">

						<form class="auth-form resetpass-form" action="../reset-newpassword"
							method="post">
							<div class="new-password mb-3">
								<label class="sr-only" for="new-password">New Password</label> <input
									id="new-password" name="new-password" type="text"
									class="form-control " placeholder="New Password"
									required="required">
							</div>
							<div class="confirm-new mb-3">
								<label class="sr-only" for="confirm-new">Re-enter New
									Password</label> <input id="confirm-new" name="confirm-new" type="text"
									class="form-control " placeholder="Confirm Password"
									required="required">
							</div>

							<!--//form-group-->
							<div class="text-center">
								<button type="submit"
									class="btn app-btn-primary btn-block theme-btn mx-auto">Reset
									Password</button>
							</div>
						</form>

						<div class="auth-option text-center pt-5">
							<a class="app-link" href="login.jsp">Log in</a> <span
								class="px-2">|</span> <a class="app-link" href="../register.jsp">Sign
								up</a>
						</div>
					</div>
					<!--//auth-form-container-->


				</div>
				<!--//auth-body-->

			</div>
			<!--//flex-column-->
		</div>
		<!--//auth-main-col-->
		<div class="col-12 col-md-5 col-lg-6 h-100 auth-background-col">
			<div class="auth-background-holder"></div>
			<div class="auth-background-mask"></div>
			<div class="auth-background-overlay p-3 p-lg-5">
				<div class="d-flex flex-column align-content-end h-100">
					<div class="h-100"></div>

				</div>
			</div>
			<!--//auth-background-overlay-->
		</div>
		<!--//auth-background-col-->

	</div>
	<!--//row-->


</body>
</html>

>
