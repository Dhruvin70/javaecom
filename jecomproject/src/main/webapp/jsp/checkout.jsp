<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Checkout Page</title>
<%@ include file="/commom_components/common_css.jsp"%>
</head>
<body>
	<div class="container-fluid mt-5">
		<div class="row justify-content-center">
			<div class="col-12 col-md-8 col-lg-8">
				<form action="../authorize" method="post">
					<div class="card shadow-2-strong mb-5 mb-lg-0"
						style="border-radius: 16px;">
						<div class="card-body p-3">
							<div class="row">
								<div class="col-md-6 col-lg-4  mb-4 mb-md-0">

									<div class="d-flex flex-row pb-3">
										<div class="d-flex align-items-center pe-2">
											<input class="form-check-input" type="radio" name="cardType"
												id="radioNoLabel1v" value="" aria-label="..." checked />
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
											<input class="form-check-input" type="radio" name="cardType"
												id="radioNoLabel2v" value="" aria-label="..." />
										</div>
										<div class="rounded border w-100 p-3">
											<label for="radioNoLabel2v"
												class="d-flex align-items-center mb-0"> <i
												class="fab fa-cc-visa fa-2x fa-lg text-dark pe-2"></i>Debit
												Card
											</label>
										</div>
									</div>
									<div class="ms-4 d-flex flex-row">
										<!-- Use a button to trigger the form submission -->
										<button type="submit"
											class="text-start rounded border w-100 p-3 btn btn-outline-primary text-decoration-none ">
											<svg xmlns="http://www.w3.org/2000/svg" height="16"
												class="bi bi-paypal" viewBox="0 0 16 16">
                                                <path
													d="M14.06 3.713c.12-1.071-.093-1.832-.702-2.526C12.628.356 11.312 0 9.626 0H4.734a.7.7 0 0 0-.691.59L2.005 13.509a.42.42 0 0 0 .415.486h2.756l-.202 1.28a.628.628 0 0 0 .62.726H8.14c.429 0 .793-.31.862-.731l.025-.13.48-3.043.03-.164.001-.007a.35.35 0 0 1 .348-.297h.38c1.266 0 2.425-.256 3.345-.91q.57-.403.993-1.005a4.94 4.94 0 0 0 .88-2.195c.242-1.246.13-2.356-.57-3.154a2.7 2.7 0 0 0-.76-.59l-.094-.061ZM6.543 8.82a.7.7 0 0 1 .321-.079H8.3c2.82 0 5.027-1.144 5.672-4.456l.003-.016q.326.186.548.438c.546.623.679 1.535.45 2.71-.272 1.397-.866 2.307-1.663 2.874-.802.57-1.842.815-3.043.815h-.38a.87.87 0 0 0-.863.734l-.03.164-.48 3.043-.024.13-.001.004a.35.35 0 0 1-.348.296H5.595a.106.106 0 0 1-.105-.123l.208-1.32z" />
                                            </svg>
											<span class="ms-2 text-dark">Checkout with PayPal</span>
										</button>
									</div>
								</div>
								<div class="col-md-6 col-lg-4 col-xl-8">
									<div class="row">
										<div class="col-12 col-xl-6">
											<div class="form-outline mb-4 mb-xl-5">
												<input type="text" id="typeName"
													class="form-control form-control-lg" size="17"
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
												<input type="text" id="typeCardNumber"
													class="form-control form-control-lg" size="17"
													placeholder="1111 2222 3333 4444" minlength="19"
													maxlength="19" /> <label class="form-label"
													for="typeCardNumber">Card Number</label>
											</div>
											<div class="form-outline mb-4 mb-xl-5">
												<input type="password" id="typeCvv"
													class="form-control form-control-lg"
													placeholder="&#9679;&#9679;&#9679;" size="1" minlength="3"
													maxlength="3" /> <label class="form-label" for="typeCvv">CVV</label>
											</div>
										</div>
									</div>
								</div>
								<div class="col-lg-4 col-xl-12">
									<div class="d-flex justify-content-between"
										style="font-weight: 500;">
										<p class="mb-2">Subtotal</p>
										<p class="mb-2"><%=session.getAttribute("orderprice")%></p>
									</div>
									<div class="d-flex justify-content-between"
										style="font-weight: 500;">
										<p class="mb-0">Shipping</p>
										<p class="mb-0">$2.99</p>
									</div>
									<div class="d-flex justify-content-between"
										style="font-weight: 500;">
										<p class="mb-0">Tax & Service Charges</p>
										<p class="mb-0"><%=session.getAttribute("tax")%></p>
									</div>
									<hr class="my-4">
									<div class="d-flex justify-content-between mb-4"
										style="font-weight: 500;">
										<p class="mb-2">Total (tax included)</p>
										<div class="mb-2">
											$<%=session.getAttribute("total")%></div>
									</div>





									<button type="submit" class="btn btn-primary btn-block btn-lg">
										<div class="d-flex justify-content-between">
											<span>Checkout</span> <span>$<%=session.getAttribute("total")%></span>
										</div>
									</button>
									<p class="mb-2"><%=session.getAttribute("orderDetail")%></p>
								</div>
							</div>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>
