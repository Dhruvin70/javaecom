<%@page import="com.entity.Items"%>
<%@page import="java.util.List"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAL.ItemsImplement"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>



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
<link rel="shortcut icon" href="../favicon.ico">

<!-- FontAwesome JS-->
<script defer src="../assets/plugins/fontawesome/js/all.min.js"></script>

<!-- App CSS -->
<link id="theme-style" rel="stylesheet" href="../assets/css/portal.css">

<!-- Dialogbox JS-->


<script>
    function showConfirmation(itemId) {
        // Use SweetAlert to display a confirmation dialog
        Swal.fire({
            title: 'Are you sure?',
            text: 'You won\'t be able to revert this!',
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#d33',
            cancelButtonColor: '#3085d6',
            confirmButtonText: 'Yes, delete it!'
        }).then((result) => {
            if (result.isConfirmed) {
                // If user clicks 'Yes', call the delete function
                deleteFunction(itemId);
            } else {
                // If user clicks 'No', you can handle it here
                Swal.fire('Cancelled', 'Your operation is safe :)', 'info');
            }
        });
    }

    function deleteFunction(itemId) {
        // Use the Fetch API to make an AJAX request
        fetch('http://localhost:8080/jecomproject/deleteItem?id=' + itemId, {
            method: 'GET',
            headers: {
                'Content-Type': 'application/json',
                // Add any other headers as needed
            },
        })
        .then(response => {
            if (!response.ok) {
                throw new Error('Network response was not ok');
            }
            return response.json();
        })
        .then(data => {
            // Handle the response from the server
            Swal.fire('Deleted!', data.message, 'success');
            // Reload the page after deletion
            location.reload();
        })
        .catch(error => {
            console.error('Error:', error);
            // Handle error, display an error message, etc.
        });
    }
</script>

</head>

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
									<li><a class="dropdown-item" href="../account.jsp">Account</a></li>

									<li><hr class="dropdown-divider"></li>
									<li><a class="dropdown-item" href="login.jsp">Log Out</a></li>
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
					<a class="app-logo" href="index.html"><img
						class="logo-icon me-2" src="../assets/images/app-logo.svg"
						alt="logo"><span class="logo-text">PORTAL</span></a>

				</div>
				<!--//app-branding-->
				<nav id="app-nav-main" class="app-nav app-nav-main flex-grow-1">
					<ul class="app-menu list-unstyled accordion" id="menu-accordion">

						<li class="nav-item">
							<!--//Bootstrap Icons: https://icons.getbootstrap.com/ --> <a
							class="nav-link" href="adminhome.jsp"> <span class="nav-icon">
									<svg width="1em" height="1em" viewBox="0 0 16 16"
										class="bi bi-folder" fill="currentColor"
										xmlns="http://www.w3.org/2000/svg">
  <path
											d="M9.828 4a3 3 0 0 1-2.12-.879l-.83-.828A1 1 0 0 0 6.173 2H2.5a1 1 0 0 0-1 .981L1.546 4h-1L.5 3a2 2 0 0 1 2-2h3.672a2 2 0 0 1 1.414.586l.828.828A2 2 0 0 0 9.828 3v1z" />
  <path fill-rule="evenodd"
											d="M13.81 4H2.19a1 1 0 0 0-.996 1.09l.637 7a1 1 0 0 0 .995.91h10.348a1 1 0 0 0 .995-.91l.637-7A1 1 0 0 0 13.81 4zM2.19 3A2 2 0 0 0 .198 5.181l.637 7A2 2 0 0 0 2.826 14h10.348a2 2 0 0 0 1.991-1.819l.637-7A2 2 0 0 0 13.81 3H2.19z" />
