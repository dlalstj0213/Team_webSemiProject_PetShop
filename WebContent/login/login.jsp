<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!doctype html>
<html lang="zxx">

<head>
<jsp:include page="../module/layout_top.jsp"/>
<script src="../set/js/trim.js"></script>
<script language="javascript"> 
    function check(){
		var emailval = f.email.value;
		emailval = trim(emailval);
		if(emailval.length == 0){
			alert("아이디를 입력주세요.");
			f.email.value = "";
			f.email.focus();
			return false;
		}else{
			pass = checkByteLen(emailval, 50);
			if(!pass){
				alert("아이디는 총 50자 이내로 입력 가능합니다.");
				f.email.focus();
				return false;
			}
		}
		
		var pwdval = f.pwd.value;
		pwdval = trim(pwdval);
		if(pwdval.length == 0){
			alert("비밀번호를 입력해주세요");
			f.pwd.value = "";
			f.pwd.focus();
			return false;
		}else{
			pass = checkByteLen(pwdval, 30);
			if(!pass){
				alert("비밀번호는 총 30자 이내로 입력 가능합니다.");
				f.pwd.focus();
				return false;
			}
		}

		f.submit();
	}

    function checkByteLen(str, size){
        var byteLen = getByteLen(str);
		if(byteLen <= size){
			return true;
		}else{
			return false;
		}
	}
	function getByteLen(str){
	   return str.replace(/[\0-\x7f]|([0-\u07ff]|(.))/g,"$&$1$2").length;
    }
	
	function enterCheck(elm){
		if(event.keyCode == 13){
			if(elm == f.email){
				f.pwd.focus();
			}else{
				check();
			}
		}
	}
</script> 
</head>
<body>
    <!-- breadcrumb part start-->
    <section class="breadcrumb_part">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb_iner">
                        <h2>login</h2>
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
                    <div class="login_part_text text-center">
                        <div class="login_part_text_iner">
                            <h2>New to our Shop?</h2>
                            <p>There are advances being made in science and technology
                                everyday, and a good example of this is the</p>
                            <a href="../register/register.do" class="btn_3">Create an Account</a>
                        </div>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6">
                    <div class="login_part_form">
                        <div class="login_part_form_iner">
                            <h3>Welcome Back ! <br>
                                Please Sign in now</h3>
                            <form name="f" class="row contact_form" action="login.do?m=check" method="post" novalidate="novalidate">
                                <div class="col-md-12 form-group p_star">
                                    <input type="text" class="form-control" id="email" name="email" value="" onkeydown="enterCheck(this)"
                                        placeholder="email">
                                </div>
                                <div class="col-md-12 form-group p_star">
                                    <input type="password" class="form-control" id="pwd" name="pwd" value="" onkeydown="enterCheck(this)"
                                        placeholder="Password">
                                </div>
                                <div class="col-md-12 form-group">
                                    <input type="button" value="LOG IN" class="btn_3" onclick="check()" />
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
</body>
    
</html>