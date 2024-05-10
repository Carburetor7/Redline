<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page
	import="services.impl.*, services.*,models.*,java.util.*,javax.servlet.ServletOutputStream,java.io.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cart Details</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
.text-center {
    text-align: center;
    color: green;
    font-size: 24px;
    font-weight: bold;
}

.cart{
margin-top: 10px;
margin-bottom: 100px;
}

.cart-heading {
    margin-top: 50px;
}

.cart .product-table {
    width: 100%;
    border-collapse: collapse;
}

.cart .product-table th,
.cart .product-table td {
    border: 1px solid #ccc;
    padding: 8px;
}

.cart .product-table th {
    background-color: rgb(26, 183, 157);
    color: white;
    font-size: 16px;
    font-weight: bold;
}

.cart .product-table tbody tr:nth-child(even) {
    background-color: white;
}

.cart .product-image {
    width: 50px;
    height: 50px;
}

.cart .quantity-input,
.cart .update-button {
    max-width: 70px;
}

.cart .update-button{
	background-color: #2abbe8;
	padding: 5px 10px;
    border-radius: 10px;
    border: 1px solid #2abbe8;
    color: white;
    cursor: pointer;
}

.cart .update-button:hover {
	background-color: #05a7da;
}

.cart .add-link,
.cart .remove-link {
    color: blue;
}

.cart .total-row {
    background-color: grey;
    color: white;
}

.cart .total-label {
    text-align: center;
}

.cart .action-row td {
    text-align: center;
}

.cart .cancel-button {
    background-color: black;
    color: white;
    padding: 10px 15px;
    border-radius: 10px;
    border: 1px solid black;
    
}

.cart .cancel-button:hover {
	background-color: #503333;
	cursor: pointer;
}

.cart .pay-button {
    background-color: rgb(26, 183, 157);
    color: white;
    padding: 10px 15px;
    border-radius: 10px;
    border: 1px solid rgb(26, 183, 157);
}

.cart .pay-button:hover{
	background-color: rgb(18, 151, 129);
	cursor: pointer;
}

  .cart-link{
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

	String addS = request.getParameter("add");
	if (addS != null) {

		int add = Integer.parseInt(addS);
		String uid = request.getParameter("uid");
		String pid = request.getParameter("pid");
		int avail = Integer.parseInt(request.getParameter("avail"));
		int cartQty = Integer.parseInt(request.getParameter("qty"));
		CartService cart = new CartService();

		if (add == 1) {
			//Add Product into the cart
			cartQty += 1;
			if (cartQty <= avail) {
		cart.addProductToCart(uid, pid, 1);
			} else {
		response.sendRedirect("./AddtoCart?pid=" + pid + "&pqty=" + cartQty);
			}
		} else if (add == 0) {
			//Remove Product from the cart
			cart.removeProductFromCart(uid, pid);
		}
	}
	%>
	<jsp:include page="header.jsp" />
	<div class="text-center cart-heading">Cart Items</div>

<!-- Start of Product Items List -->
<div class="container cart">

    <table class="product-table">
        <thead>
            <tr>
                <th>Picture</th>
                <th>Products</th>
                <th>Price</th>
                <th>Quantity</th>
                <th>Add</th>
                <th>Remove</th>
                <th>Amount</th>
            </tr>
        </thead>
        <tbody>
            <% CartService cart = new CartService(); List<Cart> cartItems = new ArrayList<Cart>(); cartItems = cart.getAllCartItems(userName); double totAmount = 0; for (Cart item : cartItems) { String prodId = item.getProdId(); int prodQuantity = item.getQuantity(); Product product = new ProductService().getProductDetails(prodId); double currAmount = product.getProdPrice() * prodQuantity; totAmount += currAmount; if (prodQuantity > 0) { %>
            <tr>
                <td><img src="./ShowImage?pid=<%=product.getProdId()%>" class="product-image"></td>
                <td><%=product.getProdName()%></td>
                <td><%=product.getProdPrice()%></td>
                <td>
                    <form method="post" action="./UpdateToCart">
                        <input type="number" name="pqty" value="<%=prodQuantity%>" class="quantity-input" min="0">
                        <input type="hidden" name="pid" value="<%=product.getProdId()%>">
                        <input type="submit" name="Update" value="Update" class="update-button">
                    </form>
                </td>
                <td><a href="cartDetails.jsp?add=1&uid=<%=userName%>&pid=<%=product.getProdId()%>&avail=<%=product.getProdQuantity()%>&qty=<%=prodQuantity%>" class="add-link"><i class="fa fa-plus"></i></a></td>
                <td><a href="cartDetails.jsp?add=0&uid=<%=userName%>&pid=<%=product.getProdId()%>&avail=<%=product.getProdQuantity()%>&qty=<%=prodQuantity%>" class="remove-link"><i class="fa fa-minus"></i></a></td>
                <td><%=currAmount%></td>
            </tr>
            <% } } %>
            <tr class="total-row">
                <td colspan="6" class="total-label">Total Amount to Pay (in Rupees)</td>
                <td><%=totAmount%></td>
            </tr>
            <% if (totAmount != 0) { %>
            <tr class="action-row">
                <td colspan="4"></td>
                <td><form method="post">
                        <button formaction="userHome.jsp" class="cancel-button">Cancel</button>
                    </form></td>
                <td colspan="2" align="center"><form method="post">
                        <button formaction="payment.jsp?amount=<%=totAmount%>" class="pay-button">Pay Now</button>
                    </form></td>
            </tr>
            <% } %>
        </tbody>
    </table>
	</div>
	
	<%@ include file="footer.jsp"%>
	
</body>
</html>