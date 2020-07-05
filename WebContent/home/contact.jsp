<%@page contentType="text/html;charset=utf-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<jsp:include page="../module/layout_top.jsp"/>
</head>

<body>
	<!-- breadcrumb part start-->
    <section class="breadcrumb_part">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb_iner">
                        <h2>contact</h2>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- breadcrumb part end-->

  <!-- ================ contact section start ================= -->
  <section class="contact-section section_padding">
    <div class="container">
     
      <div class="row">
        <div class="col-12">
          <h2 class="contact-title">Let out ForPet introduce..</h2>
          <h4 class="contact-title">Our Location...</h4>
        </div>
        <div class="col-12">
        </div>
	  </div>


	<!-- kakao map start -->
	  <%-- <div class="d-none d-sm-block mb-5 pb-4">--%>
        <div id="map" style="height: 480px;"></div>
        <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=28356b828deacc25b57ebd1565d8fd25"></script>
	<!-- kakao map end -->
		<br/>
		<div class="row">
			<div class="col-lg-12">
			  <div class="media contact-info">
				<span class="contact-info__icon"><i class="ti-home"></i></span>
				<div class="media-body">
				  <h3>Seoul, Korea.</h3>
				  <p>Mapo-gu, Baekbeom-ro 23</p>
				</div>
			  </div>
			  <div class="media contact-info">
				<span class="contact-info__icon"><i class="ti-tablet"></i></span>
				<div class="media-body">
				  <h3>(02) 707 1480</h3>
				  <p>Mon to Fri 9am to 6pm</p>
				</div>
			  </div>
			  <div class="media contact-info">
				<span class="contact-info__icon"><i class="ti-email"></i></span>
				<div class="media-body">
				  <h3>forpet@gmail.com</h3>
				  <p>If you have any questions, please send an email here!</p>
				</div>
			  </div>
			</div>
			</div>
			</div>
  </section>
  <!-- ================ contact section end ================= -->

	
<jsp:include page="../module/layout_last.jsp"/>
<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = { 
        center: new kakao.maps.LatLng(37.552529, 126.937705), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };

var map = new kakao.maps.Map(mapContainer, mapOption);

// 마커가 표시될 위치입니다 
var markerPosition  = new kakao.maps.LatLng(37.552529, 126.937705); 

// 마커를 생성합니다
var marker = new kakao.maps.Marker({
    position: markerPosition
});

// 마커가 지도 위에 표시되도록 설정합니다
marker.setMap(map);

var iwContent = '<div style="padding:5px;">포펫 ForPet<br><a href="https://map.kakao.com/link/map/Hello World!,33.450701,126.570667" style="color:blue" target="_blank">큰지도보기</a> <a href="https://map.kakao.com/link/to/Hello World!,33.450701,126.570667" style="color:blue" target="_blank">길찾기</a></div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
    iwPosition = new kakao.maps.LatLng(37.552529, 126.937705); //인포윈도우 표시 위치입니다

// 인포윈도우를 생성합니다
var infowindow = new kakao.maps.InfoWindow({
    position : iwPosition, 
    content : iwContent 
});
  
// 마커 위에 인포윈도우를 표시합니다. 두번째 파라미터인 marker를 넣어주지 않으면 지도 위에 표시됩니다
infowindow.open(map, marker); 
</script>
</body>
</html>