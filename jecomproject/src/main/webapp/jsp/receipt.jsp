<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Confirmation</title>
<%@ include file="/commom_components/common_css.jsp"%>

</head>
<body>
	<div class="container mt-5">
		<div class="row ">
			<div class="col-2"></div>
			<div class="col-8">
				<div class="card">
					<fieldset>
						<div class="card-body">
							<div align="center">
								<h1>
									Payment Done<br> Thank you for purchasing our products
								</h1>
								<br />
								<h2>Receipt Details:</h2>
								<table>
									<tr>
										<td><b>Payer:</b></td>
										<td>${payer.firstName}${payer.lastName}</td>
									</tr>
									<tr>
										<td><b>Description:</b></td>
										<td>${transaction.description}</td>
									</tr>
									<tr>
										<td><b>Subtotal:</b></td>
										<td>${transaction.amount.details.subtotal}USD</td>
									</tr>
									<tr>
										<td><b>Shipping:</b></td>
										<td>${transaction.amount.details.shipping}USD</td>
									</tr>
									<tr>
										<td><b>Tax:</b></td>
										<td>${transaction.amount.details.tax}USD</td>
									</tr>
									<tr>
										<td><b>Total:</b></td>
										<td>${transaction.amount.total}USD</td>
									</tr>
								</table>
							</div>
						</div>
					</fieldset>
				</div>
			</div>
		</div>
	</div>
</body>
</html>