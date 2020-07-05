<%@page contentType="text/html;charset=utf-8" 
import="main.register.model.RegisterSet"
%>

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
                    <div class="breadcrumb_iner">
                        <h2>WELCOME!</h2>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- breadcrumb part end-->

    <!--================login_part Area =================-->
    <section class="login_part section_padding ">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-lg-6 col-md-6">
                    <img src="../img/banner.jpg"/>
                </div>
                <div class="col-lg-6 col-md-6">
                    <div class="login_part_form">
                        <div class="login_part_form_iner">
                            <h3>회원가입<br>
                                </h3>
                            <form class="row contact_form" action="register.do?m=check" method="post" novalidate="novalidate">
                                <div class="col-md-12 form-group p_star">
                                    <input type="text" class="form-control" id="name" name="email" value=""
                                        placeholder="E-mail">
                                </div>
                                <div class="col-md-12 form-group p_star">
                                    <input type="text" class="form-control" id="NAME" name="name" value=""
                                        placeholder="Name">
                                </div>
								<div class="col-md-12 form-group p_star">
                                    <input type="password" class="form-control" id="PWD" name="pwd" value=""
                                        placeholder="PWD">
                                </div>
								<div class="col-md-12 form-group p_star">
                                    <input type="text" class="form-control" id="POST" name="post" value=""
                                        placeholder="POST">
                                </div>
								<div class="col-md-12 form-group p_star">
                                    <input type="text" class="form-control" id="ADDRESS" name="address" value=""
                                        placeholder="ADDRESS">
                                </div>
								<div class="col-md-12 form-group p_star">
                                    <input type="text" class="form-control" id="PHONE" name="phone" value=""
                                        placeholder="PHONE">
                                </div>
								

                                <div class="col-md-12 form-group">
                                    <div class="creat_account d-flex align-items-center">
                                        <input type="checkbox" id="f-option" name="selector">
                                        <label for="f-option">Remember me</label>
                                    </div>
                                    <button type="submit" value="submit" class="btn_3">
                                        					가입완료
                                    </button>
                                    <a class="lost_pass" href="#">forget password?</a>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!--================login_part end =================-->

    <!--::footer_part start::-->
	<jsp:include page="../module/layout_last.jsp"/>
    <!--::footer_part end::-->
</body>
    
</html>