<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ page
	import="services.impl.*, services.*,models.*,java.util.*,javax.servlet.ServletOutputStream,java.io.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Stocks</title>
<style>
        
        .stocks{
        	font-family: Arial, sans-serif;
        }

        /* Text center class */
        .text-center {
            text-align: center;
            color: rgb(26, 183, 157);
            font-size: 24px;
            font-weight: bold;
            font-family: Arial, sans-serif;
            position: relative;
            top: 40px;
        }

        /* Container styles */
        .stocks.container-fluid {
		  width: 100%;
  		  padding: 0 15px;
    	  margin: 50px auto;
   		  margin-bottom: 100px;
		}

        /* Table responsive styles */
        .stocks .table-responsive {
            overflow-x: auto;
        }

        /* Table styles */
        .stocks .table {
            width: 100%;
            border-collapse: collapse;
        }

        /* Table header styles */
        .stocks .table thead {
            background-color: rgb(26, 183, 157);
            color: white;
            font-size: 18px;
        }

        /* Table row styles */
        .stocks .table tbody tr {
            background-color: white;
            font-size: 16px;
        }

        /* Table cell styles */
        .stocks .table td,
        .stocks .table th {
            padding: 8px;
            border: 1px solid #ddd;
        }

        /* Table hover effect */
        .stocks .table-hover tbody tr:hover {
            background-color: #f5f5f5;
        }

        /* Button styles */
        .stocks .btn {
            padding: 8px 16px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        /* Button primary styles */
        .stocks .btn-primary {
            background-color: #007bff;
            color: white;
        }
      

    	.stocks .btn-primary:hover {
      		background-color: #138496;
    	}


    	.stocks .btn-danger:hover {
      		background-color: #c82333;
   		}

        /* Button danger styles */
        .stocks .btn-danger {
            background-color: #dc3545;
            color: white;
        }
        
        .stocks a {
        text-decoration: none;
        color: rgb(26, 183, 157);
        }
        
        .stocks a:hover{
        	color: rgb(18, 151, 129);
        }
        
        .stock-link{
        text-decoration: underline;
        color: rgb(18, 151, 129)
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
	<div class="text-center stock-text">Stock Products</div>

    <!-- Start of Product Items List -->
    <div class="container-fluid stocks">
        <div class="table-responsive">
            <table class="table table-hover table-sm">
                <thead>
                    <tr>
                        <th>Image</th>
                        <th>ProductId</th>
                        <th>Name</th>
                        <th>Type</th>
                        <th>Price</th>
                        <th>Sold Qty</th>
                        <th>Stock Qty</th>
                        <th colspan="2" style="text-align: center">Actions</th>
                    </tr>
                </thead>
                <tbody>
					<%
					ProductService productDao = new ProductService();
					List<Product> products = new ArrayList<Product>();
					products = productDao.getAllProducts();
					for (Product product : products) {
					%>
                    <tr>
                        <td><img src="./ShowImage?pid=<%=product.getProdId()%>" style="width: 50px; height: 50px;"></td>
                        <td><a href="./updateProduct.jsp?prodid=<%=product.getProdId()%>"><%=product.getProdId()%></a></td>
                        <%
						String name = product.getProdName();
						name = name.substring(0, Math.min(name.length(), 25)) + "..";
						%>
                        <td><%=name%></td>
                        <td><%=product.getProdType().toUpperCase()%></td>
                        <td><%=product.getProdPrice()%></td>
                        <td><%=new OrderService().countSoldItem(product.getProdId())%></td>
                        <td><%=product.getProdQuantity()%></td>
                        <td>
                            <form method="post">
                                <button type="submit" formaction="updateProduct.jsp?prodid=<%=product.getProdId()%>" class="btn btn-primary">Update</button>
                            </form>
                        </td>
                        <td>
                            <form method="post">
                                <button type="submit" formaction="./RemoveProductSrv?prodid=<%=product.getProdId()%>" class="btn btn-danger">Remove</button>
                            </form>
                        </td>
                    </tr>
                    <%
					}
					%>
					
					<%
					if (products.size() == 0) {
					%>
					<tr style="background-color: grey; color: white;">
						<td colspan="7" style="text-align: center;">No Items
							Available</td>

					</tr>
					<%
					}
					%>
                </tbody>
            </table>
        </div>
    </div>
    <jsp:include page="footer.jsp" />
</body>
</html>