<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
    
<!doctype html>
<html lang="zxx">
<head>
    <jsp:include page="../module/layout_top.jsp"/>
</head>
<body>

    <!-- breadcrumb part start-->
    <section class="breadcrumb_part">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                <c:if test="${result.resultType==1}">
                    <div class="breadcrumb_iner">
                        <h2>Payment Success</h2>
                    </div>
                </c:if>    
                <c:if test="${result.resultType==2}">
                    <div class="breadcrumb_iner">
                        <h2>Quantity Not Enough</h2>
                    </div>
                </c:if>    
                <c:if test="${result.resultType==3}">
                    <div class="breadcrumb_iner">
                        <h2>Payment System Error</h2>
                    </div>
                </c:if>    
                </div>
            </div>
        </div>
    </section>
    <!-- breadcrumb part end-->

  <!--================ confirmation part start =================-->
  <section class="confirmation_part section_padding">
    <div class="container">
      <div class="row">
        <div class="col-lg-12">
        <c:if test="${result.resultType==1}">
          <div class="confirmation_tittle">
            <span>Thank you. Your order has been received.</span>
          </div>
        </c:if>
        <c:if test="${result.resultType==2}">
          <div class="confirmation_tittle">
            <span>Sorry. The products you ordered don't have enough quantity now.</span>
          </div>
        </c:if>
        <c:if test="${result.resultType==3}">
          <div class="confirmation_tittle">
            <span>Sorry. Your order has not been received.</span>
          </div>
        </c:if>
        </div>
        <%--<div class="col-lg-6 col-lx-4">
          <div class="single_confirmation_details">
            <h4>order info</h4>
            <ul>
              <li>
                <p>order number</p><span>: 60235</span>
              </li>
              <li>
                <p>ordered date</p><span>: Oct 03, 2017</span>
              </li>
              <li>
                <p>total</p><span>: USD 2210</span>
              </li>
              <li>
                <p>payment method</p><span>: Check payments</span>
              </li>
            </ul>
          </div>
        </div>
        <div class="col-lg-6 col-lx-4">
          <div class="single_confirmation_details">
            <h4>Billing Detail</h4>
            <ul>
              <li>
                <p>Receiver</p><span>: 56/8</span>
              </li>
              <li>
                <p>Address</p><span>: 56/8</span>
              </li>
              <li>
                <p>post</p><span>: Los Angeles</span>
              </li>
            </ul>
          </div>
        </div>
      </div> --%>
        <div class="col-lg-12">
          <div class="order_details_iner">
            <h3>Order Details</h3>
            <table class="table table-borderless">
              <thead>
                <tr>
                  <th scope="col" colspan="2">Product</th>
                  <th scope="col">Quantity</th>
                  <th scope="col">Total</th>
                </tr>
              </thead>
              <tbody>
              <%-- orderDetail data start --%>
              <c:forEach items="${result.list}" var="order">
                <tr>
                  <th colspan="2"><span>${order.productName}</span></th>
                  <th>x${order.quantity}</th>
                  <th> <span>${order.totalPrice}₩</span></th>
                </tr>
              </c:forEach>
                <%-- orderDetail data end --%>
                <tr>
                  <th colspan="3">Subtotal</th>
                  <th> <span>${result.subTotal}₩</span></th>
                </tr>
                <tr>
                <c:if test="${result.resultType==1}">
                  <th colspan="3">shipping</th>
                  <th><span>flat rate: 2000₩</span></th>
                </c:if>
                </tr>
              </tbody>
              <tfoot>
                <tr>
                <c:if test="${result.resultType==1}">
                  <th scope="col" colspan="3">Quantity : ${result.totalQuantity}</th>
                  <th scope="col">Total : ${result.subTotal+2000}₩ </th>
				</c:if>
                </tr>
              </tfoot>
            </table>
          </div>
        </div>
    </div>
  </section>
  <!--================ confirmation part end =================-->

    <!--::footer_part start::-->
    <jsp:include page="../module/layout_last.jsp"/> 
    <!--::footer_part end::-->

    <!-- jquery plugins here-->
    <script src="js/jquery-1.12.1.min.js"></script>
    <!-- popper js -->
    <script src="js/popper.min.js"></script>
    <!-- bootstrap js -->
    <script src="js/bootstrap.min.js"></script>
    <!-- easing js -->
    <script src="js/jquery.magnific-popup.js"></script>
    <!-- swiper js -->
    <script src="js/swiper.min.js"></script>
    <!-- swiper js -->
    <script src="js/mixitup.min.js"></script>
    <!-- particles js -->
    <script src="js/owl.carousel.min.js"></script>
    <script src="js/jquery.nice-select.min.js"></script>
    <!-- slick js -->
    <script src="js/slick.min.js"></script>
    <script src="js/jquery.counterup.min.js"></script>
    <script src="js/waypoints.min.js"></script>
    <script src="js/contact.js"></script>
    <script src="js/jquery.ajaxchimp.min.js"></script>
    <script src="js/jquery.form.js"></script>
    <script src="js/jquery.validate.min.js"></script>
    <script src="js/mail-script.js"></script>
    <!-- custom js -->
    <script src="js/custom.js"></script>
</body>

</html>