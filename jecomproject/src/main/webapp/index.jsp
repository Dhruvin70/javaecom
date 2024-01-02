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
<title>Paintings: Home</title>
<link rel="stylesheet" type="text/css" href="css/cart.css">

<%@ include file="/commom_components/common_css.jsp"%>

<style>
.stickyimage {
	margin-top: 20px;
	background: white;
	background-image: url('images/main.jpeg');
	height: 90vh;
	width: 100%;
	background-size: 100% 100%;
	background-attachment: fixed;
	background-repeat: no-repeat;
}

/* Responsive design for card container */
.card-container {
	display: flex;
	flex-wrap: wrap;
	justify-content: space-around;
	margin-top: 20px;
}

/* Responsive design for individual cards */
.card {
	flex: 1 1 250px;
	/* Flex properties for responsiveness */
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

/* Responsive design for card images */
.card img {
	width: 100%;
	height: auto;
	max-height: 200px;
}

/* Center text in card */
.card-text {
	text-align: center;
}

/* Responsive design for button container and buttons */
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

	<script>
    function addToCart(itemId, uidfkid) {
        $.ajax({
            type: "GET",
            url: "addingToCart?itemId=" + itemId + "&uidfkid=" + uidfkid,
            success: function(response) {
                // Handle the response, if needed
                console.log(response);

                // Display Snackbar message
                  location.reload(true);
                

                // Reload the page after successful addition to the cart
             
                	displayNotification();
               

              
            },
            error: function(error) {
                console.error("Error adding item to cart:", error);
            }
        });

        // Prevent the default behavior of the link (prevents the page from navigating)
        return false;
    }

    function displayNotification() {
        var x = document.getElementById("snackbar");
        x.className = "show";
        setTimeout(function(){ x.className = x.className.replace("show", ""); }, 3000);
    }

    // Call the function after the page loads
    document.addEventListener("DOMContentLoaded", function() {
        // You may want to call myFunction here if you have other functionality in it
    });
</script>



	<!-- Include the snackbar HTML element where you want it to appear -->
	<div id="snackbar">Item added to cart!</div>

	
	<%
// Clear session attributes after use
session.removeAttribute("addCart");
session.removeAttribute("addCartFailed");
%> 



	<%
	User u = (User) session.getAttribute("loggedInUser");
	System.out.print(u);
	%>

	<%@ include file="commom_components/loginnavbar.jsp"%>
	<%@ include file="commom_components/navbar.jsp"%>
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
				System.out.println(itemlist);
			%>

			<div class="card" id="item<%=itemlist.getId()%>">
				<div class="card-body text-center">
					<img src="items/<%=itemlist.getItemimg()%>" alt="Card image"
						class="img-thumbnail" style="width: 200px; height: 200px;">
					<p class="card-text"><%=itemlist.getName()%></p>
					<p class="card-text">
						<span class="text-muted">~by</span> &nbsp;<%=itemlist.getProduct()%></p>
					<p class="card-text">

						<%=" " + itemlist.getPrice()%></p>
					<div class="btn-container">
						<%
						if (u == null) {
						%>
						<a href="jsp/login.jsp" class="btn btn-outline-success ">Add
							to Cart</a>
						<%
						} else {
						%>
						<a href="#" class="btn btn-outline-success"
							onclick="addToCart(<%=itemlist.getId()%>, <%=u.getId()%>)">Add
							to Cart</a>
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


