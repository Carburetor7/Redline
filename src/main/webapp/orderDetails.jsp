<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page
	import="services.impl.*, services.*,models.*,java.util.*,javax.servlet.ServletOutputStream,java.io.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Order Details</title>
 <style>
        /* Global styles */
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
        }

        /* Text center class */
        .order-text.text-center {
            text-align: center;
            color: rgb(26, 183, 157);
            font-size: 24px;
            font-weight: bold;
            position: relative;
            top: 45px;
        }

        /* Container styles */
        .orders.container {
            width: 100%;
            max-width: 1200px;
            margin: 50px auto;
            padding: 0 15px;
            margin-bottom: 100px;
        }

        /* Table responsive styles */
        .orders .table-responsive {
            overflow-x: auto;
        }

        /* Table styles */
        .orders .table {
            width: 100%;
            border-collapse: collapse;
        }

        /* Table header styles */
       .orders .table thead {
            background-color: rgb(26, 183, 157);
            color: white;
            font-size: 14px;
            font-weight: bold;
        }

        /* Table row styles */
        .orders .table tbody tr {
            background-color: white;
            font-size: 15px;
            font-weight: bold;
        }

        /* Table cell styles */
        .orders .table td,
        .orders .table th {
            padding: 8px;
            border: 1px solid #ddd;
        }

        /* Table hover effect */
        .table-hover tbody tr:hover {
            background-color: #f5f5f5;
        }

        /* Success text color */
        .orders .text-success {
            color: green;
        }
        .order-link{
  			text-decoration: underline;
  			color: var(--main-color);
  		}
    </style>
</head>
<body>
	<%
	/* Checking the user credentials */
	String userName = (String) session.getAttribute("username");

	if (userName == null) {

		response.sendRedirect("login.jsp?message=Session Expired, Login Again!!");

	}

	OrderService dao = new OrderService();
	List<OrderDetails> orders = dao.getAllOrderDetails(userName);
	%>
	 <jsp:include page="header.jsp" />
    <div class="text-center order-text">Order Details</div>

    <!-- Start of Product Items List -->
    <div class="container orders">
        <div class="table-responsive">
            <table class="table table-hover table-sm">
                <thead>
                    <tr>
                        <th>Picture</th>
                        <th>ProductName</th>
                        <th>OrderId</th>
                        <th>Quantity</th>
                        <th>Price</th>
                        <th>Time</th>
                        <th>Status</th>
                    </tr>
                </thead>
                <tbody>
                    <%
					for (OrderDetails order : orders) {
					%>
                    <tr>
                        <td><img src="./ShowImage?pid=<%=order.getProductId()%>" style="width: 50px; height: 50px;"></td>
                        <td><%=order.getProdName()%></td>
                        <td><%=order.getOrderId()%></td>
                        <td><%=order.getQty()%></td>
                        <td><%=order.getAmount()%></td>
                        <td><%=order.getTime()%></td>
                        <td class="text-success"><%=order.getShipped() == 0 ? "ORDER_PLACED" : "ORDER_SHIPPED"%></td>
                    </tr>
                    <%
					}
					%>
                </tbody>
            </table>
        </div>
    </div>
    <%@ include file="footer.jsp"%>
</body>
</html>