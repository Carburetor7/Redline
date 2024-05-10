<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="services.impl.*, services.*"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css" />

    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
        href="https://fonts.googleapis.com/css2?family=Nunito+Sans:ital,opsz,wght@0,6..12,200..1000;1,6..12,200..1000&family=Raleway:ital,wght@0,100..900;1,100..900&display=swap"
        rel="stylesheet" />
    <style>
    	*{
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

:root{
    --ff1: "Raleway", sans-serif;
    --main-color: rgb(26, 183, 157);
}

.container{
    max-width: 1200px;
    /* border: 1px solid red; */
    margin-inline: auto;

}

a{
    text-decoration: none;
    font-size: 20px;
    font-weight: 500;
    font-family: "Raleway", sans-serif;
    color: black;
}

a:hover{
    color: rgb(26, 183, 157);
    cursor: pointer;
}



.navbar img{
    width: 60px;
}

.logo-part{
    display: flex;
    font-family: "Raleway", sans-serif;
    align-items: center;
}

.logo-part h2{
    font-family: "Raleway", sans-serif;
    color: black;
    font-size: 20px;
    font-weight: 600;
}

.logo-part h2:hover{
    color: var(--main-color);
    cursor: pointer;
}

#header{
    /* position: absolute;
    top: 0;
    left: 0; */
    background-color: rgb(247, 247, 247);
    width: 100%;
    box-shadow: 0 6px 15px 0 rgba(0, 0, 0, 0.05);

}

.navbar{
    padding-block: 10px;
    display: flex;
    justify-content: space-between;
    align-items: center;
}

li{
    list-style: none;
}

.navbar .nav-list{
    display: flex;
    gap: 30px;
}


/* Dropdown menu */

.category{
    position: relative;
}
.dropdown-menu {
    display: none;
}
  .category:hover .dropdown-menu {
    display: block;
    position: absolute;
    left: 0;
    top: 100%;
    background-color: rgb(223, 223, 223);
  }
  .category:hover .dropdown-menu ul {
    display: block;
    margin: 10px;
  }
  .category:hover .dropdown-menu ul li {
    width: 170px;
    padding: 10px;
  }


  /* Search section */
  .search{
    /* border: 1px solid red; */
    width: 100%;
    background: var(--main-color);
    padding-block: 30px;
  }

 .content h1, p{
    text-align: center;
    color: white;
    font-family: var(--ff1);
    line-height: 40px;
 }

 .content{
    margin-bottom: 50px;
 }

  .search .container{
    display: grid;
    height: 100%;
    place-items: center;
   
  }
  ::selection{
    color: #fff;
    background: var(--main-color);
  }
  .search-box{
    position: relative;
    height: 60px;
    width: 60px;
    border-radius: 50%;
    box-shadow: 5px 5px 30px rgba(0,0,0,.2);
    transition: all 0.5s cubic-bezier(0.68, -0.55, 0.265, 1.55);
  }
  .search-box.active{
    width: 350px;
  }
  .search-box input{
    width: 100%;
    height: 100%;
    border: none;
    border-radius: 50px;
    background: #fff;
    outline: none;
    padding: 0 60px 0 20px;
    font-size: 18px;
    opacity: 0;
    transition: all 0.5s cubic-bezier(0.68, -0.55, 0.265, 1.55);
  }
  .search-box input.active{
    opacity: 1;
  }
  .search-box input::placeholder{
    color: #a6a6a6;
  }
  .search-box .search-icon{
    position: absolute;
    right: 0px;
    top: 50%;
    transform: translateY(-50%);
    height: 60px;
    width: 60px;
    background: #fff;
    border-radius: 50%;
    text-align: center;
    line-height: 60px;
    font-size: 22px;
    color: var(--main-color);
    cursor: pointer;
    z-index: 1;
    transition: all 0.5s cubic-bezier(0.68, -0.55, 0.265, 1.55);
  }
  .search-box .search-icon.active{
    right: 5px;
    height: 50px;
    line-height: 50px;
    width: 50px;
    font-size: 20px;
    background: var(--main-color);
    color: #fff;
    transform: translateY(-50%) rotate(360deg);
    border: none;
  }
  .search-box .cancel-icon{
    position: absolute;
    right: 20px;
    top: 50%;
    transform: translateY(-50%);
    font-size: 25px;
    color: #fff;
    cursor: pointer;
    transition: all 0.5s 0.2s cubic-bezier(0.68, -0.55, 0.265, 1.55);
  }
  .search-box .cancel-icon.active{
    right: -40px;
    transform: translateY(-50%) rotate(360deg);
  }
  .search-box .search-data{
    text-align: center;
    padding-top: 7px;
    color: #fff;
    font-size: 18px;
    word-wrap: break-word;
  }
  .search-box .search-data.active{
    display: none;
  }

.cart {
  position: relative;
  color: black;
  font-size: 24px;
}

.cart .btn-badge {
  display: block;
  position: absolute;
  top: -10px;
  right: -10px;
  background-color: var(--main-color);
  color: white;
  font-family: var(--ff1);
  font-size: 16px;
  min-width: 20px;
  height: 20px;
  border-radius: 50%;
}

/* User Product show */
.centered {
    color: white;
    font-weight: bold;
    margin-top: 10px;
    margin-bottom: 5px;
    text-align: center;
}
   </style>
</head>

