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
						<c:if test="${not empty smessage}">
								<p class="text-center text-success">${smessage}</p>
								<c:remove var="smessage" scope="session" />
							</c:if>

							<c:if test="${not empty fmessage}">
								<p class="text-center text-danger">${fmessage}</p>
								<c:remove var="fmessage" scope="session" />
							</c:if>
							
							
							
							
						<form action="../adminAddItems" method="post"
							enctype="multipart/form-data">
							


							<div class="form-group">

								<label for="inputState">Name</label><input name="name"
									type="text" class="form-control" id="inputsection" required>

							</div>


							<div class="form-group">

								<label for="inputState">Product</label><input name="product"
									type="text" class="form-control" id="inputsection" required>

							</div>

							<div class="form-group">

								<label for="inputState">Product Code</label><input
									name="product_code" type="text" class="form-control"
									id="inputsection" required>

							</div>
							<div class="form-group">

								<label for="inputState">Price</label><input name="price"
									type="text" class="form-control" id="inputsection" required>

							</div>
							<div class="form-group">
							<%
							
								ItemsImplement connection = new ItemsImplement(DBConnect.getConn());
								
							
							%>

								<label for="inputState">Status</label><select id="status"
									name="itemStatus" class="form-control">
									
												<%
												if ("Active".equals(item.getStatus())){
												%>
													<span class="badge bg-success">Active</span> 
												<%
												}else{
												%>	
												<span class="badge bg-danger">Inactive</span> 
												<%
												}
												%>

									<option selected value="Active" style="color: green">Active</option>
									<option value="Inactive" style="color: red">Inactive</option>
								</select>

							</div>
							<div class="form-group">

								<label for="inputState">Item</label><input name="itemimg"
									type="file" class="form-control" id="inputsection" required>

							</div>
							<button type="submit" class="btn btn-primary mt-3">Add</button>

						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>

</html>