<%@page import="com.entity.Items"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAL.ItemsImplement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin: Edit Item</title>
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
						<h4 class="text-center">Edit Item by Code</h4>


						<%
						String code = request.getParameter("code");
						ItemsImplement dao = new ItemsImplement(DBConnect.getConn());
						Items i = dao.getItemsByCode(code);
						%>



						<form action="../editItem" method="post"
							enctype="multipart/form-data">



							<div class="form-group">

								<label for="inputState">Name</label><input name="name"
									type="text" class="form-control" id="inputsection"
									value="<%=i.getName()%>">

							</div>


							<div class="form-group">

								<label for="inputState">Product</label><input name="product"
									type="text" class="form-control" id="inputsection"
									value="<%=i.getProduct()%>">

							</div>

							<div class="form-group">

								<label for="inputState">Product Code</label><input
									name="product_code" type="text" class="form-control"
									id="inputsection" value="<%=i.getProduct_code()%>">

							</div>
							<div class="form-group">

								<label for="inputState">Price</label><input name="price"
									type="text" class="form-control" id="inputsection"
									value="<%=i.getPrice()%>">

							</div>
							<div class="form-group">

								<label for="inputState">Status</label><select id="status"
									name="itemStatus" class="form-control">

									<%
									if ("Active".equals(i.getStatus())) {
									%>
									<option value="Active" style="color: green" selected>Active</option>
									<option value="Inactive" style="color: red">Inactive</option>
									<%
									} else {
									%>
									<option value="Inactive" style="color: red" selected>Inactive</option>
									<option value="Active" style="color: green">Active</option>

									<%
									}
									%>	


								</select>

							</div>
							
							<div class="form-group">

								<label for="inputState">Item</label>
								<p name="itemimg" class="form-control" id="inputsection"><%=i.getItemimg()%></p>

							</div>

							<button type="submit" class="btn btn-primary mt-3">Update</button>

						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>

</html>