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
									System.out.println("-----------------------------------------------------------------");
									System.out.println("at  total: " + totalprice);
									System.out.println("------------------------------------------------------------------");
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



								<div class=" card  col-md-9 mb-5 "
									style="border-radius: 16px;">
									
									<div class="card-body p-5 ">

										<form>
											<!-- 2 column grid layout with text inputs for the first and last names -->
											<div class="row">
												<div class="col-md-6 mb-3">



													<div class="form-outline">
														<input type="text" id="form3Example1"
															class="form-control ps-2" placeholder="John"
															required="required" name="first" /> <label
															class="form-label ps-2" for="form3Example1">First
															name</label>
													</div>
												</div>
												<div class="col-md-6 mb-3">
													<div class="form-outline">
														<input type="text" id="form3Example2"
															class="form-control ps-2" placeholder="Smith"
															required="required" name="last" /> <label
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
															required="required" name="phone" /> <label
															class="form-label ps-2" for="form3Examplea8">Phone
															Number</label>
													</div>

												</div>
												<!-- Company name -->
												
												<!-- Email input -->
												<div class="col-md-8 mb-3">
													<input type="email" id="form3Example3"
														class="form-control ps-2" placeholder="xyz@domain.com"
														required="required" name="email" /> <label
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
														required="required" name="address" /> <label
														class="form-label ps-2" for="form3Example3">Address</label>
												</div>
												
											</div>
										</form>
									</div>
								</div>
							</div>
							<div class="card shadow-2-strong mb-5 mb-lg-0"
								style="border-radius: 16px;">
								<div class="card-body p-4">

									<div class="row">
										<div class="col-md-6 col-lg-4 col-xl-3 mb-4 mb-md-0">
											<form>
												<div class="d-flex flex-row pb-3">
													<div class="d-flex align-items-center pe-2">
														<input class="form-check-input" type="radio"
															name="radioNoLabel" id="radioNoLabel1v" value=""
															aria-label="..." checked />
													</div>
													<div class="rounded border w-100 p-3">
														<label for="radioNoLabel1v"
															class="d-flex align-items-center mb-0"> <i
															class="fab fa-cc-mastercard fa-2x text-dark pe-2"></i>Credit
															Card
														</label>
													</div>
												</div>
												<div class="d-flex flex-row pb-3">
													<div class="d-flex align-items-center pe-2">
														<input class="form-check-input" type="radio"
															name="radioNoLabel" id="radioNoLabel2v" value=""
															aria-label="..." />
													</div>
													<div class="rounded border w-100 p-3">
														<label for="radioNoLabel2v"
															class="d-flex align-items-center mb-0"> <i
															class="fab fa-cc-visa fa-2x fa-lg text-dark pe-2"></i>Debit
															Card
														</label>
													</div>
												</div>

												<div class="d-flex flex-row">
													<div class="d-flex align-items-center pe-2">
														<input class="form-check-input" type="radio"
															name="radioNoLabel" id="radioNoLabel3v" value=""
															aria-label="..." />
													</div>
													<div class="rounded border w-100 p-3">
														<label for="radioNoLabel3v"
															class="d-flex align-items-center mb-0"> <i
															class="fab fa-cc-paypal fa-2x fa-lg text-dark pe-2"></i>PayPal
														</label>
													</div>
												</div>

											</form>
										</div>
										<div class="col-md-6 col-lg-4 col-xl-6">
											<div class="row">
												<div class="col-12 col-xl-6">
													<div class="form-outline mb-4 mb-xl-5">
														<input type="text" id="typeName"
															class="form-control form-control-lg" siez="17"
															placeholder="John Smith" /> <label class="form-label"
															for="typeName">Name on card</label>
													</div>

													<div class="form-outline mb-4 mb-xl-5">
														<input type="text" id="typeExp"
															class="form-control form-control-lg" placeholder="MM/YY"
															size="7" id="exp" minlength="7" maxlength="7" /> <label
															class="form-label" for="typeExp">Expiration</label>
													</div>
												</div>
												<div class="col-12 col-xl-6">
													<div class="form-outline mb-4 mb-xl-5">
														<input type="text" id="typeText"
															class="form-control form-control-lg" siez="17"
															placeholder="1111 2222 3333 4444" minlength="19"
															maxlength="19" /> <label class="form-label"
															for="typeText">Card Number</label>
													</div>

													<div class="form-outline mb-4 mb-xl-5">
														<input type="password" id="typeText"
															class="form-control form-control-lg"
															placeholder="&#9679;&#9679;&#9679;" size="1"
															minlength="3" maxlength="3" /> <label class="form-label"
															for="typeText">Cvv</label>
													</div>
												</div>
											</div>
										</div>
										<div class="col-lg-4 col-xl-3">
											<div class="d-flex justify-content-between"
												style="font-weight: 500;">
												<p class="mb-2">Subtotal</p>
												<p class="mb-2"><%=totalprice%></p>
											</div>

											<div class="d-flex justify-content-between"
												style="font-weight: 500;">
												<p class="mb-0">Shipping</p>
												<p class="mb-0">$2.99</p>
											</div>

											<div class="d-flex justify-content-between"
												style="font-weight: 500;">
												<p class="mb-0">Tax & Service Charges</p>
												<p class="mb-0"><%=tax%></p>
											</div>

											<hr class="my-4">

											<div class="d-flex justify-content-between mb-4"
												style="font-weight: 500;">
												<p class="mb-2">Total (tax included)</p>
												<div class="mb-2">
													$<%=totalpricewithTax%></div>
											</div>

											<button type="button"
												class="btn btn-primary btn-block btn-lg">
												<div class="d-flex justify-content-between">
													<span>Checkout</span> <span>$<%=totalpricewithTax%></span>
												</div>
											</button>


										</div>
									</div>

								</div>
							</div>

						</div>
					</div>
				</div>
	</section>
</body>
</html>