<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ page
	import="services.impl.*, services.*,models.*,java.util.*,javax.servlet.ServletOutputStream,java.io.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update Product</title>
<style>

.update.container {
    width: 100%;
    max-width: 960px;
    margin: 0 auto;
    padding: 20px;
    font-family: Arial, sans-serif;
    background: #fff;
  	border-radius: 7px;
  	box-shadow: 0 5px 10px rgba(0,0,0,0.3);
    padding: 20px 60px;
    margin-top: 50px;
    margin-bottom: 100px;
}

.update .text-center {
    text-align: center;
}

.update .form-group {
    margin-bottom: 15px;
}

/* Form-specific styles */
.update #formHeader {
    font-weight: bold;
}

.update #formTitle {
    color: green;
}

.update #formMessage {
    color: blue;
}

.update .form-control {
    width: 100%;
    padding: 8px;
    border-radius: 5px;
    border: 1px solid #ccc;
}

.update .text-align-left {
    resize: vertical;
}

.update .form-row {
    display: flex;
    flex-wrap: wrap;
    margin-bottom: 10px;
}

.update .form-group-half {
    flex: 1;
    margin-right: 5px;
}

.update .form-group-third {
    flex: 1;
    margin-bottom: 10px;
}

.update .btn {
    padding: 8px 16px;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    font-size: 16px;
}

.update .btn-danger {
    background-color: #dc3545;
    color: #fff;
}

.update .btn-danger:hover{
	background-color: #bb0012;
}

.update .btn-success {
    background-color: rgb(26, 183, 157);
    color: #fff;
}

.update .btn-success:hover{
	background-color: rgb(18, 151, 129)
}



.update .row-data {
	gap: 30px;

}


/* Responsive styles */
@media (max-width: 768px) {
    .update .form-group-half {
        flex: 100%;
        margin-right: 0;
    }

    .update .form-group-third {
        flex: 100%;
        margin-bottom: 10px;
    }
}
</style>
</head>
<body>
	
	<%
	/* Checking the user credentials */
	String utype = (String) session.getAttribute("usertype");
	String uname = (String) session.getAttribute("username");
	String prodid = request.getParameter("prodid");
	Product product = new ProductService().getProductDetails(prodid);
	if (prodid == null || product == null) {
		response.sendRedirect("updateProductById.jsp?message=Please Enter a valid product Id");
		return;
	} else if (utype == null || !utype.equals("admin")) {
		response.sendRedirect("login.jsp?message=Access Denied, Login as admin!!");
		return;
	} else if (uname == null) {
		response.sendRedirect("login.jsp?message=Session Expired, Login Again!!");
		return;
	}
	%>
	
	<jsp:include page="header.jsp" />
	<%
	String message = request.getParameter("message");
	%>
	<div class="container update">
    <div class="row" id="formRow">
        <form action="./UpdateProductSrv" method="post" id="updateForm" enctype="multipart/form-data">
            <div id="formHeader" class="text-center">
                <div class="form-group">
                    <img src="./ShowImage?pid=<%=product.getProdId()%>" alt="Product Image" height="100px" />
                    <h2 id="formTitle">Product Update Form</h2>
                </div>
                <% if (message != null) { %>
                <p id="formMessage"><%=message%></p>
                <% } %>
            </div>
            <div class="form-row row-data">
                <input type="hidden" name="pid" class="form-control" value="<%=product.getProdId()%>" required>
            </div>
            <div class="form-row row-data">
                <div class="form-group-half">
                    <label for="productName">Product Name</label>
                    <input type="text" placeholder="Enter Product Name" name="name" class="form-control" value="<%=product.getProdName()%>" required>
                </div>
                <div class="form-group-half">
                    <% String ptype = product.getProdType(); %>
                    <label for="productType">Product Type</label>
                    <select name="type" id="productType" class="form-control" required>
                        <option value="macbook" <%="macbook".equalsIgnoreCase(ptype) ? "selected" : "" %>>Macbook</option>
                        <option value="acer">Acer</option>
                        <option value="dell">Dell</option>
                        <option value="hp">HP</option>
                    </select>
                </div>
            </div>
            <div class="form-group">
                <label for="productDescription">Product Description</label>
                <textarea name="info" class="form-control text-align-left" id="productDescription" required><%=product.getProdInfo()%></textarea>
            </div>
            <div class="form-row row-data">
                <div class="form-group-half">
                    <label for="unitPrice">Unit Price</label>
                    <input type="number" value="<%=product.getProdPrice()%>" placeholder="Enter Unit Price" name="price" class="form-control" id="unitPrice" required>
                </div>
                <div class="form-group-half">
                    <label for="stockQuantity">Stock Quantity</label>
                    <input type="number" value="<%=product.getProdQuantity()%>" placeholder="Enter Stock Quantity" class="form-control" id="stockQuantity" name="quantity" required>
                </div>
            </div>
            <div class="form-group">
                    <label for="product-image">Product Image</label>
                    <br>
                    <input type="file" name="image" id="product-image" required>
            </div>
            <div class="form-row text-center row-data">
                <div class="form-group-third">
                    <button formaction="adminViewProduct.jsp" class="btn btn-danger">Cancel</button>
                </div>
                <div class="form-group-third">
                    <button type="submit" class="btn btn-success">Update Product</button>
                </div>
            </div>
        </form>
    </div>
</div>
<jsp:include page="footer.jsp" />
</body>
</html>