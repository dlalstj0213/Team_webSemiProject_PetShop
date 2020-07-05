<%@page contentType="text/html;charset=utf-8"
	import="java.util.*, web.domain.Product"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<!DOCTYPE html>
<html>
<head>
 <jsp:include page="../module/layout_top.jsp"/>
</head>
<body>
 
 <section class="banner_part">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-md-5">
                    <div class="banner_text">
                        <div class="banner_text_iner">
                            <h1>Show your<br/>
                                FORPET</h1>
                            <p>당신의 반려견에게 소중한 공간을 제공하세요</p>
                            <a href="../product/product.do?m=page&cp=1" class="btn_1">shop now</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="banner_img">
<!--         	<iframe src="https://www.youtube.com/embed/3UeR-OPG1JA?autoplay=1&amp;loop=1;playlist=3UeR-OPG1JA" frameborder="0" allowfullscreen></iframe> -->
            <img src="../img/banner.jpg" alt="#" class="img-fluid">
            <img src="../img/banner_pattern.png " alt="#" class="pattern_img img-fluid">
        </div>
    </section>
    <!-- banner part start-->
    
    <!-- product list start-->
    <section class="single_product_list">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                	<c:forEach items="${list}" var="l">
	                	<div class="single_product_iner">
	                        <div class="row align-items-center justify-content-between">
	                            <div class="col-lg-6 col-sm-6">
	                                <div class="single_product_img">
	                                    <img src="../img/product/${l.name}.jpg" class="img-fluid" alt="#">
	                                    <img src="../img/product_overlay.png" alt="#" class="product_overlay img-fluid">
	                                </div>
	                            </div>
	                            <div class="col-lg-5 col-sm-6">
	                                <div class="single_product_content">
	                                    <h5>Started from ${l.price} won</h5>
	                                    <h2>${l.name}</h2>
	                                    <a href="../product/product.do?m=detail&product_code=${l.product_code}" class="btn_3">Explore Now</a>
	                                </div>
	                            </div>
	                        </div>
	                    </div>
                    </c:forEach>
                </div>
            </div>
        </div>
    </section>
    <!-- product list end-->


    <!-- trending item start-->
    <section class="trending_items">
        <div class="container">
        <div class="row">
				<div class="col-md-12">
					<div class="product_list">
						<div class="row">
							
							<c:if test="${empty list}">
								<div class="col-lg-12 col-sm-12">
									<div class="single_product_item"> 
										<h3>현재 판매하고 있는 상품이 없네요</h3>
<!-- 										<a href="product.do?m=detail">상세페이지</a> -->
									</div>	
								</div>
							</c:if>
							
							<c:forEach items="${list}" var="l">
									<div class="col-lg-4 col-sm-4">
										<div class="single_product_item">
											<img src="../img/product/${l.name}.jpg" alt="#"
												class="img-fluid">
											<h3>
<%-- 												<a href="product.do?m=detail&product_code=${l.product_code}"> --%>
												${l.name}
<!-- 												</a> -->
											</h3>
												<p>${l.price} won</p>
										</div>
									</div>
							</c:forEach>						
							
						</div>
						<div class="load_more_btn text-center">
							<a href="../product/product.do?m=page&cp=1" class="btn_3">View More</a>
						</div>
					</div>
				</div>
			</div>
        </div>
    </section>
    <!-- trending item end-->

    <!-- client review part here -->
    <section class="client_review">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-lg-8">
                    <div class="client_review_slider owl-carousel">
                        <div class="single_client_review">
                            <div class="client_img">
                                <img src="../img/client.png" alt="#">
                            </div>
                            <p>랄랄라</p>
                            <h5>이민서</h5>
                        </div>
                        <div class="single_client_review">
                            <div class="client_img">
                                <img src="../img/client_1.png" alt="#">
                            </div>
                            <p>아무 생각이 없습니다. 그냥 놀고 싶습니다.</p>
                            <h5>김유민</h5>
                        </div>
                        <div class="single_client_review">
                            <div class="client_img">
                                <img src="../img/client_2.png" alt="#">
                            </div>
                            <p>랄랄라</p>
                            <h5>조건희</h5>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- client review part end -->


<!--     feature part here -->
<!--     <section class="feature_part section_padding"> -->
<!--         <div class="container"> -->
<!--             <div class="row justify-content-between"> -->
<!--                 <div class="col-lg-6"> -->
<!--                     <div class="feature_part_tittle"> -->
<!--                         <h3>Credibly innovate granular -->
<!--                         internal or organic sources -->
<!--                         whereas standards.</h3> -->
<!--                     </div> -->
<!--                 </div> -->
<!--                 <div class="col-lg-5"> -->
<!--                     <div class="feature_part_content"> -->
<!--                         <p>Seamlessly empower fully researched growth strategies and interoperable internal or “organic” sources. Credibly innovate granular internal or “organic” sources whereas high standards in web-readiness.</p> -->
<!--                     </div> -->
<!--                 </div> -->
<!--             </div> -->
<!--             <div class="row justify-content-center"> -->
<!--                 <div class="col-lg-3 col-sm-6"> -->
<!--                     <div class="single_feature_part"> -->
<!--                         <img src="img/icon/feature_icon_1.svg" alt="#"> -->
<!--                         <h4>Credit Card Support</h4> -->
<!--                     </div> -->
<!--                 </div> -->
<!--                 <div class="col-lg-3 col-sm-6"> -->
<!--                     <div class="single_feature_part"> -->
<!--                         <img src="img/icon/feature_icon_2.svg" alt="#"> -->
<!--                         <h4>Online Order</h4> -->
<!--                     </div> -->
<!--                 </div> -->
<!--                 <div class="col-lg-3 col-sm-6"> -->
<!--                     <div class="single_feature_part"> -->
<!--                         <img src="img/icon/feature_icon_3.svg" alt="#"> -->
<!--                         <h4>Free Delivery</h4> -->
<!--                     </div> -->
<!--                 </div> -->
<!--                 <div class="col-lg-3 col-sm-6"> -->
<!--                     <div class="single_feature_part"> -->
<!--                         <img src="img/icon/feature_icon_4.svg" alt="#"> -->
<!--                         <h4>Product with Gift</h4> -->
<!--                     </div> -->
<!--                 </div> -->
<!--             </div> -->
<!--         </div> -->
<!--     </section> -->
<!--     feature part end -->

    <!-- subscribe part here -->
<!--     <section class="subscribe_part section_padding"> -->
<!--         <div class="container"> -->
<!--             <div class="row justify-content-center"> -->
<!--                 <div class="col-lg-8"> -->
<!--                     <div class="subscribe_part_content"> -->
<!--                         <h2>Get promotions & updates!</h2> -->
<!--                         <p>Seamlessly empower fully researched growth strategies and interoperable internal or “organic” sources credibly innovate granular internal .</p> -->
<!--                         <div class="subscribe_form"> -->
<!--                             <input type="email" placeholder="Enter your mail"> -->
<!--                             <a href="#" class="btn_1">Subscribe</a> -->
<!--                         </div> -->
<!--                     </div> -->
<!--                 </div> -->
<!--             </div> -->
<!--         </div> -->
<!--     </section> -->
<!--     subscribe part end -->

 	<jsp:include page="../module/layout_last.jsp"/>
</body>
</html>