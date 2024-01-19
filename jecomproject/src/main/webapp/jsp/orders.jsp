<%@page import="com.entity.Order"%>
<%@page import="com.DAL.OrderImplements"%>
<%@page import="com.entity.Items"%>
<%@page import="java.util.List"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAL.ItemsImplement"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="com.entity.User"%>



<!DOCTYPE html>
<html lang="en">
<head>
<title>All Products</title>
<script
	src="
https://cdn.jsdelivr.net/npm/sweetalert2@11.10.1/dist/sweetalert2.all.min.js
"></script>
<link
	href="
https://cdn.jsdelivr.net/npm/sweetalert2@11.10.1/dist/sweetalert2.min.css
"
	rel="stylesheet">
<!-- Meta -->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<meta name="description"
	content="Portal - Bootstrap 5 Admin Dashboard Template For Developers">
<meta name="author" content="Xiaoying Riley at 3rd Wave Media">
<link rel="shortcut icon" href="favicon.ico">

<!-- FontAwesome JS-->
<script defer src="../assets/plugins/fontawesome/js/all.min.js"></script>
<script defer src="../js/orders.js"></script>

<!-- App CSS -->
<link id="theme-style" rel="stylesheet" href="../assets/css/portal.css">

<!-- Dialogbox JS-->


</head>
<%
User loggedInUser = (User) session.getAttribute("loggedInUser");
if (session.getAttribute("loggedInUser") == null) {
	response.sendRedirect("login.jsp");
	return;

}
%>

<body class="app">
	<header class="app-header fixed-top">
		<div class="app-header-inner">
			<div class="container-fluid py-2">
				<div class="app-header-content">
					<div class="row justify-content-between align-items-center">

						<div class="col-auto">
							<a id="sidepanel-toggler"
								class="sidepanel-toggler d-inline-block d-xl-none" href="#">
								<svg xmlns="http://www.w3.org/2000/svg" width="30" height="30"
									viewBox="0 0 30 30" role="img">
									<title>Menu</title><path stroke="currentColor"
										stroke-linecap="round" stroke-miterlimit="10" stroke-width="2"
										d="M4 7h22M4 15h22M4 23h22"></path></svg>
							</a>
						</div>
						<!--//col-->
						<div class="search-mobile-trigger d-sm-none col">
							<i
								class="search-mobile-trigger-icon fa-solid fa-magnifying-glass"></i>
						</div>
						<!--//col-->
						<div class="app-search-box col">
							<form class="app-search-form">
								<input type="text" placeholder="Search..." name="search"
									class="form-control search-input">
								<button type="submit" class="btn search-btn btn-primary"
									value="Search">
									<i class="fa-solid fa-magnifying-glass"></i>
								</button>
							</form>
						</div>
						<!--//app-search-box-->

						<div class="app-utilities col-auto">
							<div class="app-utility-item app-user-dropdown dropdown">
								<a class="dropdown-toggle" id="user-dropdown-toggle"
									data-bs-toggle="dropdown" href="#" role="button"
									aria-expanded="false"><img src="../assets/images/user.png"
									alt="user profile"></a>
								<ul class="dropdown-menu" aria-labelledby="user-dropdown-toggle">
									<li><a class="dropdown-item" href="javascript:void(0);" onclick="redirectToAccount('../jsp/account.jsp')">Account</a></li>

									<li><hr class="dropdown-divider"></li>
									<li><a class="dropdown-item" data-bs-toggle="modal"
										data-bs-target="#exampleModal" href="register.jsp">Log Out</a></li>
								</ul>
							</div>
							<!--//app-user-dropdown-->
						</div>
						<!--//app-utilities-->
					</div>
					<!--//row-->
				</div>
				<!--//app-header-content-->
			</div>
			<!--//container-fluid-->
		</div>
		<!--//app-header-inner-->
		<div id="app-sidepanel" class="app-sidepanel sidepanel-hidden">
			<div id="sidepanel-drop" class="sidepanel-drop"></div>
			<div class="sidepanel-inner d-flex flex-column">
				<a href="#" id="sidepanel-close" class="sidepanel-close d-xl-none">&times;</a>
				<div class="app-branding">
					<a class="app-logo" onclick="redirectToAccount('../index.jsp')" href="javascript:void(0);"><img
						class="logo-icon me-2" src="../assets/images/app-logo.svg"
						alt="logo"><span class="logo-text">PORTAL</span></a>

				</div>
				<!--//app-branding-->
				<nav id="app-nav-main" class="app-nav app-nav-main flex-grow-1">
					<ul class="app-menu list-unstyled accordion" id="menu-accordion">

						<li class="nav-item">
							<!--//Bootstrap Icons: https://icons.getbootstrap.com/ --> <a
							class="nav-link" href="javascript:void(0);" onclick="redirectToAccount('../jsp/orders.jsp')"> <span class="nav-icon">
									<svg width="1em" height="1em" viewBox="0 0 16 16"
										class="bi bi-folder" fill="currentColor"
										xmlns="http://www.w3.org/2000/svg">
  <path
											d="M9.828 4a3 3 0 0 1-2.12-.879l-.83-.828A1 1 0 0 0 6.173 2H2.5a1 1 0 0 0-1 .981L1.546 4h-1L.5 3a2 2 0 0 1 2-2h3.672a2 2 0 0 1 1.414.586l.828.828A2 2 0 0 0 9.828 3v1z" />
  <path fill-rule="evenodd"
											d="M13.81 4H2.19a1 1 0 0 0-.996 1.09l.637 7a1 1 0 0 0 .995.91h10.348a1 1 0 0 0 .995-.91l.637-7A1 1 0 0 0 13.81 4zM2.19 3A2 2 0 0 0 .198 5.181l.637 7A2 2 0 0 0 2.826 14h10.348a2 2 0 0 0 1.991-1.819l.637-7A2 2 0 0 0 13.81 3H2.19z" />
