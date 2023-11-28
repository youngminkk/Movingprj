<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html data-bs-theme="dark">
<head>
    <meta charset='utf-8'>
    <meta http-equiv='X-UA-Compatible' content='IE=edge'>
    <title>회원가입</title>
    <meta name='viewport' content='width=device-width, initial-scale=1'>
    <link rel="stylesheet" href="/css/style.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js"
        integrity="sha512-v2CJ7UaYy4JwqLDIrZUI/4hqeoQieOmAZNXBeQyjo21dadnwR+8ZaIJVT8EE2iyI61OV8e6M8PP2/4hpQINQ/g=="
        crossorigin="anonymous" referrerpolicy="no-referrer"></script>
</head>

<body>
    <!-- 헤더 -->
    <jsp:include page="../includes/header.jsp"></jsp:include>

    <section class="bg-image">
        <div class="mask d-flex align-items-center h-100 gradient-custom-3">
            <div class="container h-100">
                <div class="row d-flex justify-content-center align-items-center h-100">
                    <div class="col-12 col-md-9 col-lg-7 col-xl-6">
                        <div class="card border-0">
                            <div class="card-body p-5">
	                            <div class="text-center my-3">
					                <img src="../image/movinlogo.png" alt="logo" width="300" height="130">
				                </div>
                                <h1 class="text-uppercase text-center mb-5">Sing Up</h1>
                                
                                <form method="post" id="signupForm">
                                
                                	<%-- 아이디 --%>
                                	<div id="useridFeedback"></div>
									<div class="col input-group border border-light rounded-3 mb-3">
	                                   <div class="form-floating">
	                                       <input type="text" class="form-control border-0"
	                                           id="userid" name="userid" placeholder="아이디" pattern="^[a-zA-Z][a-zA-Z0-9]{3,9}$" required>
	                                       <label for="userid" class="fst-italic"><i class="fas fa-user"></i> 아이디(4~10자리 영문, 숫자)</label>
	                                   </div>
                                 		<div class="col-2 text-center p-1">
		                                     <button class="btn btn-sm border-secondary rounded-4 mt-2"
		                                         type="button" id="check_idBtn">중복확인</button>
                                 		</div>
                                    </div>
                                    
                                    <%-- 비밀번호 --%>
                                    <div class="invalid-feedback" id="pwdFeedback">8~15자리의 영문, 숫자, 특수문자가 아닙니다.</div>
                                    <div class="form-floating mb-3">
                                        <input type="password" class="form-control border-1 border-light rounded-3 "
                                            id="password" name="password" placeholder="비밀번호" required>
                                        <label for="password" class="fst-italic"><i class="fas fa-lock"></i>
                                            비밀번호(8~15자리의 영문, 숫자, 특수문자 포함)</label>
                                    </div>
                                    
                                    <%-- 비빌번호 확인 --%>
                                    <div class="invalid-feedback" id="pwdMatchFeedback">비밀번호가 일치하지 않습니다.</div>
                                    <div class="form-floating mb-3">
                                        <input type="password" class="form-control border-1 border-light rounded-3"
                                            id="password_confirm" name="password_confirm" placeholder="비밀번호 확인" required>
                                        <label for="password_confirm" class="fst-italic"><i
                                                class="fas fa-lock"></i> 비밀번호 확인</label>
                                    </div>
                                    
                                    <%-- 이름 --%>
                                    <div class="invalid-feedback" id="nameFeedback">숫자, 특수문자를 제외한 이름을 입력해주세요.</div>
                                    <div class="form-floating mb-3">
                                        <input type="text" class="form-control border-1 border-light rounded-3"
                                            id="username" name="username" placeholder="이름" required>
                                        <label for="username" class="fst-italic"><i class="fas fa-id-card"></i>
                                            이름</label>
                                    </div>
                                    
                                    <%-- 성별 --%>
                                    <select class="form-select border-1 border-light rounded-3 mb-3" name="gender" aria-label="Default select example" required>
										<option selected value="">성별</option>
										<option value="1">남자</option>
										<option value="0">여자</option>
									</select>
                                    
                                    <%-- 닉네임 --%>
                                    <div id="nicknameFeedback"></div>
									<div class="col input-group border border-light rounded-3 mb-3">
										<div class="form-floating">
											<input type="text" class="form-control border-0"
												id="nickname" name="nickname" placeholder="닉네임" required>
	       										<label for="nickname" class="fst-italic"><i class="fas fa-user-tag"></i>
           										닉네임</label>
										</div>
										<div class="col-2 text-center p-1">
										    <button class="btn btn-sm border-secondary rounded-4 mt-2"
										        type="button" id="nickCheckBtn">중복확인</button>
										</div>
   									</div>
   									
   									<%-- 이메일 --%>
   									<div id="emailFeedback"></div>
                                    <div class="col input-group border border-light rounded-3 mb-3">
                                        <div class="form-floating">
                                            <input type="email" class="form-control border-0" onkeydown="changeBtn();" 
                                                id="email" name="email" placeholder="이메일" required>
                                            <label for="email" class="fst-italic"><i class="fas fa-envelope"></i>
                                                이메일</label>
                                        </div>
	                                    <div class="col-2 text-center p-1">
	                                         <button class="btn btn-sm border-secondary rounded-4 mt-2"
	                                             type="button" id="emailVerifyBtn">중복확인</button>
	                                    </div>
	                                    <div class="col-3 text-center p-1 visually-hidden">
	                                         <button class="btn btn-sm border-secondary rounded-4 ms-3 mt-2"
	                                             type="button" id="sendEmailBtn">인증메일 전송</button>
	                                    </div>
	                                    <div class="col-2 text-center p-1 visually-hidden">
	                                         <button class="btn btn-sm border-secondary rounded-4 ms-2 mt-2"
	                                             type="button" id="resendEmailBtn">재전송</button>
	                                    </div>
                                    </div>
                                    
                                    <%-- 이메일 인증확인 --%>
                                    <div id="verifyFeedback"></div>
                                    <div class="col input-group border border-light rounded-3 mb-3">
                                        <input type="text" class="form-control border-0" 
                                            id="verification_code" name="verification_code" placeholder="인증코드 6자리 입력" required>
                                     	<div class="col-2 text-center p-1">
                                        	<button class="btn btn-sm border-secondary rounded-4 my-2"
                                            	type="button" id="verify_emailBtn">인증확인</button>
                                    	</div>
                                    </div>
                                    
                                    <div class="d-grid gap-2">
                                        <button type="submit" id="signupBtn"
                                            class="btn btn-outline-light btn-lg p-3 fs-5 fw-bold rounded-4 ">
										<i class="fas fa-user-plus"></i> 가입하기</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- 푸터 -->
    <jsp:include page="../includes/footer.jsp"></jsp:include>
