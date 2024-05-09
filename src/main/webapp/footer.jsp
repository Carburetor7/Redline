<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">



<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Footer</title>
    <script src="https://kit.fontawesome.com/1165876da6.js" crossorigin="anonymous"></script>
    <style>
footer{
    background: #343434;
    padding-top: 50px;
    font-family: Arial, Helvetica, sans-serif;
    font-size: 16px;
    color: white;
}
footer .container{
    max-width: 1200px;
    margin-inline: auto;
    display: flex;
    justify-content: center;
}
.footer-content{
    width: 33.3%;
}
.footer-content h3{
    font-size: 24px;
    margin-bottom: 15px;
    text-align: center;
}
.footer-content p{
    margin: auto;
    padding: 7px;
}
.footer-content ul{
    text-align: center;
}
.footer-content .list{
    padding: 0;
}
.footer-content .list li{
    width: auto;
    text-align: center;
    list-style-type:none;
    padding: 7px;
    position: relative;
}
.footer-content .list li::before{
    content: '';
    position: absolute;
    transform: translate(-50%,-50%);
    left: 50%;
    top: 100%;
    width: 0;
    height: 2px;
    background: rgb(26, 183, 157);
    transition-duration: .5s;
}
.footer-content .list li:hover::before{
    width: 70px;
}
.footer-content .social-icons{
    text-align: center;
    padding: 0;
}
.footer-content .social-icons li{
    display: inline-block;
    text-align: center;
    padding: 5px;
}
.footer-content .social-icons i{
    color: white;
    font-size: 25px;
}
footer a{
    text-decoration: none;
    color: white;
}
footer a:hover{
    color: rgb(26, 183, 157);
}
footer .social-icons i:hover{
    color: rgb(26, 183, 157);
}
footer .bottom-bar{
    background: rgb(26, 183, 157);
    text-align: center;
    padding: 10px 0;
    margin-top: 50px;
}
footer .bottom-bar p{
    color: #343434;
    margin: 0;
    font-size: 16px;
    padding: 7px;
}
</style>
</head>

<body>
    <footer>
        <div class="container">
            <div class="footer-content">
                <h3>Contact Us</h3>
                <p>Email:origin.tech@gmail.com</p>
                <p>Phone:+121 56556 565556</p>
                <p>Address:Your Address 123 street</p>
            </div>
            <div class="footer-content">
                <h3>Quick Links</h3>
                 <ul class="list">
                    <li><a href="">Product</a></li>
                    <li><a href="">About</a></li>
                    <li><a href="">Login</a></li>
                    <li><a href="">Register</a></li>
                    <li><a href="">Contact</a></li>
                 </ul>
            </div>
            <div class="footer-content">
                <h3>Follow Us</h3>
                <ul class="social-icons">
                 <li><a href=""><i class="fab fa-facebook"></i></a></li>
                 <li><a href=""><i class="fab fa-twitter"></i></a></li>
                 <li><a href=""><i class="fab fa-instagram"></i></a></li>
                 <li><a href=""><i class="fab fa-linkedin"></i></a></li>
                </ul>
                </div>
        </div>
        <div class="bottom-bar">
            <p>&copy; 2024 Origin Tech . All rights reserved</p>
        </div>
    </footer>
</body>

</html>