</svg>
							</span> <span class="nav-link-text">Orders</span>
						</a> <!--//nav-link-->
						</li>
						<!--//nav-item-->

						<!--//nav-item-->

						<li class="nav-item has-submenu">
							<!--//Bootstrap Icons: https://icons.getbootstrap.com/ --> <a
							class="nav-link submenu-toggle" href="#"
							data-bs-toggle="collapse" data-bs-target="#submenu-1"
							aria-expanded="false" aria-controls="submenu-1"> <span
								class="nav-icon"> <!--//Bootstrap Icons: https://icons.getbootstrap.com/ -->
									<svg width="1em" height="1em" viewBox="0 0 16 16"
										class="bi bi-files" fill="currentColor"
										xmlns="http://www.w3.org/2000/svg">
	  <path fill-rule="evenodd"
											d="M4 2h7a2 2 0 0 1 2 2v10a2 2 0 0 1-2 2H4a2 2 0 0 1-2-2V4a2 2 0 0 1 2-2zm0 1a1 1 0 0 0-1 1v10a1 1 0 0 0 1 1h7a1 1 0 0 0 1-1V4a1 1 0 0 0-1-1H4z" />
	  <path
											d="M6 0h7a2 2 0 0 1 2 2v10a2 2 0 0 1-2 2v-1a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1H6a1 1 0 0 0-1 1H4a2 2 0 0 1 2-2z" />
	</svg>
							</span> <span class="nav-link-text">Operations</span> <span
								class="submenu-arrow"> <svg width="1em" height="1em"
										viewBox="0 0 16 16" class="bi bi-chevron-down"
										fill="currentColor" xmlns="http://www.w3.org/2000/svg">
	  <path fill-rule="evenodd"
											d="M1.646 4.646a.5.5 0 0 1 .708 0L8 10.293l5.646-5.647a.5.5 0 0 1 .708.708l-6 6a.5.5 0 0 1-.708 0l-6-6a.5.5 0 0 1 0-.708z" />
	</svg>
							</span> <!--//submenu-arrow-->
						</a> <!--//nav-link-->
							<div id="submenu-1" class="collapse submenu submenu-1"
								data-bs-parent="#menu-accordion">
								<ul class="submenu-list list-unstyled">

									<li class="submenu-item"><a class="submenu-link"
										href="#">Sell Item</a></li>

									<li class="submenu-item"><a class="submenu-link"
										href="#">Items To Be Sell On Portal</a></li>



								</ul>
							</div>
						</li>
						<li class="nav-item">
							<!--//Bootstrap Icons: https://icons.getbootstrap.com/ --> <a
							class="nav-link" href="javascript:void(0);" onclick="redirectToAccount('../jsp/help.jsp')"> <span class="nav-icon">
									<svg width="1em" height="1em" viewBox="0 0 16 16"
										class="bi bi-question-circle" fill="currentColor"
										xmlns="http://www.w3.org/2000/svg">
  <path fill-rule="evenodd"
											d="M8 15A7 7 0 1 0 8 1a7 7 0 0 0 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z" />
  <path
											d="M5.255 5.786a.237.237 0 0 0 .241.247h.825c.138 0 .248-.113.266-.25.09-.656.54-1.134 1.342-1.134.686 0 1.314.343 1.314 1.168 0 .635-.374.927-.965 1.371-.673.489-1.206 1.06-1.168 1.987l.003.217a.25.25 0 0 0 .25.246h.811a.25.25 0 0 0 .25-.25v-.105c0-.718.273-.927 1.01-1.486.609-.463 1.244-.977 1.244-2.056 0-1.511-1.276-2.241-2.673-2.241-1.267 0-2.655.59-2.75 2.286zm1.557 5.763c0 .533.425.927 1.01.927.609 0 1.028-.394 1.028-.927 0-.552-.42-.94-1.029-.94-.584 0-1.009.388-1.009.94z" />
