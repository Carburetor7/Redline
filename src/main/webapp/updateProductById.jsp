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
    
    .update{
    	font-family: Arial, sans-serif;
    }

    .update.container {
      max-width: 600px;
      margin: 5px auto;
      padding: 0 10px;
      margin-top: 50px;
      margin-bottom: 100px;
    }

    .update .row {
      margin-left: -2px;
      margin-right: -2px;
    }

    .update .form-wrapper {
      background: #fff;
  	  border-radius: 7px;
  	  box-shadow: 0 5px 10px rgba(0,0,0,0.3);
      padding: 30px;
      padding-inline: 20px;
    }

    .update .form-header {
      font-weight: bold;
      text-align: center;
      margin-bottom: 10px;
    }

    .update .form-header h3 {
      color: rgb(26, 183, 157);
    }

    .update .form-message {
      color: blue;
    }

    .update .form-group {
      margin-bottom: 10px;
    }

    .update .form-group label {
      display: block;
      margin-bottom: 5px;
    }

    .update .form-control {
      width: 100%;
      padding: 8px;
      border: 1px solid #ccc;
      border-radius: 4px;
      box-sizing: border-box;
    }

    .update .btn-group {
      display: flex;
      justify-content: center;
      margin-top: 20px;
    }

    .update .btn {
      display: inline-block;
      padding: 8px 16px;
      margin: 0 5px;
      border: none;
      border-radius: 4px;
      cursor: pointer;
      font-size: 16px;
      text-align: center;
      text-decoration: none;
      transition: background-color 0.3s;
    }

    .update .btn-info {
      background-color: #17a2b8;
      color: #fff;
    }

    .update .btn-info:hover {
      background-color: #138496;
    }

    .update .btn-danger {
      background-color: #dc3545;
      color: #fff;
    }

    .update .btn-danger:hover {
      background-color: #c82333;
    }
</style>
</head>
<body>
	<%
	/* Checking the user credentials */
	String userType = (String) session.getAttribute("usertype");
	String userName = (String) session.getAttribute("username");

	if (userType == null || !userType.equals("admin")) {
		response.sendRedirect("login.jsp?message=Access Denied, Login As Admin!!");
		return;

	} else if (userName == null) {
		response.sendRedirect("login.jsp?message=Session Expired, Login Again!!");
		return;
	}
	%>
	
	<jsp:include page="header.jsp" />
	<%
	String message = request.getParameter("message");
	%>
	<div class="container update">
    <div class="row">
      <form action="updateProduct.jsp" method="post" class="col-md-4 offset-md-4 form-wrapper">
        <div class="form-header">
          <h3>Product Update Form</h3>
          <% if (message != null) { %>
          <p class="form-message"><%= message %></p>
          <% } %>
        </div>
        <div class="form-group">
          <label for="prodId">Product Id</label>
          <input type="text" id="prodId" name="prodid" placeholder="Enter Product Id" class="form-control" required>
        </div>
        <div class="btn-group">
          <a href="adminViewProduct.jsp" class="btn btn-info">Cancel</a>
          <button type="submit" class="btn btn-danger">Update Product</button>
        </div>
      </form>
    </div>
  </div>
  <jsp:include page="footer.jsp" />
</body>
</html>