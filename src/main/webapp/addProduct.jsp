<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<style>
        .add-product.container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 15px;
            font-family: Arial, sans-serif;
            margin: 50px auto;
            margin-bottom: 100px
            
        }

        /* Row styles */
        .add-product .row {
            margin-top: 5px;
            margin-left: 2px;
            margin-right: 2px;
            display: flex;
            flex-wrap: wrap;
        }
        
        .add-product .sub-row{
        	margin-top: 5px;
            margin-left: 2px;
            margin-right: 2px;
            display: flex;
            flex-wrap: wrap;
            gap: 20px;
            margin-bottom: 15px;
        }

        /* Form styles */
        .add-product form {
            width: 100%;
            max-width: 700px;
            margin: 0 auto;
            border-radius: 10px;
            background-color: #FFE5CC;
            padding: 10px 20px;
            background: #fff;
			border-radius: 7px;
			box-shadow: 0 5px 10px rgba(0,0,0,0.3);
        }

        /* Form group styles */
        .add-product .form-group {
            margin-bottom: 15px;
        }

        /* Heading styles */
        .add-product h2 {
            color: rgb(26, 183, 157);
             margin-bottom: 30px;
        }

        /* Label styles */
        .add-product label {
            font-weight: bold;
           
        }

        /* Input styles */
        .add-product input[type="text"],
        .add-product input[type="number"],
        .add-product select,
        .add-product textarea {
            width: 100%;
            padding: 8px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
            margin-top: 5px;
        }

        /* File input styles */
        .add-product input[type="file"] {
            margin-top: 5px;
        }

        /* Button styles */
        .add-product .btn {
            padding: 8px 16px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            margin-top: 5px;
        }

        /* Button danger styles */
        .add-product .btn-danger {
            background-color: #dc3545;
            color: white;
        }

        /* Button success styles */
        .add-product .btn-success {
            background-color: rgb(26, 183, 157);
            color: white;
        }

        /* Button reset styles */
        .add-product .btn-reset {
            background-color: #dc3545;
            color: white;
        }

        /* Button hover effect */
        .add-product .btn:hover {
            opacity: 0.8;
        }
        
        .add-product-link{
        	text-decoration: underline;
			color: rgb(26, 183, 157);
        }
    </style>
</head>
<body>
	<%
	/* Checking the user credentials */
	String userType = (String) session.getAttribute("usertype");
	String userName = (String) session.getAttribute("username");

	if (userType == null || !userType.equals("admin")) {

		response.sendRedirect("login.jsp?message=Access Denied, Login as admin!!");

	}

	else if (userName == null) {

		response.sendRedirect("login.jsp?message=Session Expired, Login Again!!");

	}
	%>
	
	<jsp:include page="header.jsp" />
	<%
	String message = request.getParameter("message");
	%>
	 <div class="container add-product">
        <div class="row">
            <form action="./AddProductSrv" method="post" enctype="multipart/form-data">
                <div class="text-center">
                    <h2>Product Addition Form</h2>
                    <% if (message != null) { %>
                    <p style="color: blue;"><%=message%></p>
                    <% } %>
                </div>
                <div class="sub-row">
                    <div class="col-md-6 form-group">
                        <label for="product-name">Product Name</label>
                        <input type="text" placeholder="Enter Product Name" name="name" id="product-name" required>
                    </div>
                    <div class="col-md-6 form-group">
                        <label for="product-type">Product Type</label>
                        <select name="type" id="product-type" class="form-control" required>
                            <option value="mobile">MOBILE</option>
                            <option value="tv">TV</option>
                            <option value="camera">CAMERA</option>
                            <option value="laptop">LAPTOP</option>
                            <option value="tablet">TABLET</option>
                            <option value="speaker">SPEAKER</option>
                            <option value="other">Some Other Appliances</option>
                        </select>
                    </div>
                </div>
                <div class="form-group">
                    <label for="product-description">Product Description</label>
                    <textarea name="info" id="product-description" class="form-control" required></textarea>
                </div>
                <div class="sub-row">
                    <div class="col-md-6 form-group">
                        <label for="unit-price">Unit Price</label>
                        <input type="number" placeholder="Enter Unit Price" name="price" id="unit-price" required>
                    </div>
                    <div class="col-md-6 form-group">
                        <label for="stock-quantity">Stock Quantity</label>
                        <input type="number" placeholder="Enter Stock Quantity" name="quantity" id="stock-quantity" required>
                    </div>
                </div>
                <div class="form-group">
                    <label for="product-image">Product Image</label>
                    <br>
                    <input type="file" name="image" id="product-image" required>
                </div>
                <div class="sub-row">
                    <div class="col-md-6 text-center">
                        <button type="reset" class="btn btn-reset">Reset</button>
                    </div>
                    <div class="col-md-6 text-center">
                        <button type="submit" class="btn btn-success">Add Product</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
    
    <jsp:include page="footer.jsp" />
</body>
</html>