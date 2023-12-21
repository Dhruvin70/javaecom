<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>

<head>
  <meta charset="ISO-8859-1">
  <title>Add Item</title>
  <%@include file="/commom_components/common_css.jsp" %>
</head>
<style>

	.form-group label{
	
	margin-top: 15px;
	margin-bottom:7px;
		
	
	}

</style>

<body>
  <div class="container"  style="margin-top:10%">
    <div class="row">
      <div class=" col-md-4 offset-md-4">
        <div class="card">
          <div class="card-body">
          		<h4 class="text-center">Name</h4>
				<form action="adminAddItems" method="post" enctype="multipart/form-data">
				<div class="form-group">
				
					<label for="inputState">Name</label><input name="name" type="text" class="form-control" id="inputsection">
				
				</div>
				
				
				<div class="form-group">
				
					<label for="inputState">Product</label><input name="product" type="text" class="form-control" id="inputsection">
				
				</div>
				
				<div class="form-group">
				
					<label for="inputState">Product Code</label><input name="product_code" type="text" class="form-control" id="inputsection">
				
				</div>
				<div class="form-group">
				
					<label for="inputState">Price</label><input name="price" type="text" class="form-control" id="inputsection">
				
				</div>
				<div class="form-group">
				
					<label for="inputState">Status</label><select id="status" name="itemStatus" class="form-control">
					
					<option selected value="Active" style="color:green">Active</option>
					<option value="Inactive" style="color:red">Inactive</option>
					</select>
				
				</div>
				<div class="form-group">
				
					<label for="inputState">Item</label><input name="itemimg" type="file" class="form-control" id="inputsection">
				
				</div>
				</form>
          </div>
        </div>
      </div>
    </div>
  </div>

</body>

</html>