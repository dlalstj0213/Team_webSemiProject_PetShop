<%@page contentType="text/html;charset=utf-8"
	import="java.util.*, web.domain.Product"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>

<html lang="zxx">
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="../module/layout_top.jsp" />
	
	<section class="breadcrumb_part">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="breadcrumb_iner">
						<h2>product list</h2>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- breadcrumb part end-->

	<!-- product list part start-->
	<section class="product_list section_padding">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="product_list">
						<div class="row">
						
							<c:if test="${empty listResult.list}">
								<div class="col-lg-12 col-sm-12">
									<div class="single_product_item"> 
										<h3>현재 판매하고 있는 상품이 없네요</h3>
										<a href="product.do?m=detail">상세페이지</a>
									</div>	
								</div>

							</c:if>
							
							<c:forEach items="${listResult.list}" var="p">
									<div class="col-lg-4 col-sm-4">
										<div class="single_product_item">
											<img src="img/product/${p.name}.jpg" alt="#"
												class="img-fluid">
											<h3>
												<a href="product.do?m=detail&product_code=${p.product_code}">${p.name}</a>
											</h3>
												<p>${p.price} 원</p>
										</div>
									</div>
							</c:forEach>
							
						</div>
<%-- 						<c:forEach> --%>
							<div class="load_more_btn text-center">
								<a href="#" class="btn_3">Load More</a>
							</div>
<%-- 						</c:forEach> --%>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- product list part end-->

	<!-- client review part here -->
	<!--     <section class="client_review"> -->
	<!--         <div class="container"> -->
	<!--             <div class="row justify-content-center"> -->
	<!--                 <div class="col-lg-8"> -->
	<!--                     <div class="client_review_slider owl-carousel"> -->
	<!--                         <div class="single_client_review"> -->
	<!--                             <div class="client_img"> -->
	<!--                                 <img src="img/client.png" alt="#"> -->
	<!--                             </div> -->
	<!--                             <p>"Working in conjunction with humanitarian aid agencies, we have supported programmes to help alleviate human suffering.</p> -->
	<!--                             <h5>- Micky Mouse</h5> -->
	<!--                         </div> -->
	<!--                         <div class="single_client_review"> -->
	<!--                             <div class="client_img"> -->
	<!--                                 <img src="img/client_1.png" alt="#"> -->
	<!--                             </div> -->
	<!--                             <p>"Working in conjunction with humanitarian aid agencies, we have supported programmes to help alleviate human suffering.</p> -->
	<!--                             <h5>- Micky Mouse</h5> -->
	<!--                         </div> -->
	<!--                         <div class="single_client_review"> -->
	<!--                             <div class="client_img"> -->
	<!--                                 <img src="img/client_2.png" alt="#"> -->
	<!--                             </div> -->
	<!--                             <p>"Working in conjunction with humanitarian aid agencies, we have supported programmes to help alleviate human suffering.</p> -->
	<!--                             <h5>- Micky Mouse</h5> -->
	<!--                         </div> -->
	<!--                     </div> -->
	<!--                 </div> -->
	<!--             </div> -->
	<!--         </div> -->
	<!--     </section> -->
	<!-- client review part end -->

	<!-- feature part here -->
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
	<!-- feature part end -->

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
	<!-- subscribe part end -->


	<jsp:include page="../module/layout_last.jsp" />

</body>
</html>