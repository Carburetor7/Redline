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
    <link rel="stylesheet" href="/css/style.css">
   <style>
   
/* -------main section-------- */
.logo{
    position: relative;
    top: 5px;
    right: 5px;
    background-color: var(--white);
    display: inline-block;
    width: 35px;
    height: 35px;
    padding: 0;
}
.first{
    background-color: var(--white);
    height: 450px;
    width: 550px;
    position: relative;
    left: 27rem;
    top: 5rem;
    text-align: center;
    border: 0;
    border-radius:20px;
}
.first_h1{
    background-color: white;
    padding-top: 15px;
    font-family: var(--ff-league_spartan);
    font-size: 20px;
    font-weight: 600;
}
.first_p{
    display:block;
    background-color: var(--white);
    padding-top: 30px;
    margin-bottom: 60px;
    margin-left: 15px;
    font-family: var(--ff-poppins);
    font-size: 25px;
}
.inputs{
    height: 20px;
    width:360px ;
    border: 0;
    border-radius: var(--radius-5);
    padding: 12px 15px;
    margin-bottom: 30px;

}
button {
    color: #ffffff;
    background-color: var(--light-green-2);
    font-size: 20px;
    border: 0px solid #2d63c8;
    border-radius: 5px;
    padding: 10px 168px;
    cursor: pointer;
}

p{
    font-family: var(--ff-league_spartan);
}

.register{
    background-color: var(--white);
    margin-top: 20px;
}
#register{
    color: var(--light-green-2);
    background-color: var(--white);
}
        button {
        color: #ffffff;
        background-color: var(--light-green-2);
        font-size: 20px;
        border: 0px solid #2d63c8;
        border-radius: 5px;
        padding: 10px 158px;
        cursor: pointer;
}
    </style>
</head>
<body>
    <main>
        <section class="first" style="position: relative; top:35px;height: 750px;">
            <div style="position: relative; top: 15px; background-color: white;">
                <div style="display: inline-flex; justify-content: space-around;background-color: white;">
                    <img class="logo" src="logo.png" alt="logo">
                    <h1 class="first_h1">Origin Tech</h1>
                </div>
                <p class="first_p" style="margin-left: 0;">Register a &#160;Origin Tech Account</p>  
            </div>
            <form action="" style="background-color: white; padding: 0 35px 20px;">
                    <input class="inputs" type="text" placeholder="Full Name">
                    <input class="inputs" type="number" placeholder="Phone Number">
                    <input class="inputs" id="email" type="text" placeholder="E-mail">
                    <input class="inputs" type="text" placeholder="Address">
                    <input class="inputs" type="number" placeholder="Pin Code">
                    <input class="inputs" type="password" placeholder="Password">
                    <input class="inputs" type="password" placeholder="Confirm Password">
                    <button type="button" name="myButton">Register</button>
                    <p class="register">Existing Customer? <a id="register" href="#">Sign In</a></p>
            </form>
        </section>
    </main>
</body>
</html>