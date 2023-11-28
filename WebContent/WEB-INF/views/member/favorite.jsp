<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html data-bs-theme="dark">
<head>
<meta charset='utf-8'>
<meta http-equiv='X-UA-Compatible' content='IE=edge'>
<title>Page Title</title>
<meta name='viewport' content='width=device-width, initial-scale=1'>
<link rel="icon" href="data:;base64,iVBORw0KGgo=">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css" rel="stylesheet">
    <link rel="stylesheet" href="../css/style.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin >
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/3.3.1/css/swiper.min.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>   
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/3.3.1/js/swiper.min.js"></script>
    <script src="https://unpkg.com/youtube-background@1.0.14/jquery.youtube-background.min.js"></script>
<script>
$(function(){
    const startAmount = 30; // 초기 표시 영화 수
    const amount = 30; // 더보기 클릭시 추가 영화 수

    const totalImages = $("#FavoriteList a").length; // 이미지 총 개수

    if (totalImages <= startAmount) {
        $("#more").hide(); // 이미지가 30개 이하일 때 "더보기" 버튼 숨김
    } else {
   	 	$("#FavoriteList a:gt(" + (startAmount - 1) + ")").hide();
    }
    $("#more").click(function(e) {
        e.preventDefault();
        const totalDisplayed = $("#FavoriteList a:visible").length;
        $("#FavoriteList a:lt(" + (totalDisplayed + amount) + ")").show();
        if (totalDisplayed + amount >= $("#FavoriteList a").length) {
            $("#more").hide();
        }
    });
});
</script>
<style>
    .bx-wrapper {
      border: 0;
      background-color: transparent;
      box-shadow: none;
    }

    .img-thumbnail {
      width: 230px; height: 500px; 
      height: auto; 
    }
</style>   
</head>

<!-- 바디 -->
<body class="pt-5" >

	<!-- 헤더 -->
    <jsp:include page="../includes/header.jsp"></jsp:include>

   		<div class="container px-5 my-5 py-5">
	        <div class="col-xs-12 pt-2 pb-5">
	          <div class="row justify-content-between m-2">
	            <div class="col-2">
	              <h3 class="text-light">찜한 영화</h3>
	            </div>
	          </div>
	          <div class="text-left pt-2 pb-4" id="FavoriteList"> 
		          <c:forEach items="${imageList}" var="i">
		            <a href="/movie?m=${i.mno}"><img src="${i.backdroppath}" class="img-thumbnail"></a>
		    	  </c:forEach>
	          </div>
				<button id="more">더 보기</button>
	        </div>
       </div>
      
<!-- 푸터 -->
<jsp:include page="../includes/footer.jsp"></jsp:include>

</body>
</html>