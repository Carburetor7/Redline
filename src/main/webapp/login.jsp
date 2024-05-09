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
    <title>Sign In</title>
    <link rel="stylesheet" href="./css/style.css">
    <style>
    @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@200;300;400;500;600;700&display=swap');

.login{
  font-family: 'Poppins', sans-serif;
}
.login.container{
  max-width: 430px;
  width: 100%;
  background: #fff;
  border-radius: 7px;
  box-shadow: 0 5px 10px rgba(0,0,0,0.3);
  margin-top: 50px;
  margin-bottom: 100px;
}
.container .registration{
  display: none;
}

.container .form{
  padding: 2rem;
}
.form header{
  font-size: 2rem;
  font-weight: 500;
  text-align: center;
  margin-bottom: 1.5rem;
}
 .form input{
   height: 60px;
   width: 100%;
   padding: 0 15px;
   font-size: 17px;
   margin-bottom: 1.3rem;
   border: 1px solid #ddd;
   border-radius: 6px;
   outline: none;
 }
 .login .form input:focus{
   box-shadow: 0 1px 0 rgba(0,0,0,0.2);
 }
.login .form a{
  font-size: 16px;
  color: #009579;
  text-decoration: none;
}
.login .form a:hover{
  text-decoration: underline;
}
.login .form input.button{
  color: #fff;
  background: rgb(26, 183, 157);
  font-size: 1.2rem;
  font-weight: 500;
  letter-spacing: 1px;
  margin-top: 1.7rem;
  cursor: pointer;
  transition: 0.4s;
}
.login .form input.button:hover{
  background: rgb(18, 151, 129);
}

.login-link{
text-decoration: underline;
color: rgb(26, 183, 157);
}
    
    </style>
</head>
<body>
	<jsp:include page="header.jsp" />
	<%
	String message = request.getParameter("message");
	%>
	<div class="container login">
        <div class="login form">
            <header>Login</header>
            <%
			if (message != null && !message.isEmpty()) {
    			if (message.equals("valid")) {
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
            <form action="./LoginSrv" method="post">
                <input name="username" type="text" placeholder="Enter your email">
                <input name="password" type="password" placeholder="Enter your password">
                <input type="submit" class="button" value="Login">
            </form>
        </div>
    </div>
        
     <jsp:include page="footer.jsp" />
</body>
</html>