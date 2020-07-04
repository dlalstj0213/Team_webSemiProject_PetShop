<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
    
<!doctype html>
<html lang="zxx">

<body>
 <jsp:include page="../module/layout_top.jsp"/>

    <!-- breadcrumb part start-->
    <section class="breadcrumb_part">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb_iner">
                        <h2>Cart List</h2>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- breadcrumb part end-->

  <!--================Cart Area =================-->
  <section class="cart_area section_padding">
    <div class="container">
      <div class="cart_inner">
        <div class="table-responsive">
          <table class="table">
            <thead>
              <tr>
                <th scope="col">Product</th>
                <th scope="col">Price</th>
                <th scope="col">Quantity</th>
                <th scope="col">Total</th>
                <th scope="col"></th>
              </tr>
            </thead>
            <tbody>
            <c:if test="${empty cart.list}">
            	<tr>
            		<td align="center" colspan="5">
            		No data sources
            		</td>
            	</tr>
            </c:if>
            <!-- 반복문 start -->
            <c:forEach items="${cart.list}" var="cart">
          
              <tr>
                <td>
                  <div class="media">
                    <div class="d-flex">
                    <c:if test="${cart.productCode eq product.product1}">
                      <img src="https://cdn.imweb.me/thumbnail/20200331/5e3ea8481c55f.jpg" alt="" />
                      </c:if>
                    <c:if test="${cart.productCode eq product.product2}">
                      <img src="https://cdn.imweb.me/thumbnail/20200327/7de2ac5fb750e.jpg" alt="" />
                      </c:if>
                    <c:if test="${cart.productCode eq product.product3}">
                      <img src="https://cdn.imweb.me/thumbnail/20200207/ddd58c6a1d720.jpg" alt="" />
                      </c:if>
                    <c:if test="${cart.productCode eq product.product4}">
                      <img src="https://cdn.imweb.me/thumbnail/20200207/c941ab86f722e.jpg" alt="" />
                      </c:if>
                    <c:if test="${cart.productCode eq product.product5}">
                      <img src="https://cdn.imweb.me/thumbnail/20200207/43993f783d7fb.jpg" alt="" />
                      </c:if>
                    </div>
                    <div class="media-body">
                      <p>${cart.name}</p>
                    </div>
                  </div>
                </td>
                <td>
                  <h5>${cart.price}₩</h5>
                </td>
                <td>
                  <!--<div class="product_count">-->
                 
                  <!--
                    <input type="text" value="1" min="0" max="10" title="Quantity:"
                      class="input-text qty input-number" />
                    <button
                      class="increase input-number-increment items-count" type="button">
                      <i class="ti-angle-up"></i>
                    </button>
                    <button
                      class="reduced input-number-decrement items-count" type="button">
                      <i class="ti-angle-down"></i>
                    </button>-->
                    <!--
                    <span class="input-number-decrement"> <i class="ti-minus"></i></span>
                    <input class="input-number" type="text" value="1" min="0" max="10">
                    <span class="input-number-increment"> <i class="ti-plus"></i></span>
                  </div>-->
             	<h5>${cart.quantity}</h5>
                </td>
                <td>
                  <h5>${cart.totalPrice}₩</h5>
                </td>
	    	            <td>
                	<div class="button-group-area mt-10">
                		<a href="../order/order.do?m=check&code=${cart.cartCode}" class="genric-btn info-border circle">Buy</a>
                		<a href="cart.do?m=delete&code=${cart.cartCode}" class="genric-btn danger-border circle">Delete</a>
                	</div>
    	    	        </td>
                </c:forEach>
              <!-- 반복문 end -->
              
                <tr>
                <td></td>
                <td></td>
                <td>
                  <h5>Subtotal</h5>
                </td>
                <td>
                  <h5>: ${cart.subTotal}₩</h5>
                </td>
                <td></td>
                <td></td>
              </tr>
              <tr>
              		<td align="center" colspan="5">
            		<%-- 이전 페이지 블럭 버튼 --%>
            		<nav aria-label="...">
  					<ul class="pagination">	
						<c:choose>
						<c:when test="${cart.page.currentRange==1}">
							<li class="page-item disabled">
							  <a class="page-link" href="cart.do?cp=${cart.page.startPage-1}">&lt;&lt;</a>
							</li>
						</c:when>
						<c:otherwise>
							<li class="page-item">
							  <a class="page-link" href="cart.do?cp=${cart.page.startPage-1}">&lt;&lt;</a>
							</li>
						</c:otherwise>
						</c:choose>
						<%-- --%>
						
						<%-- 이전 페이지 버튼 --%>
						<c:choose>
							<c:when test="${cart.page.currentPage==1}">
								<li class="page-item disabled">
								  <a class="page-link" href="cart.do?cp=${cart.page.prevPage}">Previous</a>
								</li>		
							</c:when>
							<c:otherwise>
								<li class="page-item">
								  <a class="page-link" href="cart.do?cp=${cart.page.prevPage}">Previous</a>
								</li>		
							</c:otherwise>
						</c:choose>
						<%-- --%>
						
					  <c:forEach begin="${cart.page.startPage}" end="${cart.page.endPage}" var="pageNum">
						<c:choose>
						<c:when test="${pageNum==cart.page.currentPage}">
							<li class="page-item active" aria-current="page">
						  		<a class="page-link" href="cart.do?cp=${pageNum}">${pageNum}<span class="sr-only">(current)</span></a>
							</li>
						</c:when>
						<c:otherwise>
							<li class="page-item"><a class="page-link" href="cart.do?cp=${pageNum}">${pageNum}</a></li>
						</c:otherwise>
						</c:choose>
					</c:forEach>
						
						<%-- 다음 페이지 버튼 --%>
						<c:choose>
							<c:when test="${cart.page.currentPage==cart.page.pageCount}">
								<li class="page-item disabled">
								  <a class="page-link" href="#">Next</a>
								</li>
							</c:when>
						<c:when test="${cart.page.rangeCount==0}">
								<li class="page-item disabled">
								  <a class="page-link" href="#">Next</a>
								</li>
						</c:when>
							<c:otherwise>
								<li class="page-item">
								  <a class="page-link" href="cart.do?cp=${cart.page.nextPage}">Next</a>
								</li>
							</c:otherwise>
						</c:choose>
						<%-- --%>
						
						<%-- 다음 페이지 블럭 버튼 --%>
						<c:choose>
						<c:when test="${cart.page.currentRange==cart.page.rangeCount}">
							<li class="page-item disabled">
							  <a class="page-link" href="cart.do?cp=${cart.page.endPage+1}">&gt;&gt;</a>
							</li>
						</c:when>
						<c:when test="${cart.page.rangeCount==0}">
							<li class="page-item disabled">
							  <a class="page-link" href="cart.do?cp=${cart.page.endPage+1}">&gt;&gt;</a>
							</li>
						</c:when>
						<c:otherwise>
							<li class="page-item">
							  <a class="page-link" href="cart.do?cp=${cart.page.endPage+1}">&gt;&gt;</a>
							</li>
						</c:otherwise>
						</c:choose>
						<%-- --%>
		                </ul>
					</nav>
            		</td>
              </tr>
            </tbody>
          </table>
          <div class="checkout_btn_inner float-right">
            <a class="btn_1" href="../order/order.do?m=checkAll">Buy All</a>
        	<a class="btn_1" href="cart.do?m=deleteAll">Delete All</a>
            <a class="btn_1" href="../product/product.jsp">Continue Shopping</a>
          </div>
        </div>
      </div>
      </div>
  </section>
  <!--================End Cart Area =================-->
    <!--::footer_part start::-->
    <!--::footer_part end::-->

    <!-- jquery plugins here-->
    <script src="../set/js/jquery-1.12.1.min.js"></script>
    <!-- popper js -->
    <script src="../set/js/popper.min.js"></script>
    <!-- bootstrap js -->
    <script src="../set/js/bootstrap.min.js"></script>
    <!-- easing js -->
    <script src="../set/js/jquery.magnific-popup.js"></script>
    <!-- swiper js -->
    <script src="../set/js/swiper.min.js"></script>
    <!-- swiper js -->
    <script src="../set/js/mixitup.min.js"></script>
    <!-- particles js -->
    <script src="../set/js/owl.carousel.min.js"></script>
    <script src="../set/js/jquery.nice-select.min.js"></script>
    <!-- slick js -->
    <script src="../set/js/slick.min.js"></script>
    <script src="../set/js/jquery.counterup.min.js"></script>
    <script src="../set/js/waypoints.min.js"></script>
    <script src="../set/js/contact.js"></script>
    <script src="../set/js/jquery.ajaxchimp.min.js"></script>
    <script src="../set/js/jquery.form.js"></script>
    <script src="../set/js/jquery.validate.min.js"></script>
    <script src="../set/js/mail-script.js"></script>
    <!-- custom js -->
    <script src="../set/js/custom.js"></script>
    
    <jsp:include page="../module/layout_last.jsp"/>
</body>

</html>