<body>
	<%
	/* Checking the user credentials */
	String userType = (String) session.getAttribute("usertype");
	if (userType == null) { //LOGGED OUT
	%>
    <header id="header">
        <div class="container">
            <nav class="navbar">
                <div class="logo-part">
                    <a href="index.jsp">
                        <img src="./img/logo.png" alt="logo">
                    </a>
                    <h2>Origin Tech</h2>
                </div>


                <ul class="nav-list">
                    <li><a href="login.jsp" class="login-link">Login</a></li>
                    <li><a href="Register.jsp" class="register-link">Register</a></li>
                    <li><a href="contact.jsp">About US</a></li>
                    <li><a href="index.jsp"">Product</a></li>
                    <li class="category"><a href="#">Category <i class="fas fa-caret-down"></i></a>
                        <div class="dropdown-menu">
                            <ul>
                                <li><a href="index.jsp?type=macbook">Macbook</a></li>
                                <li><a href="index.jsp?type=acer">Acer</a></li>
                                <li><a href="index.jsp?type=dell">Dell</a></li>
                                <li><a href="index.jsp?type=hp">HP</a></li>
                            </ul>
                        </div>
                    </li>
                </ul>
            </nav>
        </div>
    </header>
    <%
	} else if ("customer".equalsIgnoreCase(userType)) { //CUSTOMER HEADER

	int notf = new CartService().getCartCount((String) session.getAttribute("username"));
	%>
	<header id="header">
        <div class="container">
            <nav class="navbar">
                <div class="logo-part">
                    <a href="">
                        <img src="./img/logo.png" alt="logo">
                    </a>
                    <h2>Origin Tech</h2>
                </div>


                <ul class="nav-list">
                 	<li><a href="userHome.jsp" class="product-link">Products</a></li>
                    <li class="category"><a href="#">Category <i class="fas fa-caret-down"></i></a>
                        <div class="dropdown-menu">
                            <ul>
                                <li><a href="userHome.jsp?type=macbook">Macbook</a></li>
                                <li><a href="userHome.jsp?type=acer">Acer</a></li>
                                <li><a href="userHome.jsp?type=dell">Dell</a></li>
                                <li><a href="userHome.jsp?type=hp">HP</a></li>
                            </ul>
                        </div>
                    </li>
                    <%
					if (notf == 0) {
					%>
                    <li><a href="cartDetails.jsp" class="cart cart-link">
                        <i class="fa-solid fa-cart-shopping"></i>
                        <span class="btn-badge">&#8203 0</span>
                    </a></li>
                    <%
					} else {
					%>
					 <li><a href="cartDetails.jsp" class="cart cart-link">
                        <i class="fa-solid fa-cart-shopping"></i>
                        <span class="btn-badge">&#8203 <%=notf%></span>
                    </a></li>
                    <%
					}
					%>
                    <li><a href="orderDetails.jsp" class="order-link">Orders</a></li>
                    <li><a href="userProfile.jsp">Profile</a></li>
                    <li><a href="contact.jsp">About US</a></li>
                    <li><a href="./LogoutSrv">Logout</a></li>
                    
                </ul>
            </nav>
        </div>
    </header>
    <%
	} else { //ADMIN HEADER
	%>
	 <header id="header">
        <div class="container">
            <nav class="navbar">
                <div class="logo-part">
                    <a href="">
                        <img src="./img/logo.png" alt="logo">
                    </a>
                    <h2>Origin Tech</h2>
                </div>


                <ul class="nav-list">
                    <li><a href="adminViewProduct.jsp" class="product-link">Product</a></li>
                    <li class="category"><a href="#">Category <i class="fas fa-caret-down"></i></a>
                        <div class="dropdown-menu">
                            <ul>
                                <li><a href="adminViewProduct.jsp?type=macbook">Macbook</a></li>
                                <li><a href="adminViewProduct.jsp?type=acer">Acer</a></li>
                                <li><a href="adminViewProduct.jsp?type=dell">Dell</a></li>
                                <li><a href="adminViewProduct.jsp?type=hp">HP</a></li>
                            </ul>
                        </div>
                    </li>                    
                    <li><a href="adminStock.jsp" class="stock-link">Stock</a></li>
                    <li><a href="shippedItems.jsp" class="shipped-link">Shipped</a></li>
                    <li><a href="unShippedItems.jsp" class="unshipped-link">Orders</a></li>

                    <li class="category"><a href="#">Update Items <i class="fas fa-caret-down"></i></a>
                        <div class="dropdown-menu">
                            <ul>
                                <li><a href="addProduct.jsp" class="add-product-link">Add Product</a></li>
                                <li><a href="removeProduct.jsp">Delete Product</a></li>
                                <li><a href="updateProductById.jsp">Update Product</a></li>
                            </ul>
                        </div>
                    </li>

                    <li><a href="./LogoutSrv">Logout</a></li>

                    
                </ul>
            </nav>
        </div>
    </header>
    <%
	}
	%>
    <div class="search">
        <div class="content">
            <h1>Origin Tech</h1>
            <p>Where everything Tech Product Available</p>
        </div>
       
        <div class="container">
         <form action="index.jsp" method="get">
            <div class="search-box active">
           
            	<input class="active" type="text" name="search" placeholder="Type to search..">
                <button type="submit" class="search-icon active">
                    <i class="fas fa-search"></i>
                </button>
                
            </div>
           </form>
           <p id="message" class="centered"></p>
        </div>

    </div>
    

    <script src="./js/script.js"></script>
</body>

</html>