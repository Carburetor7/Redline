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

        /* Text center class */
        .unshipped-text.text-center {
            text-align: center;
            color: rgb(26, 183, 157);
            font-size: 24px;
            font-weight: bold;
            font-family: Arial, sans-serif;
            position: relative;
            top: 40px;
        }
        
        .unshipped{
          margin: 50px auto;
          margin-bottom: 100px;
          font-family: Arial, sans-serif;
            
        }

        /* Container styles */
       	.unshipped .container-fluid {
            width: 100%;
            padding: 0 15px;
          
        }

        /* Table responsive styles */
        .unshipped .table-responsive {
            overflow-x: auto;
        }

        /* Table styles */
        .unshipped .table {
            width: 100%;
            border-collapse: collapse;
        }

        /* Table header styles */
        .unshipped .table thead {
            background-color:  rgb(26, 183, 157);
            color: white;
            font-size: 16px;
        }

        /* Table row styles */
        .unshipped .table tbody tr {
            background-color: white;
        }

        /* Table cell styles */
        .table td,
        .table th {
            padding: 20px;
            border: 1px solid #ddd;
        }

        /* Table hover effect */
        .unshipped .table-hover tbody tr:hover {
            background-color: #f5f5f5;
        }

        /* Button styles */
        .unshipped .btn {
            padding: 8px 16px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            text-decoration: none;
            color: white;
            font-size: 16px;
        }
        
        

        /* Button success styles */
        .unshipped .btn-success {
            background-color: #28a745;
        }
        
        .unshipped .btn-success:hover{
        	background-color: #0b8828;
        }
        
        .unshipped-link{
      	text-decoration: underline;
        color: rgb(18, 151, 129)
        }
        
        .unshipped .productID {
        text-decoration: none;
        color: rgb(26, 183, 157);
        }
        
        .unshipped .productID:hover{
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

		response.sendRedirect("loginFirst.jsp");

	}

	if (userName == null) {

		response.sendRedirect("loginFirst.jsp");
	}
	%>
	
	<jsp:include page="header.jsp" />
	<div class="text-center unshipped-text">UnShipped Orders</div>

    <!-- Start of UnShipped Orders List -->
    <div class="container-fluid unshipped">
        <div class="table-responsive">
            <table class="table table-hover table-sm">
                <thead>
                    <tr>
                        <th>TransactionId</th>
                        <th>ProductId</th>
                        <th>User Email Id</th>
                        <th>Address</th>
                        <th>Quantity</th>
                        <th>Status</th>
                        <th>Action</th>
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
						if (shipped == 0) {
							count++;
					%>
                    <tr>
                        <td><%=transId%></td>
                        <td><a class="productID" href="./updateProduct.jsp?prodid=<%=prodId%>"><%=prodId%></a></td>
                        <td><%=userId%></td>
                        <td><%=userAddr%></td>
                        <td><%=quantity%></td>
                        <td>READY_TO_SHIP</td>
                        <td><a
							href="ShipmentServlet?orderid=<%=order.getTransactionId()%>&amount=<%=order.getAmount()%>&userid=<%=userId%>&prodid=<%=order.getProductId()%>"
							class="btn btn-success">SHIP NOW</a></td>
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