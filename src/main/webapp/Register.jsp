<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=League+Spartan:wght@400;500;600;700;800&family=Poppins:wght@400;500&display=swap" rel="stylesheet">
    <title>Register</title>
     <link rel="stylesheet" href="./css/style.css">
    <style>
 

@import url("https://fonts.googleapis.com/css2?family=Poppins:wght@200;300;400;500;600;700&display=swap");

.register{
font-family: "Poppins", sans-serif;
}

.register.container {
  position: relative;
  max-width: 700px;
  width: 100%;
  background: #fff;
  padding: 25px;
  border-radius: 8px;
  box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
  margin-top: 50px;
  margin-bottom: 100px;
}
.register.container header {
  font-size: 1.5rem;
  color: #333;
  font-weight: 500;
  text-align: center;
}
.register.container .form {
  margin-top: 30px;
}
.register .form .input-box {
  width: 100%;
  margin-top: 20px;
}
.register .input-box label {
  color: #333;
}
.register .form :where(.input-box input, .select-box) {
  position: relative;
  height: 50px;
  width: 100%;
  outline: none;
  font-size: 1rem;
  color: #707070;
  margin-top: 8px;
  border: 1px solid #ddd;
  border-radius: 6px;
  padding: 0 15px;
}
.register .input-box input:focus {
  box-shadow: 0 1px 0 rgba(0, 0, 0, 0.1);
}
.register .form .column {
  display: flex;
  column-gap: 15px;
}
.register .form .gender-box {
  margin-top: 20px;
}
.register .gender-box h3 {
  color: #333;
  font-size: 1rem;
  font-weight: 400;
  margin-bottom: 8px;
}
.register .form :where(.gender-option, .gender) {
  display: flex;
  align-items: center;
  column-gap: 50px;
  flex-wrap: wrap;
}
.register .form .gender {
  column-gap: 5px;
}
.register .gender input {
  accent-color: rgb(130, 106, 251);
}
.register .form :where(.gender input, .gender label) {
  cursor: pointer;
}
.register .gender label {
  color: #707070;
}
.register .address :where(input, .select-box) {
  margin-top: 15px;
}
.register .select-box select {
  height: 100%;
  width: 100%;
  outline: none;
  border: none;
  color: #707070;
  font-size: 1rem;
}
.register .form button {
  height: 55px;
  width: 100%;
  color: #fff;
  font-size: 1rem;
  font-weight: 400;
  margin-top: 30px;
  border: none;
  cursor: pointer;
  transition: all 0.2s ease;
  background: rgb(26, 183, 157);
}
.register .form button:hover {
  background: rgb(18, 151, 129);
}

.register-link{
text-decoration: underline;
color: rgb(26, 183, 157);
}
/*Responsive*/
@media screen and (max-width: 500px) {
 .register .form .column {
    flex-wrap: wrap;
  }
  .register .form :where(.gender-option, .gender) {
    row-gap: 15px;
  }
}
    </style>
</head>
<body>
	<%@ include file="header.jsp"%>
	<%
	String message = request.getParameter("message");
	%>
	<section class="container register">
        <header>Registration Form</header>
		<%
			if (message != null && !message.isEmpty()) {
    			if (message.equals("User Registered Successfully!")) {
		%>	
        			<p class="success-message"><%= message %></p>
		<%
    			} else {
		%>
        			<p class="error-message"><%= message %></p>
		<%
    			}
			}
		%>
        <form action="./RegisterServlet" method="post" class="form">
          <div class="input-box">
            <label>Full Name</label>
            <input name="username" type="text" placeholder="Enter full name" required />
          </div>
          <div class="input-box">
            <label>Email Address</label>
            <input name="email" type="text" placeholder="Enter email address" required />
          </div>
          <div class="column">
            <div class="input-box">
              <label>Phone Number</label>
              <input name="mobile" type="number" placeholder="Enter phone number" required />
            </div>
            <div class="input-box">
              <label>Pin Code</label>
              <input name="pincode" type="number" placeholder="Enter pin code" required />
            </div>
          </div>
         
          <div class="input-box address">
            <label>Address</label>
            <input  name="address" type="text" placeholder="Enter address" required />
          </div>
          <div class="column">
            <div class="input-box">
              <label>Password</label>
              <input name="password" type="password" placeholder="Enter password" required />
            </div>
            <div class="input-box">
              <label>Confirm Password</label>
              <input name="confirmPassword" type="password" placeholder="Enter password" required />
            </div>
          </div>
          <button type="submit">Register</button>
        </form>
      </section>
      <%@ include file="footer.jsp"%>
</body>
</html>