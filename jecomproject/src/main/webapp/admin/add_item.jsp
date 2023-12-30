<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>

<head>
<meta charset="ISO-8859-1">
<title>Add Item</title>
<%@include file="/commom_components/common_css.jsp"%>
</head>
<style>
.form-group label {
	margin-top: 15px;
	margin-bottom: 7px;
}
</style>

<body>
	<div class="container" style="margin-top: 10%">
		<div class="row">
			<div class=" col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body">
						<h4 class="text-center">Add Items</h4>
						<%-- Check for success message --%>
						<%
						if (session.getAttribute("smessage") != null) {
						%>
						<p class="text-center text-success"><%=session.getAttribute("smessage")%></p>
						<%
						session.removeAttribute("smessage");
						%>
						<%
						}
						%>

						<%-- Check for failure message --%>
						<%
						if (session.getAttribute("fmessage") != null) {
						%>
						<p class="text-center text-danger"><%=session.getAttribute("fmessage")%></p>
						<%
						session.removeAttribute("fmessage");
						%>
						<%
						}
						%>
						<form action="../adminAddItems" method="post"
							enctype="multipart/form-data">



							<div class="form-group">

								<label for="inputState">Artwork</label><input name="name"
									type="text" class="form-control" id="inputsection" required>

							</div>


							<div class="form-group">

								<label for="inputState"> Artist Name</label><input
									name="product" type="text" class="form-control"
									id="inputsection" required>

							</div>

							<div class="form-group">

								<label for="inputState">Product Code</label><input
									name="product_code" type="text" class="form-control"
									id="inputsection" required>

							</div>
							<div class="form-group">

								<label for="inputState">Price</label>
									<input name="price" type="text" class="form-control" id="inputsection" pattern="[0-9]+(\.[0-9]+)?" title="Enter a valid number with decimals" required>

							</div>
							<div class="form-group">

								<label for="inputState">Status</label><select id="status"
									name="itemStatus" class="form-control">

									<option selected value="Active" style="color: green">Available</option>
									<option value="Inactive" style="color: red">Sold</option>
								</select>

							</div>
							<div class="form-group">

								<label for="inputState">Item</label><input name="itemimg"
									type="file" class="form-control" id="inputsection" required>

							</div>
							<button type="submit" class="btn btn-primary mt-3">Add</button>
							<a href="all_items.jsp" class="btn btn-primary mt-3">Back to All Items</a>

						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>

</html>