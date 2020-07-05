	<%@page contentType="text/html;charset=utf-8"
	import="java.util.*, web.domain.Product"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="zxx">
<head>
	<jsp:include page="../module/layout_top.jsp" />
</head>
<body>
	 <!-- breadcrumb part start-->
	    <section class="breadcrumb_part single_product_breadcrumb">
	        <div class="container">
	            <div class="row">
	                <div class="col-lg-12">
	                    <div class="breadcrumb_iner">
	                    </div>
	                </div>
	            </div>
	        </div>
	    </section>
	    <!-- breadcrumb part end-->
	
	  <!--================Single Product Area =================-->
	  <div class="product_image_area">
	    <div class="container">
	      <div class="row justify-content-center">
	        <div class="col-lg-12">
	          <div class="product_img_slide owl-carousel">
	          
	            <div class="single_product_img">
	              <img src="../img/product/${pro.name}.jpg" alt="#" class="img-fluid">
	            </div>
	            
	            <div class="single_product_img">
	              <img src="../img/product/${pro.name}_2.jpg" alt="#" class="img-fluid">
	            </div>
	            
	            <div class="single_product_img">
	              <img src="../img/product/${pro.name}_3.jpg" alt="#" class="img-fluid">
	            </div>
	            
	          </div>
	        </div>
	        <div class="col-lg-8">
	          <div class="single_product_text text-center">
	          	    <c:if test="${pro.quantity==0}">
	                	<p> *품절* </p>
	                	<p> 현재 남아있는 재고가 없습니다. </p>
	                </c:if>
	            <h3>${pro.name}</h3>
	            <p>${pro.info}</p>
         <form class="card_area" action="../cart/cart.do?m=insert&code=${pro.product_code}" method="post" novalidate="novalidate">
	            <div class="card_area">
	                <div class="product_count_area">
	                    <p>Quantity</p>
	                    <div class="product_count d-inline-block">
	                        <span class="product_count_item inumber-decrement"> <i class="ti-minus"></i></span>
	                        <input class="product_count_item input-number" name="quantity" type="text" value="1" min="1" max="${pro.quantity}">
	                        <span class="product_count_item number-increment"> <i class="ti-plus"></i></span>
	                    </div>
	                    <p>${pro.price} won</p>
	                </div>
	                <c:if test="${pro.quantity ne 0}">
	              <div class="add_to_cart">
	                  <input class="genric-btn primary-border e-large" type="submit" value="Add to Cart">
	              </div>
	              </c:if>
	            </div>
	            </form>
	          </div>
	        </div>
	      </div>
	    </div>
	  </div>
	  <!--================End Single Product Area =================-->
	<jsp:include page="../module/layout_last.jsp" />
</body>
</html>