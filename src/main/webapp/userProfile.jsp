<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ page
	import="services.impl.*, services.*,models.*,java.util.*,javax.servlet.ServletOutputStream,java.io.*"%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>User Profile</title>
    <script src="https://kit.fontawesome.com/b99e675b6e.js"></script>
    <style>
        @import url('https://fonts.googleapis.com/css?family=Josefin+Sans&display=swap');
        .profile.container{
        	max-width: 750px;
        	width: 100%;
        	margin: 0 auto;
        	margin-top: 50px;
        	margin-bottom: 100px;
        }
        
        .wrapper {
            display: flex;
            box-shadow: 0 1px 20px 0 rgba(69, 90, 100, .08);
            list-style: none;
            font-family: 'Josefin Sans', sans-serif;
            
        }

        .wrapper .left {
            width: 35%;
            background: rgb(26, 183, 157);
            padding: 30px 25px;
            border-top-left-radius: 5px;
            border-bottom-left-radius: 5px;
            text-align: center;
            color: #fff;
        }

        .wrapper .left img {
            border-radius: 5px;
            margin-bottom: 10px;
        }

        .wrapper .left h4 {
            margin-bottom: 10px;
        }

        .wrapper .left p {
            font-size: 12px;
        }

        .wrapper .right {
            width: 65%;
            background: #fff;
            padding: 30px 25px;
            border-top-right-radius: 5px;
            border-bottom-right-radius: 5px;
        }

        .wrapper .right .info,
        .wrapper .right .projects {
            margin-bottom: 25px;
        }

        .wrapper .right .info h3,
        .wrapper .right .projects h3 {
            margin-bottom: 15px;
            padding-bottom: 5px;
            border-bottom: 1px solid #e0e0e0;
            color: #353c4e;
            text-transform: uppercase;
            letter-spacing: 5px;
        }

        .wrapper .right .info_data,
        .wrapper .right .projects_data {
            display: flex;
            justify-content: space-between;
        }

        .wrapper .right .info_data .data,
        .wrapper .right .projects_data .data {
            width: 45%;
        }

        .wrapper .right .info_data .data h4,
        .wrapper .right .projects_data .data h4 {
            color: #353c4e;
            margin-bottom: 5px;
        }

        .wrapper .right .info_data .data p,
        .wrapper .right .projects_data .data p {
            font-size: 13px;
            margin-bottom: 10px;
            color: #919aa3;
            text-align: left;
        }

        .wrapper .social_media ul {
            display: flex;
        }

        .wrapper .social_media ul li {
            width: 45px;
            height: 45px;
            background: linear-gradient(to right, #01a9ac, #01dbdf);
            margin-right: 10px;
            border-radius: 5px;
            text-align: center;
            line-height: 45px;
        }

        .wrapper .social_media ul li a {
            color: #fff;
            display: block;
            font-size: 18px;
        }

    .wrapper .btn {
    display: flex;
    justify-content: center;
    align-items: center;
    background-color: rgb(26, 183, 157);
    color: #FFF;
    font-family: "Nunito Sans", sans-serif;
    font-size: 0.7rem;
    text-align: center;
    border-radius: 0.3rem;
    overflow: hidden;
    transition: 0.5s ease;
    line-height: 2rem;
    /*width: 8.1rem;*/
    padding: 0 0.6rem;
    gap: 1rem;
    font-weight: 400;
    border: 1px solid var(--main-color);
    cursor: pointer;
  }
   .wrapper .btn-blue {
    border-radius: 0.3rem;
    background-color: rgb(26, 183, 157);
    border: 1px solid rgb(26, 183, 157);
  }
  .wrapper .btn-blue:hover{
    background-color: #118aaf;
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

	UserService dao = new UserService();
	User user = dao.getUserDetails(userName);
	if (user == null)
		user = new User("Test User", 98765498765L, "test@gmail.com", "ABC colony, Patna, bihar", 87659, "lksdjf");
	%>
	<%@ include file="header.jsp"%>
	<div class="container profile">
		 <div class="wrapper">
        <div class="left">
            <img src="./img/profile.jpg" alt="user" width="100">
            <h4><%=user.getName()%></h4>
        </div>
        <div class="right">
            <div class="info">
                <h3>User Profile</h3>
                <div class="info_data">
                    <div class="data">
                        <h4>Full Name</h4>
                        <p><%=user.getName()%></p>
                    </div>
                    <div class="data">
                        <h4>Email</h4>
                        <p><%=user.getEmail()%></p>
                    </div>
                </div>
                <div class="info_data">
                    <div class="data">
                        <h4>Phone</h4>
                        <p><%=user.getMobile()%></p>
                    </div>
                    <div class="data">
                        <h4>Address</h4>
                        <p><%=user.getAddress()%></p>
                    </div>
                </div>
                <div class="info_data">
                    <div class="data">
                        <h4>Pin code</h4>
                        <p><%=user.getPinCode()%></p>
                    </div>
                </div>
                <form method="post">
                    <button type="submit" formaction="updateProfile.jsp?userid=<%=user.getEmail()%>" class="btn btn-blue buy"><span class="span">Update Profile</span></button>
                </form>
        </div>
     </div>
	</div>
	</div>
   <%@ include file="footer.jsp"%>
</body>

</html>