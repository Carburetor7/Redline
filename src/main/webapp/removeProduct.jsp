<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ page
	import="services.impl.*, services.*,models.*,java.util.*,javax.servlet.ServletOutputStream,java.io.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Remove Product</title>

<style>

        /* Container styles */
        .remove.container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 15px;
            font-family: Arial, sans-serif;
            margin: 50px auto;
            margin-bottom: 100px;
        }

        /* Row styles */
        .remove .row {
            margin-top: 5px;
            margin-left: 2px;
            margin-right: 2px;
            display: flex;
            flex-wrap: wrap;
        }
        
        .remove .sub-row{
        	margin-top: 5px;
            margin-left: 2px;
            margin-right: 2px;
            display: flex;
            flex-wrap: wrap;
            gap: 20px;
        }

        /* Form styles */
        .remove form {
            width: 100%;
            max-width: 400px;
            margin: 0 auto;
            border-radius: 10px;
            background-color: #FFE5CC;
            padding: 20px;
            padding-bottom: 30px;
            background: #fff;
			border-radius: 7px;
			box-shadow: 0 5px 10px rgba(0,0,0,0.3);
        }

        /* Form group styles */
        .remove .form-group {
            margin-bottom: 15px;
        }

        /* Heading styles */
        .remove h3 {
            color:rgb(26, 183, 157);
            margin-bottom: 20px;

        }

        /* Label styles */
        .remove label {
            font-weight: bold;
        }

        /* Input styles */
        .remove input[type="text"] {
            width: 100%;
            padding: 8px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
            margin-top: 5px;
        }

        /* Button styles */
        .remove .btn {
            padding: 8px 16px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            margin-top: 5px;
            text-decoration: none;
            display: inline-block;
            text-align: center;
            color: white;
        }

        /* Button info styles */
        .remove .btn-info {
            background-color: #17a2b8;
            font-size: 14px;
        }

        /* Button danger styles */
        .remove .btn-danger {
            background-color: #dc3545;
        }

        /* Button hover effect */
        .remove .btn:hover {
            opacity: 0.8;
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
	<div class="container remove">
        <div class="row">
            <form action="./RemoveProductSrv" method="post">
                <div class="text-center">
                    <h3>Product Deletion Form</h3>
                    <% if (message != null) { %>
                    <p style="color: blue;"><%=message%></p>
                    <% } %>
                </div>
                <div class="sub-row">
                    <div class="col-md-12 form-group">
                        <label for="product-id">Product Id</label>
                        <input type="text" placeholder="Enter Product Id" name="prodid" id="product-id" required>
                    </div>
                </div>
                <div class="sub-row">
                    <div class="col-md-6 text-center">
                        <a href="adminViewProduct.jsp" class="btn btn-info">Cancel</a>
                    </div>
                    <div class="col-md-6 text-center">
                        <button type="submit" class="btn btn-danger">Remove Product</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
    
    <jsp:include page="footer.jsp" />
</body>
</html>