<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html data-bs-theme="dark">
<head>
    <meta charset='utf-8'>
    <meta http-equiv='X-UA-Compatible' content='IE=edge'>
    <title>프로필 수정</title>
    <meta name='viewport' content='width=device-width, initial-scale=1'>
    <link rel="icon" href="data:;base64,iVBORw0KGgo=">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css" rel="stylesheet">
    <link rel="stylesheet" href="../css/style.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/3.3.1/css/swiper.min.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
    <script src="https://cdn.jsdelivr.net/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/3.3.1/js/swiper.min.js"></script>
    <script src="https://unpkg.com/youtube-background@1.0.14/jquery.youtube-background.min.js"></script>
</head>

<body>
    <!-- 헤더 -->
    <jsp:include page="../includes/header.jsp"></jsp:include>
    <div class="container my-5">
        <div class="row justify-content-center align-items-center vh-80">
            <div class="col-md-5">
                <h2 class="mb-4 text-center">기본정보</h2>
                <div class="card p-4 border border-3 rounded-5">
                    <form method="post">
                        <div class="col-12 pb-3 d-flex justify-content-center">
                            <div class="position-relative" style="text-align: right;">
                                <img src="../image/profile.png" class="card-img-start rounded-pill mx-auto" width="100" height="100" id="outsideImage" data-bs-toggle="modal" data-bs-target="#myModal">
                                <button type="button" class="btn btn-link position-absolute" style="bottom: -20px; right: -14px;" data-bs-toggle="modal" data-bs-target="#myModal">
                                    <i class="fas fa-cog fa-lg"></i>
                                </button>
                            </div>
                            <div class="modal fade" id="myModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title" id="exampleModalLabel">프로필 이미지 변경</h5>
                                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                        </div>
                                        <div class="modal-body text-center">
                                            <img src="../image/profile1.jpg" id="profile1" class="card-img-start rounded-pill mx-1" width="100" height="100" data-bs-dismiss="modal">
                                            <img src="../image/profile2.jpg" id="profile2" class="card-img-start rounded-pill mx-1" width="100" height="100" data-bs-dismiss="modal">
                                            <img src="../image/profile3.jpg" id="profile3" class="card-img-start rounded-pill mx-1" width="100" height="100" data-bs-dismiss="modal">
                                            <img src="../image/profile4.jpg" id="profile4" class="card-img-start rounded-pill mx-1" width="100" height="100" data-bs-dismiss="modal">
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-10 mb-2 mx-auto">
                            <label class="form-label fs-7 text-muted-50 fst-italic" for="loginName">
                                <i class="fas fa-user"></i>아이디
                            </label>
                            <input type="text" class="form-control p-1" style="pointer-events: none;" name="id" id="id" readonly value="${member.userid}">
                        </div>
                        <div id="nicknameFeedback"></div>
                        <div class="col-10 mb-2 mx-auto">
                            <label class="form-label fs-7 text-muted-50 fst-italic" for="loginName">
                                <i class="fas fa-user-tag"></i>닉네임
                            </label>
                            <div class="input-group">
                                <input type="text" class="form-control p-1" name="nickname" id="nickname" value="${member.nickname}">
                            </div>
                        </div>
                        <div class="col-10 mb-2 mx-auto">
                            <label class="form-label fs-7 me-5 text-muted-50 fst-italic" for="loginName">
                                <i class="fas fa-envelope"></i>이메일
                            </label>
                            <input type="text" class="form-control p-1" style="pointer-events: none;" name="email" id="email" readonly value="${member.email}">
                        </div>
                        <div class="col-10 mb-2 mx-auto">
                            <input type="hidden" name="myMember" value="<%=request.getAttribute("myMember") %>">
                            <button type="button" id="joinBtn" class="form-control p-1" name="joinBtn">회원정보 수정하기</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <!-- 푸터 -->
    <jsp:include page="../includes/footer.jsp"></jsp:include>
    
     <script>
	// 프로필 이미지 변경
  /*     $(document).ready(function() {
         $('[id^="profile"]').click(function() {
             const imgSrc = $(this).attr('src');
             $("#outsideImage").attr("src", imgSrc);
         });  */
         
	// 닉네임 변경
	$("button[name='joinBtn']").click(function () {
	    const newNickname = $('#nickname').val();
	    if (!newNickname) {
	        alert("닉네임을 입력하세요.");
	        return;
	    }
	    if (!confirm("닉네임을 수정하시겠습니까?")) {
	        return;
	    }
	    
	    const cp = '${cp}';
	    const userno = '${member.userno}';
	    const data = { nickname: newNickname, userno: userno };
	    
	    $.ajax({
	        url: cp + "/member/profileModify",
	        type: 'PUT',
	        data: JSON.stringify(data),
	        success: function (data) {
	        	
	        
	            if (data) {
	                console.log(data); 
	                const updatedNickname = data.updatedNickname;
	
	                console.log(updatedNickname);
	                $('#nickname').val(updatedNickname);
	                alert("닉네임이 변경되었습니다.");
	                
	                location.reload(true);
	            }
	        },
	        error: function (error) {
	            alert("다시 시도해주세요.");
	        }
	    });
	});
</script>
</body>
</html>
