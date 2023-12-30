<%@page import="com.DAL.ItemsImplement"%>
<%@page import="com.entity.Items"%>
<%@ page import="java.util.List"%>
<%@ page
	import="com.DB.DBConnect, java.sql.Connection, java.sql.SQLException"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Diamond Corporation</title>
<%@ include file="/commom_components/common_css.jsp"%>
<style>
.stickyimage {
	margin-top: 20px;
	background: white;
	background-image: url('images/pexels.jpg');
	height: 90vh;
	width: 100%;
	background-size: 100% 100%;
	background-attachment: fixed;
	background-repeat: no-repeat;
}

.card-container {
	display: flex;
	flex-flow: row wrap;
	justify-content: space-around;
	margin-top: 20px;
}

.card {
	width: 100%;
	max-width: 250px;
	border: solid 1px white;
	box-shadow: 0px 0px 2px 2px rgb(255, 255, 255);
	border-radius: 10px;
	margin: 10px;
	transition: 0.4s;
}

.card:hover {
	background: #f1f8e9;
	box-shadow: 0px 0px 5px 5px rgba(0, 0, 0, 0.692);
}

.card img {
	width: 100%;
	height: auto;
	max-height: 200px;
}

.card-text {
	text-align: center;
}

.btn-container {
	display: flex;
	justify-content: center;
}

.btn-container .btn {
	width: 100%;
	max-width: 200px;
	height: 40px;
}
</style>
</head>

<body style="background-color: black;">

<%
if(session.getAttribute("addCart") != null){
%>
<style>
   /* Add your CSS styles for the snackbar here */

   /* Example styles */
   #snackbar {
      visibility: hidden;
      min-width: 250px;
      margin-left: -125px;
      background-color: #333;
      color: #fff;
      text-align: center;
      border-radius: 2px;
      padding: 16px;
      position: fixed;
      z-index: 1;
      left: 50%;
      bottom: 30px;
      font-size: 17px;
   }

   #snackbar.show {
      visibility: visible;
      -webkit-animation: fadein 0.5s, fadeout 0.5s 2.5s;
      animation: fadein 0.5s, fadeout 0.5s 2.5s;
   }

   @-webkit-keyframes fadein {
      from {bottom: 0; opacity: 0;}
      to {bottom: 30px; opacity: 1;}
   }

   @keyframes fadein {
      from {bottom: 0; opacity: 0;}
      to {bottom: 30px; opacity: 1;}
   }

   @-webkit-keyframes fadeout {
      from {bottom: 30px; opacity: 1;}
      to {bottom: 0; opacity: 0;}
   }

   @keyframes fadeout {
      from {bottom: 30px; opacity: 1;}
      to {bottom: 0; opacity: 0;}
   }
</style>

<script>
   function myFunction() {
      var x = document.getElementById("snackbar");
      x.className = "show";
      setTimeout(function(){ x.className = x.className.replace("show", ""); }, 3000);
   }
   // Call the function after the page loads
   document.addEventListener("DOMContentLoaded", function() {
      myFunction();
   });
</script>

<%
}
%>
<%
// Clear session attributes after use
session.removeAttribute("addCart");
session.removeAttribute("addCartFailed");
%>

<!-- Include the snackbar HTML element where you want it to appear -->
<div id="snackbar">Item added to cart!</div>

	<%
	User u = (User) session.getAttribute("loggedInUser");
	System.out.print(u);
	%>

	<%@ include file="/commom_components/loginnavbar.jsp"%>
	<%@ include file="/commom_components/navbar.jsp"%>
	<%
	Connection connection = DBConnect.getConn();

	out.println(connection + "success");
	%>


	<%@ include file="commom_components/content.jsp"%>

	<!-- Recent Search Items -->

	<div class="container">
		<h3 class="text-center p-4">New Arts</h3>
		<div class="card-container">
			<%
			ItemsImplement dao = new ItemsImplement(DBConnect.getConn());
			List<Items> item = dao.getNewBooks();
			for (Items itemlist : item) {
			%>

			<div class="card" id="item<%=itemlist.getId() %>">
				<div class="card-body text-center">
					<img src="items/<%=itemlist.getItemimg()%>" alt="Card image"
						class="img-thumbnail ">
					<p class="card-text"><%=itemlist.getName()%></p>
					<p class="card-text">
						~by<%=itemlist.getProduct()%></p>
					<p class="card-text">

						<%=" " + itemlist.getPrice()%></p>
					<div class="btn-container">
						<%
						if (u == null) {
						%>
						<a href="login.jsp" class="btn btn-outline-success ">Add to Cart</a>
						<%
						} else {
						%>
						<a href="addingToCart?itemId=<%=itemlist.getId() %>&&uidfkid=<%=u.getId() %>" class="btn btn-outline-success " >Add to Cart</a>
						<%
						}
						%>


					</div>
				</div>
			</div>
			<%
			}
			%>
		</div>

		<div class="text-center p-2">
			<a href="#" class="btn btn-danger btn text-white mt-5 mb-4"
				style="width: 100px;">View All</a>
		</div>
	</div>

	<div class="stickyimage"></div>

	<div class="container">
		<h3 class="text-center p-4">All Products</h3>
		<div class="card-container">
			<div class="card">
				<div class="card-body text-center">
					<img
						src="images/CLP3-E9457-ACHSE-SHAFT-AXE-FOR-AGFA-D.LAB_-300x300.jpg"
						alt="Card image" class="img-thumbnail">
					<p class="card-text">Code</p>
					<p class="card-text">Item</p>
					<p class="card-text">Categories: Company</p>
					<div class="btn-container">
						<a href="#" class="btn btn-outline-success">Add to Cart</a>
					</div>
				</div>
			</div>
			<!-- Add more cards as needed -->
			<div class="card">
				<div class="card-body text-center">
					<img
						src="images/CLP3-E9457-ACHSE-SHAFT-AXE-FOR-AGFA-D.LAB_-300x300.jpg"
						alt="Card image" class="img-thumbnail">
					<p class="card-text">Code</p>
					<p class="card-text">Item</p>
					<p class="card-text">Categories: Company</p>
					<div class="btn-container">
						<a href="#" class="btn btn-outline-success">Add to Cart</a>
					</div>
				</div>
			</div>
			<!-- Add more cards as needed -->
			<div class="card">
				<div class="card-body text-center">
					<img
						src="images/CLP3-E9457-ACHSE-SHAFT-AXE-FOR-AGFA-D.LAB_-300x300.jpg"
						alt="Card image" class="img-thumbnail">
					<p class="card-text">Code</p>
					<p class="card-text">Item</p>
					<p class="card-text">Categories: Company</p>
					<div class="btn-container">
						<a href="#" class="btn btn-outline-success">Add to Cart</a>
					</div>
				</div>
			</div>
			<!-- Add more cards as needed -->
			<div class="card">
				<div class="card-body text-center">
					<img
						src="images/CLP3-E9457-ACHSE-SHAFT-AXE-FOR-AGFA-D.LAB_-300x300.jpg"
						alt="Card image" class="img-thumbnail ">
					<p class="card-text">Code</p>
					<p class="card-text">Item</p>
					<p class="card-text">Categories: Company</p>
					<div class="btn-container">
						<a href="#" class="btn btn-outline-success">Add to Cart</a>
					</div>
				</div>
			</div>
			<!-- Add more cards as needed -->
		</div>
	</div>

</body>

</html>


