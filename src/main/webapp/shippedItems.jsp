<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ page
	import="services.impl.*, services.*,models.*,java.util.*,javax.servlet.ServletOutputStream,java.io.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

		.shipped{
			 font-family: Arial, sans-serif;
		}
        /* Text center class */
        .shipped-text.text-center {
            text-align: center;
            font-size: 24px;
            font-weight: bold;
            font-family: Arial, sans-serif;
        }
        .shipped-text{
        	color: rgb(26, 183, 157);
        	position: relative;
        	top: 40px;
        }

        /* Container styles */
        .shipped.container-fluid {
            width: 100%;
            padding: 0 15px;
            margin: 50px auto;
            margin-bottom: 100px;
        }

        /* Table responsive styles */
        .shipped .table-responsive {
            overflow-x: auto;
        }

        /* Table styles */
        .shipped .table {
            width: 100%;
            border-collapse: collapse;
        }

        /* Table header styles */
        .table thead {
            background-color: rgb(26, 183, 157);
            color: white;
            font-size: 18px;
        }

        /* Table row styles */
        .shipped .table tbody tr {
            background-color: white;
        }

        /* Table cell styles */
        .shipped .table td,
        .shipped .table th {
            padding: 15px;
            border: 1px solid #ddd;
        }

        /* Table hover effect */
        .shipped .table-hover tbody tr:hover {
            background-color: #f5f5f5;
        }

        /* Success text color */
        .shipped .text-success {
            color: green;
            font-weight: bold;
        }
        
        .shipped-link{
        	text-decoration: underline;
			color: rgb(26, 183, 157);
        }
        
        .shipped .productID {
        text-decoration: none;
        color: rgb(26, 183, 157);
        }
        
        .shipped .productID:hover{
        	color: rgb(18, 151, 129);
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
	<div class="text-center shipped-text">Shipped Orders</div>

    <!-- Start of Shipped Orders List -->
    <div class="container-fluid shipped">
        <div class="table-responsive">
            <table class="table table-hover table-sm">
                <thead>
                    <tr>
                        <th>TransactionId</th>
                        <th>ProductId</th>
                        <th>Username</th>
                        <th>Address</th>
                        <th>Quantity</th>
                        <th>Amount</th>
                        <td>Status</td>
                    </tr>
                </thead>
                <tbody>
                    <%
					OrderService orderdao = new OrderService();

					List<OrderBean> orders = new ArrayList<OrderBean>();
					orders = orderdao.getAllOrders();
					int count = 0;
					for (OrderBean order : orders) {
						String transId = order.getTransactionId();
						String prodId = order.getProductId();
						int quantity = order.getQuantity();
						int shipped = order.getShipped();
						String userId = new TransactionService().getUserId(transId);
						String userAddr = new UserService().getUserAddr(userId);
						if (shipped != 0) {
							count++;
					%>
                    <tr>
                        <td><%=transId%></td>
                        <td><a class="productID" href="./updateProduct.jsp?prodid=<%=prodId%>"><%=prodId%></a></td>
                        <td><%=userId%></td>
                        <td><%=userAddr%></td>
                        <td><%=quantity%></td>
                        <td>Rs. <%=order.getAmount()%></td>
                        <td class="text-success">SHIPPED</td>
                    </tr>
                    <%
					}
					}
					%>
                    <%
					if (count == 0) {
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