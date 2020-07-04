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
                        <h2>Check Out</h2>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- breadcrumb part end-->

  <!--================Checkout Area =================-->
  <section class="checkout_area section_padding">
    <div class="container">
      
      <div class="billing_details">
         <form class="row contact_form" action="order.do?m=buy&order=${order.resultType}" method="post" novalidate="novalidate">
        <div class="row">
          <div class="col-lg-8">
            <h2>Billing Details</h2>
              <div class="col-md-6 form-group p_star">
               Name* :  
                <input type="text" class="form-control" id="name" name="name" value="${loginUser.name}" readonly/>
              </div>
              <div class="col-md-6 form-group">
               Email* : 
                <input type="text" class="form-control" id="email" name="email" value="${loginUser.email}" readonly/>
              </div>
              <div class="col-md-6 form-group p_star">
              Post* :
                <input type="text" class="form-control" id="post" name="post" value="${loginUser.post}" placeholder="Post"/>
              </div>
              <div class="col-md-6 form-group p_star">
              Phone* :
                <input type="text" class="form-control" id="phone" name="phone" value="${loginUser.phone}" placeholder="Phone"/>
              </div>
              <div class="col-md-12 form-group p_star">
              Address* : 
                <input type="text" class="form-control" id="address" name="address" value="${loginUser.address}" placeholder="Address"/>
              </div>

              <div class="col-md-12 form-group">
                <div class="creat_account">
                Memo :
                </div>
                <textarea class="form-control" name="memo" id="message" rows="1"
                  placeholder="Order Memo"></textarea>
              </div>
            
          </div>
          <div class="col-lg-4">
            <div class="order_box">
              <h2>Your Order</h2>
              <ul class="list">
                <li>
                  <a href="#">Product
                    <span>Total</span>
                  </a>
                </li>
                <c:forEach items="${order.list}" var="order">
                <li>
                  <a href="#">${order.name}
                    <span class="middle">x ${order.quantity}</span>
                    <span class="last">${order.totalPrice}₩</span>
                  </a>
                </li>
                </c:forEach>
              </ul>
              <ul class="list list_2">
                <li>
                  <a href="#">Subtotal
                    <span>${order.subTotal}₩</span>
                  </a>
                </li>
                <li>
                  <a href="#">Shipping
                    <span>2000₩</span>
                  </a>
                </li>
                <li>
                  <a href="#">Total
                    <span>${order.subTotal+2000}₩</span>
                  </a>
                </li>
              </ul>
              <div class="payment_item">
              <div class="creat_account">
                <input type="checkbox" id="f-option4" name="selector" />
                <label for="f-option4">I’ve read and accept the </label>
                <a href="#">terms & conditions*</a>
              </div>
                <p>
                  Please check all details and your order.
                 We don't take full responsibility for your typing mistake.
                </p>
                <br/>
              </div>
              <div>
              <input class="genric-btn primary-border e-large" type="submit" value="Proceed to Payment">
              </div>
            </div>
          </div>
        </div>
              </form>
      </div>
    </div>
  </section>
  <!--================End Checkout Area =================-->

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