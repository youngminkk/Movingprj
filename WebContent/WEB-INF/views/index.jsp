<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html data-bs-theme="dark">
<head>
<meta charset='utf-8'>
<meta http-equiv='X-UA-Compatible' content='IE=edge'>
<title>Moving</title>
<meta name='viewport' content='width=device-width, initial-scale=1'>
<link rel="icon" href="data:;base64,iVBORw0KGgo=">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css" rel="stylesheet">
    <link rel="stylesheet" href="./css/style.css">
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
    <script>
    /*   // 검색 버튼식 검색 창 구현
      document.addEventListener("DOMContentLoaded", function () {
        const icon = document.querySelector(".icon");
        const form = document.getElementById("searchForm");
  
        icon.addEventListener("click", function (event) {
          event.preventDefault();
          form.classList.toggle("invisible");
        });
      });
     */
    </script>
</head>

<!-- 바디 -->
<body class="pt-5">
	<!-- 헤더 -->
   <jsp:include page="./includes/header.jsp"></jsp:include>

  <!-- 슬라이더 -->
  <div class="my-5 py-5">
    <div class="swiper-container w-100" style="height: 500px;">
      <div class="swiper-wrapper">
        <div class="swiper-slide">
          <div class="rounded-4" data-vbg-fit-box="true" data-vbg-play-button="true" data-vbg="https://www.youtube.com/watch?v=HIJnO2n4Gy4"></div>
          <div class="card-img-overlay d-flex justify-content-end align-items-end">
            <div class="mb-2 mr-4">
              <h4 class="card-title">찰리와 초콜릿 공장</h4>
              <p class="card-text">신비한 수수께끼를 간직한 웡카의 초콜릿 공장</p>
              <!-- <a href="https://www.youtube.com/watch?v=_xl6-9y71BM" class="btn btn-dark">재생</a> -->
              <a href="${cp}/movie?m=118" class="btn btn-dark">상세보기</a>
            </div>
          </div>
        </div>
        <div class="swiper-slide">
          <div class="rounded-4" data-vbg-fit-box="true" data-vbg-play-button="true" data-vbg-autoplay="false" data-vbg="https://www.youtube.com/watch?v=PRoDQNBSVxw"></div>
          <div class="card-img-overlay d-flex justify-content-end align-items-end">
            <div class="mb-2 mr-4">
              <h4 class="card-title">박물관이 살아잇다</h4>
              <p class="card-text">모두가 잠든 순간, 환상의 세계가 깨어난다!</p>
              <!-- <a href="ttps://www.youtube.com/watch?v=mMfFNbDome8" class="btn btn-dark">재생</a> -->
              <a href="${cp}/movie?m=1593" class="btn btn-dark">상세보기</a>
            </div>
          </div>
        </div>
        <div class="swiper-slide">
          <div class="rounded-4" data-vbg-fit-box="true"  data-vbg-play-button="true" data-vbg-autoplay="false" data-vbg="https://www.youtube.com/watch?v=Aau5B1zw2v0"></div>
          <div class="card-img-overlay d-flex justify-content-end align-items-end">
            <div class="mb-2 mr-4">
              <h4 class="card-title">올드보이</h4>
              <p class="card-text">15년의 감금, 5일의 추적</p>
              <!-- <a href="https://www.youtube.com/watch?v=_xl6-9y71BM" class="btn btn-dark">재생</a> -->
              <a href="${cp}/movie?m=670" class="btn btn-dark">상세보기</a>
            </div>
          </div>
        </div>
      </div>
      <div class="swiper-button-prev swiper-button-white mx-5"></div>
      <div class="swiper-button-next swiper-button-white mx-5"></div>
    </div>
  </div>

  <!-- 장르별 영화 -->
  <div class="container pt-3">
    <h3 class="section-title h3 text-light">장르별 영화</h3>
    <div class="row">
      <div class="col-xs-12">
        <ul class="nav nav-tabs nav-fill border border-0" id="nav-tab" role="tablist">
          <li class="nav-item" role="presentation">
            <a class="nav-link active text-muted " id="nav-action-tab" data-bs-toggle="tab" href="#nav-action"
              role="tab" aria-controls="nav-action" aria-selected="true">액션</a>
          </li>
          <li class="nav-item" role="presentation">
            <a class="nav-link text-muted" id="nav-romance-tab" data-bs-toggle="tab" href="#nav-romance" role="tab"
              aria-controls="nav-romance" aria-selected="false">로맨스</a>
          </li>
          <li class="nav-item" role="presentation">
            <a class="nav-link text-muted" id="nav-comedy-tab" data-bs-toggle="tab" href="#nav-comedy" role="tab"
              aria-controls="nav-comedy" aria-selected="false">코미디</a>
          </li>
          <li class="nav-item" role="presentation">
            <a class="nav-link text-muted" id="nav-horror-tab" data-bs-toggle="tab" href="#nav-horror" role="tab"
              aria-controls="nav-horror" aria-selected="false">공포</a>
          </li>
        </ul>
     

        <!-- 장르별 슬라이드 -->
        <div class="tab-content py-3 px-3 px-sm-0" id="nav-tabContent">
        
          <!-- 액션 -->
			<div class="tab-pane active" id="nav-action" role="tabpanel" aria-labelledby="nav-action-tab">
			    <div class="mb-1 card border border-0">
			        <div class="genre-slider-pager slider-pager">
			        <c:forEach var="movie" items="${movies}">
			        <c:if test="${movie.gno == '28'}">
			                <div>
			                <a href="${cp}/movie?m=${movie.mno}">
			                	<c:choose>
								    <c:when test="${movie.backdroppath != null}">
								            <img src="https://image.tmdb.org/t/p/w300${movie.backdroppath}" class="img-thumbnail">
								    </c:when>
							        <c:otherwise>
							            <img src="https://via.placeholder.com/300x169" class="img-thumbnail">
							        </c:otherwise>
								</c:choose>
			                    </a>
			                </div>
			        </c:if>
			        </c:forEach>
			        </div>
			    </div>
			   
			</div>

          
          <!-- 로맨스 -->
          <div class="tab-pane fade" id="nav-romance" role="tabpanel" aria-labelledby="nav-romance-tab">
            <div class="mb-1 card border border-0">
			        <div class="genre-slider-pager">
			        <c:forEach var="movie" items="${movies}">
			           <c:if test="${movie.gno == '10749'}">
			                <div>
			                <a href="${cp}/movie?m=${movie.mno}">
			                	<c:choose>
								    <c:when test="${movie.backdroppath != null}">
								            <img src="https://image.tmdb.org/t/p/w300${movie.backdroppath}" class="img-thumbnail">
								    </c:when>
							        <c:otherwise>
							            <img src="https://via.placeholder.com/300x169" class="img-thumbnail">
							        </c:otherwise>
								</c:choose>
			                    </a>
			                </div>
			        </c:if>
			        </c:forEach>
			        </div>
			    </div>
          </div>
          
          <!-- 드라마 -->
          <div class="tab-pane fade" id="nav-comedy" role="tabpanel" aria-labelledby="nav-comedy-tab">
            <div class="mb-1 card border border-0">
			        <div class="genre-slider-pager">
			        <c:forEach var="movie" items="${movies}">
			            <c:if test="${movie.gno == '35'}">
			                <div>
			                <a href="${cp}/movie?m=${movie.mno}">
			                	<c:choose>
								    <c:when test="${movie.backdroppath != null}">
								            <img src="https://image.tmdb.org/t/p/w300${movie.backdroppath}" class="img-thumbnail">
								    </c:when>
							        <c:otherwise>
							            <img src="https://via.placeholder.com/300x169" class="img-thumbnail">
							        </c:otherwise>
								</c:choose>
			                    </a>
			                </div>
			        </c:if>
			        </c:forEach>
			        </div>
			    </div>
          </div>
          
          <!-- 코미디 -->
          <div class="tab-pane fade" id="nav-horror" role="tabpanel" aria-labelledby="nav-horror-tab">
           <div class="mb-1 card border border-0">
			        <div class="genre-slider-pager">
			        <c:forEach var="movie" items="${movies}">
			          <c:if test="${movie.gno == '27'}">
			                <div>
			                <a href="${cp}/movie?m=${movie.mno}">
			                	<c:choose>
								    <c:when test="${movie.backdroppath != null}">
								            <img src="https://image.tmdb.org/t/p/w300${movie.backdroppath}" class="img-thumbnail">
								    </c:when>
							        <c:otherwise>
							            <img src="https://via.placeholder.com/300x169" class="img-thumbnail">
							        </c:otherwise>
								</c:choose>
			                    </a>
			                    
			                </div>
			        </c:if>
			        </c:forEach>
			        </div>
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
          <h3 class="text-light">한국 영화</h3>
        </div>
        <div class="col-1 p-0 mt-3 text-end small">
          <a href="${cp}/movie/list?lang=ko" class="text-muted">더보기 <i class="fas fa-chevron-right"></i></a>
        </div>
      </div>
      <div class="slider-pager" id="korean-movies-slider">
      <c:forEach var="movie" items="${movies}">
      <c:if test="${movie.gno eq 'ko'}">
                <a href="${cp}/movie?m=${movie.mno}">
			                	<c:choose>
								    <c:when test="${movie.backdroppath != null}">
								            <img src="https://image.tmdb.org/t/p/w300${movie.backdroppath}" class="img-thumbnail">
								    </c:when>
							        <c:otherwise>
							            <img src="https://via.placeholder.com/300x169" class="img-thumbnail">
							        </c:otherwise>
								</c:choose>
			                    </a>
        </c:if>
        </c:forEach>
      </div>
    </div>
  </div>
  <div class="container">
    <div class="col-xs-12">
      <div class="row justify-content-between m-2">
        <div class="col-2">
          <h3 class="text-light">외국 영화</h3>
        </div>
        <div class="col-1 p-0 mt-3 text-end small">
          <a href="${cp}/movie/list?lang=en" class="text-muted">더보기 <i class="fas fa-chevron-right"></i></a>
        </div>
      </div>
      <div class="slider-pager" id="foreign-movies-slider">
      <c:forEach var="movie" items="${movies}">
       <c:if test="${movie.gno eq 'en'}">
             <a href="${cp}/movie?m=${movie.mno}">
             	<c:choose>
		    <c:when test="${movie.backdroppath != null}">
		            <img src="https://image.tmdb.org/t/p/w300${movie.backdroppath}" class="img-thumbnail">
		    </c:when>
	        <c:otherwise>
	            <img src="https://via.placeholder.com/300x169" class="img-thumbnail">
	        </c:otherwise>
		</c:choose>
                 </a>
        </c:if>
        </c:forEach>
      </div>
    </div>
  </div>
 <!-- Footer -->
    <jsp:include page="./includes/footer.jsp"></jsp:include>
  <!-- 페이지 상단으로 이동 버튼 -->
  <button type="button" class="btn btn-dark btn-floating rounded-5 " id="btn-back-to-top"><i class="fas fa-arrow-up"></i></button>
