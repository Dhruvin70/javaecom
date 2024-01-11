<%@page import="com.DB.DBConnect"%>
<%@page import="com.entity.Cart"%>
<%@page import="com.entity.User"%>
<%@page import="java.util.List"%>
<%@page import="com.DAL.CartImplementation"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<%@ include file="/commom_components/common_css.jsp"%>

<style>
@media ( min-width : 1025px) {
	.h-custom {
		height: 50vh !important;
	}
}
</style>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<link rel="stylesheet" type="text/css" href="css/cart.css">

</head>
<body>
	<script>
    function deleteCartItem(cartId, userId) {
        $.ajax({
            type: "GET",
            url: "../removecid?cid=" + cartId + "&uid=" + userId,
            success: function(response) {
                // Handle the response, if needed
                console.log(response);
                // You can update the page dynamically here if necessary
                
                    // Refresh the page after successful deletion
                location.reload(true);

                // Optionally, trigger a client-side event or perform any additional actions
            },
            error: function(error) {
                console.error("Error deleting item:", error);
            }
        });

        // Prevent the default behavior of the link (prevents the page from navigating)
        return false;
    }
</script>


	<%
	User loggedInUser = (User) session.getAttribute("loggedInUser");
	if (session.getAttribute("loggedInUser") == null) {
		response.sendRedirect("login.jsp");
		return;

	}
	%>


	<section class="h-100 h-custom">
		<div class="container h-100 py-5">
			<div
				class="row d-flex justify-content-center align-items-center h-100">
				<div class="col">

					<div class="table-responsive">
						<table class="table">
							<thead>
								<tr>
									<%
									User u = (User) session.getAttribute("loggedInUser");
									CartImplementation dao = new CartImplementation(DBConnect.getConn());
									List<Cart> cartitem = dao.getItemByUser(u.getId());
									System.out.println(cartitem);
									String cartmsg = (cartitem.isEmpty()) ? "Nothing In Your " : "";
									session.setAttribute("cartmsg", cartmsg);
									%>

									<th scope="col" class="h5"><%=session.getAttribute("cartmsg")%>Shopping
										Bag</th>

									<th scope="col">Art</th>
									<th scope="col">Artist</th>
									<th scope="col">Price</th>
									<th scope="col"></th>
								</tr>
							</thead>
							<tbody>

								<%
								double totalprice = 0;
								for (Cart c : cartitem) {
									totalprice = c.getTotalprice();
								%>
								<tr>
									<th scope="row">
										<div class=>
											<img src="../items/<%=c.getFilename()%>"
												class="img-fluid rounded-3"
												style="width: 120px; height: 90px" alt="Book">

										</div>
									</th>


									<td class="align-middle">
										<p class="mb-0" style="font-weight: 500;"><%=c.getArtName()%></p>
									</td>

									<td class="align-middle">
										<p class="mb-0" style="font-weight: 500;"><%=c.getArtist()%></p>



									</td>
									<td class="align-middle">
										<p class="mb-0" style="font-weight: 500;"><%=c.getPrice()%></p>
									</td>
									<td class="align-middle"><a href="#" class="text-danger"
										onclick="deleteCartItem(<%=c.getCartId()%>, <%=c.getUserId()%>)"><i
											class="fas fa-trash fa-lg"></i></a></td>
								</tr>

								<%
								}

								double tax = 0.07 * totalprice;
								double x = (cartitem.isEmpty()) ? 0 : 2.99;
								double totalpricewithTax = totalprice + x + tax;
								
								%>
							</tbody>
						</table>
					</div>
					<div class="container-fluid">
						<div class="row">
							<div class="col-3">
								<a href="../index.jsp" type="button"
									class="btn btn-primary btn-block btn-lg mb-3">
									<div class="d-flex justify-content-between">
										<span>Continue Shopping</span>
									</div>
								</a>
							</div>



							<div class=" card  col-md-9 mb-5 " style="border-radius: 16px;">

								<div class="card-body p-5 ">

									<form action="../order" method="post">
										<!-- 2 column grid layout with text inputs for the first and last names -->
										<div class="row">
											<div class="col-md-6 mb-3">

												<input type="hidden" value="<%=u.getId() %>"
													name="orderuid">


												<div class="form-outline muted">
													<input type="text" id="form3Example1"
														value="<%=session.getAttribute("first")%>"
														class="form-control ps-2" readonly name="orderfirst" /> <label
														class="form-label ps-2" for="form3Example1">First
														name</label>
												</div>
											</div>
											<div class="col-md-6 mb-3">
												<div class="form-outline">
													<input type="text" id="form3Example2"
														class="form-control ps-2"
														value="<%=session.getAttribute("last")%>"
														 readonly  name="orderlast" /> <label
														class="form-label ps-2" for="form3Example2">Last
														name</label>
												</div>
											</div>
										</div>

										<div class="row">
											<div class="col-md-4 mb-3 ">

												<div class="form-outline form-white">
													<input type="tel" id="form3Examplea8"
														class="form-control ps-2" placeholder="123 456 7890"
														required="required" name="orderphone" /> <label
														class="form-label ps-2" for="form3Examplea8">Phone
														Number</label>
												</div>

											</div>
											<!-- Company name -->

											<!-- Email input -->
											<div class="col-md-8 mb-3">
												<input type="email" id="form3Example3"
													class="form-control ps-2"
													value="<%=session.getAttribute("email")%>"
													 readonly  name="orderemail" /> <label
													class="form-label ps-2" for="form3Example3">Email
													address</label>
											</div>
										</div>
										<div class="row">



											<!-- Company Address -->
											<div class="form-outline mb-3">
												<input type="text" id="form3Example3"
													class="form-control ps-2"
													placeholder="XYZ Street Name, City Name, XYZ123, Country "
													required="required" name="orderaddress" /> <label
													class="form-label ps-2" for="form3Example3">Address</label>
											</div>
											<input type="hidden" name="total"
												value="<%=totalpricewithTax%>">
												
												<input type="hidden" name="tax"
												value="<%=tax%>">
												
												<input type="hidden" name="price"
												value="<%=totalprice%>">

										</div>
										<div class="row">
											<div class="col-12">
												<button type="submit"
													class="btn btn-primary btn-block btn-lg">
													<div class="d-flex justify-content-between">
														<span>Continue Checkout</span>
													</div>
												</button>
											</div>
										</div>
									</form>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
	</section>
</body>
</html>