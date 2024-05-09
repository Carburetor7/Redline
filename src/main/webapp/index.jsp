<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page
	import="services.impl.*, services.*,models.*,java.util.*,javax.servlet.ServletOutputStream,java.io.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Origin Tech</title>
<style>

.blogs.container{
    max-width: 1200px;
    /* border: 1px solid red; */
    margin-inline: auto;

}

.blogs a{
    text-decoration: none;
    font-size: 20px;
    font-weight: 500;
    font-family: "Raleway", sans-serif;
    color: black;
}

.blogs a:hover{
    color: rgb(26, 183, 157);
    cursor: pointer;
}

.blogs li{
    list-style: none;
}

.section.blogs{
    padding-block: 5rem;
  }
  
  .blogs .container .section-title {
    text-align: center;
    margin-block-end: 2rem;
    width: 100%;
    color: #141517;
    text-align: center;
    font-family: "Raleway", sans-serif;
    font-size: 1.6rem;
    font-style: normal;
    font-weight: 400;
    line-height: 1.68rem;
  
    
  }
  .blogs .grid-list {
    display: grid;
    gap: 2rem;
  }
  .blogs .container .grid-list {
    grid-template-columns: repeat(3, 1fr);
  }
  
  
  .blogs .container .grid-list .blog-card {
    position: relative;
    background-color: #FFF;
    border-radius: 0.5rem;
    overflow: hidden;
    background: #FFF;
    box-shadow: 0px 20px 40px 0px rgba(28, 51, 84, 0.1);
  }
  
  .img-holder {
    aspect-ratio: var(--width) / var(--height);
    overflow: hidden;
  }
  
  .img-cover {
    width: 100%;
    height: 100%;
    -o-object-fit: cover;
    object-fit: cover;
  }
  
  
  a, img, span, button, i {
    display: block;
  }
  
  .blogs .container .grid-list .blog-card .card-content {
    padding: 2rem 1.5rem;
  }
  
 .blogs .h3 {
    font-size: 1.4rem;
  }
  
  .blogs :is(.h1, .h2, .h3, p) {
    font-family: "Raleway", sans-serif;
  }
  
  .blogs .btn {
    display: flex;
    justify-content: center;
    align-items: center;
    background-color: var(--main-color);
    color: #FFF;
    font-family: "Nunito Sans", sans-serif;
    font-size: 1rem;
    text-align: center;
    border-radius: 0.3rem;
    overflow: hidden;
    transition: 0.5s ease;
    line-height: 3rem;
    width: 8.1rem;
    padding: 0 1rem;
    gap: 1rem;
    font-weight: 400;
    border: 1px solid var(--main-color);
    cursor: pointer;
  }
  
  .blogs .add:hover{
    background-color: rgb(27, 129, 112)
  }
  
  .blogs .container .grid-list .blog-card .card-content .btn-blue {
    border-radius: 0.3rem;
    background-color: #2abbe8;
    border: 1px solid #2abbe8;
  }
  
  .blogs .container .grid-list .blog-card .card-content .btn-blue:hover{
    background-color: #118aaf;
  }
  
  .blogs .product-title{
    display: -webkit-box;
    -webkit-box-orient: vertical;
    -webkit-line-clamp: 1;
    overflow: hidden;
      text-decoration: none;
      font-size: 20px;
      font-weight: 600;
      font-family: "Raleway", sans-serif;
      color: black;
      margin-block-end: 10px;
  }
  
  .blogs .product-description{
    display: -webkit-box;
    -webkit-box-orient: vertical;
    -webkit-line-clamp: 2;
    overflow: hidden;
    text-decoration: none;
    font-size: 18px;
    font-weight: 400;
    font-family: "Nunito Sans", sans-serif;
    color: black;
    text-align: left;
    margin-block-end: 10px;
  }
  
  .blogs .price{
    text-decoration: none;
    font-size: 18px;
    font-weight: 700;
    font-family: "Nunito Sans", sans-serif;
    color: red;
    text-align: center;
    margin-block-end: 20px;
  }
  
  .blogs .product-btn-form{
    display: flex;
    justify-content: space-between;
    align-items: flex-end;
    /* gap: 20px; */
  }
</style>
</head>
<body>
	<%
	/* Checking the user credentials */
	String userName = (String) session.getAttribute("username");
	String userType = (String) session.getAttribute("usertype");

	boolean isValidUser = true;

	if (userType == null || userName == null || !userType.equals("customer")) {

		isValidUser = false;
	}

	ProductService prodDao = new ProductService();
	List<Product> products = new ArrayList<Product>();

	String search = request.getParameter("search");
	String type = request.getParameter("type");
	String message = "All Products";
	if (search != null) {
		products = prodDao.searchAllProducts(search);
		message = "Showing Results for '" + search + "'";
	} else if (type != null) {
		products = prodDao.getAllProductsByType(type);
		message = "Showing Results for '" + type + "'";
	} else {
		products = prodDao.getAllProducts();
	}
	if (products.isEmpty()) {
		message = "No items found for the search '" + (search != null ? search : type) + "'";
		products = prodDao.getAllProducts();
	}
	%>
	<jsp:include page="header.jsp" />
	
	<section class="section blogs">
        <div class="container">
            <h2 class="h2 section-title"><%=message%></h2>
            <ul class="grid-list">
            	<%
				for (Product product : products) {
				int cartQty = new CartService().getCartItemCount(userName, product.getProdId());
				%>
                <li>
                    <div class="blog-card">
                        <figure class="card-banner img-holder" style="--width: 410; --height: 260">
                            <img src="./ShowImage?pid=<%=product.getProdId()%>" width="410" height="260" loading="lazy" class="img-cover"
                                alt="blog" />
                        </figure>

                        <div class="card-content">
                            <h3 class="h3 product-title">
                                <%=product.getProdName()%>
                            </h3>
                            <%
								String description = product.getProdInfo();
								description = description.substring(0, Math.min(description.length(), 100));
							%>
                            <p class="product-description"><%=description%></p>
                            <h4 class="price">RS <%=product.getProdPrice()%></h4>
                            <form method="post" class="product-btn-form">
                            	<%
									if (cartQty == 0) {
								%>
                                <button type="submit" formaction="./AddtoCart?uid=<%=userName%>&pid=<%=product.getProdId()%>&pqty=1" class="btn add"><span class="span">Add to
                                        Cart</span></button>

                                <button type="submit" formaction="./AddtoCart?uid=<%=userName%>&pid=<%=product.getProdId()%>&pqty=1" class="btn btn-blue buy"><span class="span">Buy
                                        Now</span></button>
                                <%
									} else {
								%>
								 <button type="submit" formaction="./AddtoCart?uid=<%=userName%>&pid=<%=product.getProdId()%>&pqty=0" class="btn add"><span class="span">Remove From
                                        Cart</span></button>

                                <button type="submit" formaction="cartDetails.jsp" class="btn btn-blue buy"><span class="span">Checkout</span></button>
								<%
									}
								%>
                            </form>
                        </div>
                    </div>
                </li>
                <%
				}
				%>
            </ul>
        </div>
    </section>
	
	<jsp:include page="footer.jsp" />
	
</body>
</html>