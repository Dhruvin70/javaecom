<%@ page import="com.entity.User"%>
<div class="container-fluid"
	style="position: sticky; top: 0; z-index: 2;">
	<div class="row">
		<nav class="navbar col-md-12 navbar-expand-sm navbar-dark"
			style="backgroung-colour: rgba(0, 0, 0, 0.5);">
			<div class="container-fluid">
				<a class="navbar-brand" href="#"><i
					class="fa-solid fa-house ms-3"></i></a>
				<button class="navbar-toggler" type="button"
					data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
					aria-controls="navbarSupportedContent" aria-expanded="false"
					aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse" id="navbarSupportedContent">
					<ul class="navbar-nav me-auto mb-2 mb-lg-0">
						<li class="nav-item"><a class="nav-link active "
							aria-current="page" href="index.jsp">Home</a></li>
						<li class="nav-item"><a class="nav-link " aria-current="page"
							href="#"><i class="fa-solid fa-info me-1"></i>About US</a></li>
						<li class="nav-item"><a class="nav-link" href="#"><i
								class="fa-solid fa-magnifying-glass-arrow-right fa-flip-horizontal me-1"></i>Recent
								Search</a></li>
						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
							role="button" data-bs-toggle="dropdown" aria-expanded="false"><i
								class="fa-solid fa-gears me-1"></i> Products </a>
							<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
								<li><a class="dropdown-item" href="#">Action</a></li>
								<li><a class="dropdown-item" href="#">Another action</a></li>
								<li>
									<hr class="dropdown-divider">
								</li>
								<li><a class="dropdown-item" href="#">Something else
										here</a></li>
							</ul></li>
						<%
						if (session.getAttribute("loggedInUser") != null) {
						%>
						<li class="nav-item"><a class="nav-link" href="jsp/cart.jsp"><i
								class="fa-solid fa-solid fa-cart-shopping fa-flip-horizontal me-1"></i>My
								Cart</a></li>

					</ul>
					<form class="form-inline my-2 my-lg-0">
						<!-- on if user is logined -->
						<a href="jsp/account.jsp" style="text-decoration: none;">
							<button class="btn btn-light my-2 my-sm-0" type="button">
								<i class="fa-solid fa-gear me-2"></i>My Account
							</button>
						</a> <a href="jsp/help.jsp">
							<button class="btn btn-light my-2 my-sm-0" type="button">
								<i class="fa-solid fa-headset me-2"></i>Contact Us
							</button>
						</a>
					</form>
					<%
					} else {
					%>
					</ul>
				

						 <a href="jsp/help.jsp">
							<button class="btn btn-light my-2 my-sm-0" type="button">
								<i class="fa-solid fa-headset me-2"></i>Contact Us
							</button>
						</a>
				
					<%
					}
					%>
				</div>
			</div>
		</nav>

	</div>
</div>
<div class="container-fluid" style="background-color: black;">
	<div class="row">
		<div class="col p-3">
			<form action="../search" method="post" class="d-flex mx-auto">
				<input class="form-control me-4" name="ch" type="search"
					placeholder="Search" aria-label="Search">
				<button class="btn btn-success " type="submit">Search</button>
			</form>
		</div>
	</div>
</div>