</svg>
							</span> <span class="nav-link-text">Help</span>
						</a> <!--//nav-link-->
						</li>
						<!--//nav-item-->
					</ul>
					<!--//app-menu-->
				</nav>
				<!--//app-nav-->

			</div>
			<!--//sidepanel-inner-->
		</div>
		<!--//app-sidepanel-->
	</header>
	<!--//app-header-->

	<div class="app-wrapper">

		<div class="app-content pt-3 p-md-3 p-lg-4">
			<div class="container-xl">

				<div class="row g-3 mb-4 align-items-center justify-content-between">
					<div class="col-auto">
						<h1 class="app-page-title mb-0">Orders</h1>
					</div>
					<div class="col-auto">
						<div class="page-utilities">
							<div
								class="row g-2 justify-content-start justify-content-md-end align-items-center">
								<div class="col-auto">
									<form class="table-search-form row gx-1 align-items-center">
										<div class="col-auto">
											<input type="text" id="search-orders" name="searchorders"
												class="form-control search-orders" placeholder="Search">
										</div>
										<div class="col-auto">
											<button type="submit" class="btn app-btn-secondary">Search</button>
										</div>
									</form>

								</div>
								<!--//col-->
								<div class="col-auto">

									<select class="form-select w-auto">
										<option selected value="option-1">All</option>
										<option value="option-2">This week</option>
										<option value="option-3">This month</option>
										<option value="option-4">Last 3 months</option>

									</select>
								</div>
								<div class="col-auto">
									<a class="btn app-btn-secondary" href="#"> <svg width="1em"
											height="1em" viewBox="0 0 16 16" class="bi bi-download me-1"
											fill="currentColor" xmlns="http://www.w3.org/2000/svg">
		  <path fill-rule="evenodd"
												d="M.5 9.9a.5.5 0 0 1 .5.5v2.5a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1v-2.5a.5.5 0 0 1 1 0v2.5a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2v-2.5a.5.5 0 0 1 .5-.5z" />
		  <path fill-rule="evenodd"
												d="M7.646 11.854a.5.5 0 0 0 .708 0l3-3a.5.5 0 0 0-.708-.708L8.5 10.293V1.5a.5.5 0 0 0-1 0v8.793L5.354 8.146a.5.5 0 1 0-.708.708l3 3z" />
		</svg> Download CSV
									</a>
								</div>
							</div>
							<!--//row-->
						</div>
						<!--//table-utilities-->
					</div>
					<!--//col-auto-->
				</div>
				<!--//row-->


				<nav id="orders-table-tab"
					class="orders-table-tab app-nav-tabs nav shadow-sm flex-column flex-sm-row mb-4">
					<a class="flex-sm-fill text-sm-center nav-link active"
						id="orders-all-tab" data-bs-toggle="tab" href="#orders-all"
						role="tab" aria-controls="orders-all" aria-selected="">All
						Orders</a> <a class="flex-sm-fill text-sm-center nav-link"
						id="order-paid-tab" data-bs-toggle="tab" href="#order-paid"
						role="tab" aria-controls="order-paid" aria-selected="false">Paid</a>
					<a class="flex-sm-fill text-sm-center nav-link"
						id="orders-cancelled-tab" data-bs-toggle="tab"
						href="#orders-cancelled" role="tab"
						aria-controls="orders-cancelled" aria-selected="false">Cancelled</a>

				</nav>


				<div class="tab-content" id="orders-table-tab-content">
					<div class="tab-pane fade show active" id="orders-all"
						role="tabpanel" aria-labelledby="orders-all-tab">
						<div class="app-card app-card-orders-table shadow-sm mb-5">
							<div class="app-card-body">
								<div class="table-responsive">
									<table class="table app-table-hover mb-0 text-left">
										<thead>
											<tr>
												<th class="cell">Order</th>
												<th class="cell">Email</th>
												<th class="cell">Phone</th>
												<th class="cell">Customer</th>
												<th class="cell">Date</th>
												<th class="cell">Address</th>
												<th class="cell">Total</th>
												<th class="cell"></th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<%
												System.out.println("_____________________________--------------------------------------------------");
												OrderImplements dao = new OrderImplements(DBConnect.getConn());
												List<Order> orders = dao.getAllOrders(loggedInUser.getId());
												System.out.println("_____________________________--------------------"+orders+"------------------------------");
												for (Order order : orders) {
												
												
												
												%>
											
											<tr>
												<td class="cell"><%=order.getOrder_id()%></td>
												<td class="cell"><span class="truncate"> <%=order.getEmail()%>
												</span></td>
												<td class="cell"><%=order.getPhone()%></td>
												<td class="cell"><%=order.getFirst() + " " + order.getLast()%></td>
												<td class="cell"><span><%=order.getDate()%></span></td>
												<td class="cell"><%=order.getAddress()%></td>
												<td class="cell"><%=order.getTotal()%></td>
												<td class="cell"><a class="btn-sm app-btn-secondary"
													href="#">Invoice</a></td>
											</tr>
											<%
											}
											%>
											</tr>
										</tbody>
									</table>
								</div>
								<!--//table-responsive-->

							</div>
							<!--//app-card-body-->
						</div>
						<!--//app-card-->
						<nav class="app-pagination">
							<ul class="pagination justify-content-center">
								<li class="page-item disabled"><a class="page-link"
									href="#" tabindex="-1" aria-disabled="true">Previous</a></li>
								<li class="page-item active"><a class="page-link" href="#">1</a></li>
								<li class="page-item"><a class="page-link" href="#">2</a></li>
								<li class="page-item"><a class="page-link" href="#">3</a></li>
								<li class="page-item"><a class="page-link" href="#">Next</a>
								</li>
							</ul>
						</nav>
						<!--//app-pagination-->

					</div>

					<div class="tab-pane fade" id="order-paid" role="tabpanel"
						aria-labelledby="order-paid-tab">
						<div class="app-card app-card-orders-table mb-5">
							<div class="app-card-body">
								<div class="table-responsive">
									<table class="table mb-0 text-left">
										
									</table>
								</div>
								<!--//table-responsive-->
							</div>
							<!--//app-card-body-->
						</div>
						<!--//app-card-->
					</div>
					<!--//tab-pane-->
					<div class="tab-pane fade" id="orders-cancelled" role="tabpanel"
						aria-labelledby="orders-cancelled-tab">
						<div class="app-card app-card-orders-table mb-5">
							<div class="app-card-body">
								<div class="table-responsive">
									<table class="table mb-0 text-left">
										<thead>
											<tr>
												<th class="cell">Order</th>
												<th class="cell">Product</th>
												<th class="cell">Customer</th>
												<th class="cell">Date</th>
												<th class="cell">Status</th>
												<th class="cell">Total</th>
												<th class="cell"></th>
											</tr>
										</thead>
										<tbody>

											<tr>
												<td class="cell">#15342</td>
												<td class="cell"><span class="truncate">Justo
														feugiat neque</span></td>
												<td class="cell">Reina Brooks</td>
												<td class="cell"><span class="cell-data">12 Oct</span><span
													class="note">04:23 PM</span></td>
												<td class="cell"><span class="badge bg-danger">Cancelled</span></td>
												<td class="cell">$59.00</td>
												<td class="cell"><a class="btn-sm app-btn-secondary"
													href="#">View</a></td>
											</tr>

										</tbody>
									</table>
								</div>
								<!--//table-responsive-->
							</div>
							<!--//app-card-body-->
						</div>
						<!--//app-card-->
					</div>
					<!--//tab-pane-->
				</div>
				<!--//tab-content-->



			</div>
			<!--//container-fluid-->
		</div>
		<!--//app-content-->


		<!--//app-footer-->

	</div>
	<!--//app-wrapper-->


	<!-- Javascript -->
	<script src="../assets/plugins/popper.min.js"></script>
	<script src="../assets/plugins/bootstrap/js/bootstrap.min.js"></script>


	<!-- Page Specific JS -->
	<script src="../assets/js/app.js"></script>

	<!-- Modal -->
	<div class="modal fade" id="exampleModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<p class="modal-title mt-3 ms-2">Log Out</p>
				<hr>
				<div class="modal-body ">

					<div class="align-items-center text-center ">
						<p class="mt-1 fs-2">Are you sure?</p>
						<hr>
						<a type="button" class="btn btn-primary" data-bs-dismiss="modal">Close</a>
						<a href="../logout" type="button" class="btn btn-danger">Log
							Out</a>
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
</body>
</html>