</svg>
							</span> </span> <span class="nav-link-text">Orders</span>
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
										href="add_item.jsp">Add Item</a></li>

									<li class="submenu-item"><a class="submenu-link"
										href="all_items.jsp">All Items</a></li>

								</ul>
							</div>
						</li>
						<li class="nav-item has-submenu">
							<!--//Bootstrap Icons: https://icons.getbootstrap.com/ -->

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
						role="tab" aria-controls="orders-all" aria-selected="true">All</a>
					<a class="flex-sm-fill text-sm-center nav-link"
						id="orders-paid-tab" data-bs-toggle="tab" href="#orders-paid"
						role="tab" aria-controls="orders-paid" aria-selected="false">All
						Orders</a>
					<!-- 		<a class="flex-sm-fill text-sm-center nav-link"
						id="orders-pending-tab" data-bs-toggle="tab"
						href="#orders-pending" role="tab" aria-controls="orders-pending"
						aria-selected="false">Pending</a> <a
						class="flex-sm-fill text-sm-center nav-link"
						id="orders-cancelled-tab" data-bs-toggle="tab"
						href="#orders-cancelled" role="tab"
						aria-controls="orders-cancelled" aria-selected="false">Cancelled</a>
					 -->
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
												<th class="cell">Name</th>
												<th class="cell">Product</th>
												<th class="cell">Product Code</th>
												<th class="cell">Price in USD</th>
												<th class="cell">Status</th>
												<th class="cell">Action</th>

											</tr>
										</thead>

										<%-- Check for success message --%>
										<%
										if (session.getAttribute("deletionsmessage") != null) {
										%>
										<p class="text-sm-center text-success pt-3 pb-3"
											style="border: solid green; border-width: 2px 2px 2px 2px;"
											data-bs-toggle="tab">
											<%=session.getAttribute("deletionsmessage")%>
										</p>
										<%
										session.removeAttribute("deletionsmessage");
										%>
										<%
										}
										%>

										<%-- Check for failure message --%>
										<%
										if (session.getAttribute("deletionfmessage") != null) {
										%>
										<p class="text-sm-center text-danger pt-3 pb-3"
											style="border: solid red; border-width: 2px 2px 2px 2px;"
											data-bs-toggle="tab">
											<%=session.getAttribute("deletionfmessage")%>
										</p>
										<%
										session.removeAttribute("deletionfmessage");
										%>
										<%
										}
										%>


										<tbody>

											<%
											ItemsImplement itemImplement = new ItemsImplement(DBConnect.getConn());
											List<Items> list = itemImplement.getAllItems();
											for (Items item : list) {
											%>

											<tr>
												<td class="cell" id="routeId_<%=item.getId()%>" hidden
													value="<%=item.getId()%>"><%=item.getId()%></td>

												<td class="cell"><%=item.getName()%></td>
												<td class="cell"><span class="truncate"><img
														alt="" src="../items/<%=item.getItemimg()%>"
														style="width: 100px; height: 100px"></span></td>
												<td class="cell"><%=item.getProduct_code()%></td>
												<td class="cell"><span><%=item.getPrice()%></span> <!--  <span> class="note">2:16
														PM</span>--></td>
												<td class="cell">
													<%
													if ("Active".equals(item.getStatus())) {
													%> <span class="badge bg-success p-1 ps-2 pe-2"
													style="font-size: 14px;">Active</span> <%
 } else {
 %> <span class="badge bg-danger p-1 ps-2 pe-2 "
													style="font-size: 14px;">Inactive</span> <%
 }
 %>
												</td>
												<td class="cell"><a
													href="editItem.jsp?id=<%=item.getId()%>"
													class="btn btn-sm btn-primary p-1 ps-2 pe-2"><i
														class="fas fa-edit me-1"></i>Edit</a> <a
													href="#" onclick="showConfirmation('<%=item.getId()%>')"
													class="btn btn-sm btn-danger  p-1 ps-2 pe-2"><i
														class="fas fa-trash-alt me-1" ></i>Delete</a> <!-- onclick="showConfirmation('<%=item.getId()%>')"-->
												</td>
												</td>

											</tr>
											<%}%>
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
					<!--//tab-pane-->

					<div class="tab-pane fade" id="orders-paid" role="tabpanel"
						aria-labelledby="orders-paid-tab">
						<div class="app-card app-card-orders-table mb-5">
							<div class="app-card-body">
								<div class="table-responsive">

									<table class="table mb-0 text-left">
										<thead>
											<tr>
												<th class="cell">Order</th>
												<th class="cell">Email</th>
												<th class="cell">Country code</th>
												<th class="cell">Phone</th>
												<th class="cell">Customer</th>
												<th class="cell">Date</th>
												<th class="cell">Address</th>
												<th class="cell">Status</th>
												<th class="cell">Total</th>
												<th class="cell"></th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td class="cell">#15346</td>
												<td class="cell"><span class="truncate">xyz@gmail.com</span></td>
												<td class="cell">+1 CAD</td>
												<td class="cell">9904499044</td>
												<td class="cell">John Sanders</td>
												<td class="cell"><span>17 Oct</span><span class="note">2:16
														PM</span></td>
												<td class="cell">Nobody Knows, Toronto, ON M4J ***</td>
												<td class="cell"><span class="badge bg-success">Paid</span></td>
												<td class="cell">$259.35</td>
												<td class="cell"><a class="btn-sm app-btn-secondary"
													href="#">Invoice</a></td>
											</tr>
											<tr>
												<td class="cell">#15346</td>
												<td class="cell"><span class="truncate">xyz@gmail.com</span></td>
												<td class="cell">+1 CAD</td>
												<td class="cell">9904499044</td>
												<td class="cell">John Sanders</td>
												<td class="cell"><span>17 Oct</span><span class="note">2:16
														PM</span></td>
												<td class="cell"><span class="badge bg-success">Paid</span></td>
												<td class="cell">$259.35</td>
												<td class="cell"><a class="btn-sm app-btn-secondary"
													href="#">View</a></td>
											</tr>
											<tr>
												<td class="cell">#15346</td>
												<td class="cell"><span class="truncate">xyz@gmail.com</span></td>
												<td class="cell">+1 CAD</td>
												<td class="cell">9904499044</td>
												<td class="cell">John Sanders</td>
												<td class="cell"><span>17 Oct</span><span class="note">2:16
														PM</span></td>
												<td class="cell"><span class="badge bg-success">Paid</span></td>
												<td class="cell">$259.35</td>
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

					<div class="tab-pane fade" id="orders-pending" role="tabpanel"
						aria-labelledby="orders-pending-tab">
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
												<td class="cell">#15345</td>
												<td class="cell"><span class="truncate">Consectetur
														adipiscing elit</span></td>
												<td class="cell">Dylan Ambrose</td>
												<td class="cell"><span class="cell-data">16 Oct</span><span
													class="note">03:16 AM</span></td>
												<td class="cell"><span class="badge bg-warning">Pending</span></td>
												<td class="cell">$96.20</td>
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
</body>
</html>