</body>
<script>
 /* 이메일 입력시 중복확인 버튼으로 변경 */
 function changeBtn() {
	$("#sendEmailBtn").closest(".col-3").addClass("visually-hidden");
	$("#resendEmailBtn").closest(".col-2").addClass("visually-hidden");
	$("#emailVerifyBtn").closest(".col-2").removeClass("visually-hidden");
} 
 
	$(function() {
		
		/* 회원가입 */ 
		$("#signupBtn").click(function () {
	        console.log("전송이벤트");
	        if($(".is-valid").length < 7) {
	            console.log("막음");
	            event.preventDefault();
	            return false;
	        }
	        $("#signupBtn").submit();
	        console.log("전송");
	    })

	/* 이름 정규식  */
	const nameRegex = /^[가-힣A-z]*$/;
	$("#username").focusout(function () {
        var username = $("#username").val();
        if(username == "") {
        	return false;
        }
		if(!nameRegex.test(username)) {
			$("#username").removeClass("is-valid").addClass("is-invalid");
			$("#nameFeedback").css("display", "inline-block");
			return false;
		}
			$("#username").removeClass("is-invalid").addClass("is-valid");
			$("#nameFeedback").css("display", "none");
			return true;
    });
	
	/* 비밀번호 정규식 */
	const passwordRegex = /^(?=.*[a-zA-Z])(?=.*[~!@#$%^*+=-])(?=.*[0-9]).{8,15}$/;
	$("#password").keyup(function () {
        var pwd = $("#password").val();
		if(!passwordRegex.test(pwd)) {
			console.log("비번x")
			$("#pwdFeedback").css("display", "inline-block");
			$("#password").removeClass("is-valid").addClass("is-invalid");
			return false;
		}
		console.log("비번o")
		$("#pwdFeedback").css("display", "none");
		$("#password").removeClass("is-invalid").addClass("is-valid");
		return true;
    });
    
	/* 비밀번호 확인 */
	$("#password_confirm").keyup(function () {
        console.log("비밀번호 확인")
        var p1 = $("#password").val();
		var p2 = $("#password_confirm").val();
		if(p1 == "" && p2 =="") {
			return false;		
			}
		if(p1 !== p2) {
			$("#pwdMatchFeedback").css("display", "inline-block");
			$("#password_confirm").removeClass("is-valid").addClass("is-invalid");
            console.log("불일치")
            return false;
		}
		$("#pwdMatchFeedback").css("display", "none");
		$("#password_confirm").removeClass("is-invalid").addClass("is-valid");
            return true;
    });
	


    /* 아이디 중복 검사 */
    $("#check_idBtn").click(function () {
    const userid = $("#userid").val();
    // 아이디 정규식
    const idRegex = /^[a-zA-Z][a-zA-Z0-9]{3,9}$/;
   	if(!idRegex.test(userid)) {
   		alert("아이디 양식에 맞추어주세요");
   		return false;
   	}
    $.post("/member/duplcheck", { userid: userid }, function (data) {
        if (data.available == 0) {
                $("#useridFeedback").removeClass("invalid-feedback").addClass("valid-feedback d-block").text("사용 가능한 아이디입니다.");
            	$("#userid").removeClass("is-invalid").addClass("is-valid");
            }
        	else {
                $("#useridFeedback").removeClass("valid-feedback").addClass("invalid-feedback d-block").text("이미 사용중인 아이디입니다.");
            	$("#userid").removeClass("is-valid").addClass("is-invalid");
            }
        	
        })
    });
    /* 이메일 중복 검사 */
    $("#emailVerifyBtn").click(function () {
    var email = $("#email").val();
    // 이메일 정규식
    var emailRegex = /^[A-z0-9_\+\.\-]+@[A-z0-9\-]+\.[A-z0-9\-]+/;
    if(!emailRegex.test(email)) {
        $("#emailFeedback").removeClass("valid-feedback").addClass("invalid-feedback d-block").text("이메일 형식을 맞추어주세요");
        return false;
    }
    console.log("정규식 성공")
    $.post("/member/duplcheck", { email: email }, function (data) {
        if (data.available == 0) {
	            $("#emailFeedback").removeClass("invalid-feedback").addClass("valid-feedback d-block").text("사용 가능한 이메일입니다.");
	            $("#email").removeClass("is-invalid").addClass("is-valid");
                $("#sendEmailBtn").closest(".col-3").removeClass("visually-hidden");
	            $("#emailVerifyBtn").closest(".col-2").addClass("visually-hidden");
            }
        	else {
	            $("#email").removeClass("is-valid").addClass("is-invalid");
	            $("#emailFeedback").removeClass("valid-feedback").addClass("invalid-feedback d-block").text("이미 사용중인 이메일입니다.");
        }
    })

    });
    
    /* 이메일 발송 */
    $("#sendEmailBtn").click(function() {
    	var email = $("#email").val()
    	  $.post("/member/emailverify", { email: email }, function (data) {
 	        console.log("발송 성공");
 			}) 
	 		$("#sendEmailBtn").closest(".col-3").addClass("visually-hidden");
	 		$("#resendEmailBtn").closest(".col-2").removeClass("visually-hidden");
	 		$("#verifyFeedback").text("이메일이 전송되었습니다.");
		})
	/* 이메일 재발송 */
    $("#resendEmailBtn").click(function() {
    	var email = $("#email").val()
    	  $.post("/member/emailverify", { email: email }, function (data) {
 	        console.log("발송 성공");
 			})
	});

    /* 인증코드 확인 */
    $("#verify_emailBtn").click(function () {
    var vericode = $("#verification_code").val();
    $.post("/member/emailverify", { vericode: vericode }, function (data) {
        if (data.available) {
	            $("#verifyFeedback").removeClass("invalid-feedback").addClass("valid-feedback d-block").text("인증완료 되었습니다.");
	            $("#verify_emailBtn").addClass("disabled btn-light");
	            $("#resendEmailBtn").addClass("disabled btn-light");
	            //$("#email").attr("disabled", "");
	            $("#verification_code").removeClass("is-invalid").addClass("is-valid");
        }
        else {
            $("#verifyFeedback").removeClass("valid-feedback").addClass("invalid-feedback d-block").text("인증코드가 일치하지 않습니다.");
			$("#verification_code").removeClass("is-valid").addClass("is-invalid");
        }
     })
    });	

	
    /* 닉네임 중복 검사 */
    $("#nickCheckBtn").click(function () {
        console.log("nick click");
        const nickname = $("#nickname").val();
        // 닉네임 정규식
        const nickRegex = /^[가-힣a-zA-Z0-9]*$/;
        if(!nickRegex.test(nickname)) {
        	alert("특수문자 제외 입력해주세요")
        	return false
        }
        $.post("/member/duplcheck", { nickname: nickname }, function (data) {
            console.log(data);
            if (data.available == 0) {
                    $("#nicknameFeedback").removeClass("invalid-feedback").addClass("valid-feedback d-block").text("사용 가능한 닉네임입니다.");
         	     	$("#nickname").removeClass("is-invalid").addClass("is-valid");  	
                }
            	 else {
                    $("#nicknameFeedback").removeClass("valid-feedback").addClass("invalid-feedback d-block").text("이미 사용중인 닉네임입니다.");
         	     	$("#nickname").removeClass("is-valid").addClass("is-invalid");  	
                	
                }
            	
              })
        });
});
</script>
</html>