</body>
<!-- 스와이퍼(슬라이더) 관련 -->
<script>
  var mySwiper = new Swiper('.swiper-container', {
    slideToClickedSlide: true,
    speed: 700,
    spaceBetween: 100,
    initialSlide: 0,
    autoHeight: false,
    direction: 'horizontal',
    loop: true,
    autoplayStopOnLast: false,
    nextButton: '.swiper-button-next',
    prevButton: '.swiper-button-prev',
    effect: 'slide',
    spaceBetween: 60,
    slidesPerView: 2,
    centeredSlides: true,
    slidesOffsetBefore: 0,
    grabCursor: true,
    effect: 'coverflow',
    coverflowEffect: {
    rotate: 30,
    slideShadows: false,
  },
  });
     
</script>

<!-- 백그라운드 영상재생 -->
<script type="text/javascript">
  $(function () {
    $('[data-vbg]').youtube_background({
    });
  });
</script>

<!-- 스크롤 내렸을때 페이지 상단 -->
<script>
let mybutton = document.getElementById("btn-back-to-top");

window.onscroll = function () {
  scrollFunction();
};

function scrollFunction() {
  if (
    document.body.scrollTop > 20 ||
    document.documentElement.scrollTop > 20
  ) {
    mybutton.style.display = "block";
  } else {
    mybutton.style.display = "none";
  }
}
mybutton.addEventListener("click", backToTop);

function backToTop() {
  document.body.scrollTop = 0;
  document.documentElement.scrollTop = 0;
}
</script>
</html>