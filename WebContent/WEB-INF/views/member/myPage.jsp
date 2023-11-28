<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html data-bs-theme="dark">
<head>
	<meta charset='utf-8'>
	<meta http-equiv='X-UA-Compatible' content='IE=edge'>
	<title>마이페이지</title>
	<meta name='viewport' content='width=device-width, initial-scale=1'>
	<link rel="icon" href="data:;base64,iVBORw0KGgo=">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
    <link rel="stylesheet" href="../css/style.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin >
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>   
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/3.3.1/js/swiper.min.js"></script>
    <script>
      // 슬라이더 초기화 함수
      function initializeSlider(sliderSelector) {
        $(sliderSelector).bxSlider({
          pager: false,
          auto: false,
          moveSlides: 1,
          minSlides: 2,
          maxSlides: 5,
          slideWidth: 300,
          slideMargin: 15,
          shrinkItems: true,
          touchEnabled: false, 
          swipeThreshold: 0, 
        });
      }

      $(function () {
        // 일반 슬라이더 초기화
        initializeSlider(".slider-pager");

        // 활성화된 탭 슬라이더 초기화
        $('a[data-bs-toggle="tab"]').on('shown.bs.tab', function (e) {
          var target = $(e.target).attr("href");
          initializeSlider(target + ' .genre-slider-pager');
        });
      });
    </script>
</head>

<!-- 바디 -->
<body class="pt-5" >
  <!-- 헤더 -->
  <jsp:include page="../includes/header.jsp"></jsp:include>

	<div class="container mt-5 pb-4">
		<div class="row justify-content-center">
			<div class="card col-5 p-0">
				<div class="card-body ">
					<div class="row">
						<div class="col-3 px-3">
							<img class="card-img-start rounded-pill"
								src="../image/profile.png" width="100" height="100"
								alt="Card image">
						</div>
						<div class="col-9">
							<!-- 닉네임 -->
							<span style="font-size: 30px;">${member.nickname}</span>
							
							<div class="mb-3 mt-2">
								<i class="fas fa-user" style="font-size: 24px;"></i> <span
									style="font-size: 24px;">${member.userid}</span>
							</div>
							<div class="mb-3 mt-2">
								<i class="fas fa-envelope" style="font-size: 24px;"></i> <span
									style="font-size: 24px;">${member.email}</span>
							</div>
							<div class="mb-3">
								<i class="fas fa-phone-alt" style="font-size: 24px;"></i> <span
									style="font-size: 24px;">${member.number}</span>
							</div>
						</div>

						<div class="col-12">
						    <p class="text-end">
						        <a href="/member/profileModify" class="text-decoration-none text-white me-2">프로필 수정</a>
						        <a href="/member/pwModify" class="text-decoration-none text-white">비밀번호 변경</a>
						    </p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="container">
    <div class="col-xs-12">
      <div class="row justify-content-between m-2">
        <div class="col-2">
          <h3 class="text-light">찜한 영화</h3>
        </div>
        <div class="col-1 p-0 mt-3 text-end small">
          <a href="../member/favorite" class="text-muted">더보기 <i class="fas fa-chevron-right"></i></a>
        </div>
      </div>
      <div class="slider-pager" id="FavoriteList"> 
          <c:forEach items="${imageList}" var="i">
            <a href="/movie?m=${i.mno}"><img src="${i.backdroppath}" class="img-thumbnail"></a>
    	  </c:forEach>
      </div>
    </div>
  </div>
  <%-- <div class="container">
    <div class="col-xs-12">
      <div class="row justify-content-between m-2">
        <div class="col-2">
          <h3 class="text-light">내가 평점 남긴 영화</h3>
        </div>
        <div class="col-1 p-0 mt-3 text-end small">
          <a href="#" class="text-muted">더보기 <i class="fas fa-chevron-right"></i></a>
        </div>
      </div>
      <div class="slider-pager" id="rateByMe"> 
          <c:forEach items="${imageList}" var="i">
            <a href="/movie?m=${i.mno}"><img src="${i.backdroppath}" class="img-thumbnail"></a>
    	  </c:forEach>
      </div>
    </div>
  </div> --%>
  
  <!-- 푸터 -->
  <jsp:include page="../includes/footer.jsp"></jsp:include>
  
</body>
</html>