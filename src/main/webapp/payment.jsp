<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page
	import="services.impl.*, services.*,models.*,java.util.*,javax.servlet.ServletOutputStream,java.io.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Payment</title>
<style>
        
        .payment{
        	font-family: Arial, sans-serif;
        }

        /* Container styles */
        .payment.container {
            max-width: 1200px;
            margin: 50px auto;
            padding: 15px;
            
        }

        /* Row styles */
        .payment .row {
            margin-top: 5px;
            margin-left: 2px;
            margin-right: 2px;
            display: flex;
            flex-wrap: wrap;
            align-items: center;
    		gap: 30px;
    		margin-bottom: 20px;
        }

        /* Form styles */
        .payment form {
            width: 100%;
            max-width: 600px;
            margin: 0 auto;
            border-radius: 10px;
            padding: 10px;
            padding-left: 20px;
            background: #fff;
    		border-radius: 7px;
    		box-shadow: 0 5px 10px rgba(0, 0, 0, 0.3)
        }
        

        /* Form group styles */
        .payment .form-group {
            align-self: flex-end;
        }

        /* Image styles */
        .payment img {
            height: 100px;
        }

        /* Heading styles */
        .payment h2 {
            color: rgb(26, 183, 157);
            margin-bottom: 20px;
        }

        /* Label styles */
        .payment label {
            font-weight: bold;
        }

        /* Input styles */
        .payment input[type="text"],
        .payment input[type="number"] {
            width: 100%;
            padding: 8px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
            margin-top: 5px;
        }

        /* Button styles */
        .payment button {
            width: 100%;
            padding: 10px;
            border: none;
            border-radius: 5px;
            background-color: rgb(26, 183, 157);
            color: white;
            font-weight: bold;
            cursor: pointer;
        }

        /* Button hover effect */
        .payment button:hover {
            background-color: rgb(18, 151, 129);
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

	String sAmount = request.getParameter("amount");

	double amount = 0;

	if (sAmount != null) {
		amount = Double.parseDouble(sAmount);
	}
	%>
	<jsp:include page="header.jsp" />
	<div class="container payment">
        <div class="row">
            <form action="./OrderServlet" method="post">
                <div class="form-group text-center">
                    <h2>Credit Card Payment</h2>
                </div>
                <div class="row">
                    <div class="form-group ">
                        <label for="cardholder">Name of Card Holder</label>
                        <input type="text" placeholder="Enter Card Holder Name" name="cardholder" id="cardholder" required>
                    </div>
                </div>
                <div class="row">
                    <div class="form-group col-md-12">
                        <label for="cardnumber">Enter Credit Card Number</label>
                        <input type="number" placeholder="4242-4242-4242-4242" name="cardnumber" id="cardnumber" required>
                    </div>
                </div>
                <div class="row">
                    <div class="form-group ">
                        <label for="expmonth">Expiry Month</label>
                        <input type="number" placeholder="MM" name="expmonth" id="expmonth" size="2" max="12" min="00" required>
                    </div>
                    <div class="form-group ">
                        <label for="expyear">Expiry Year</label>
                        <input type="number" placeholder="YYYY" name="expyear" id="expyear" size="4" required>
                    </div>
                </div>
                <div class="row text-center">
                    <div class="form-group col-md-6">
                        <label for="cvv">Enter CVV</label>
                        <input type="number" placeholder="123" name="cvv" id="cvv" size="3" required>
                        <input type="hidden" name="amount" value="<%=amount%>">
                    </div>
                    <div class="form-group ">
                        <button type="submit">Pay: Rs <%=amount%></button>
                    </div>
                </div>
            </form>
        </div>
    </div>
    <%@ include file="footer.jsp"%>

</body>
</html>