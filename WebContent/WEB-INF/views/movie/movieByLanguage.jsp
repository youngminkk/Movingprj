<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
    <link rel="stylesheet" href="/css/style.css">
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
      
      $(function(){
    	    const startAmount = 30; // 초기 표시 영화 수
    	    const amount = 30; // 더보기 클릭시 추가 영화 수

    	    const totalImages = $("#movieList a").length; // 이미지 총 개수

    	    if (totalImages <= startAmount) {
    	        $("#more").hide(); // 이미지가 30개 이하일 때 "더보기" 버튼 숨김
    	    } else {
    	   	 	$("#movieList a:gt(" + (startAmount - 1) + ")").hide();
    	    }
    	    
    	    $("#more").click(function(e) {
    	        e.preventDefault();
    	        const totalDisplayed = $("#movieList a:visible").length;
    	        $("#movieList a:lt(" + (totalDisplayed + amount) + ")").show();
    	        if (totalDisplayed + amount >= $("#movieList a").length) {
    	            $("#more").hide();
    	        }
    	    });
    	});
    </script>
    <script>
      // 검색 버튼식 검색 창 구현
      document.addEventListener("DOMContentLoaded", function () {
        const icon = document.querySelector(".icon");
        const form = document.getElementById("searchForm");
  
        icon.addEventListener("click", function (event) {
          event.preventDefault();
          form.classList.toggle("invisible");
        });
      });
    
    </script>
</head>
<!-- 바디 -->
<body class="pt-5" >

	<!-- 헤더 -->
  	<jsp:include page="../includes/header.jsp"></jsp:include>
<!-- 장르별 영화 -->
  <div class="container pt-3">
    <h3 class="section-title h3 text-light my-5">장르별 영화 
    <c:forEach var="genre" items="${genres}" >
		             <c:if test="${genre.gno == gno}">
			             - <small>${genre.genre}</small>
		             </c:if> 
	             </c:forEach></h3>
    <div class="row">
     <c:if test="${empty gno && not empty lang}">
     <!-- lang만을 파라미터로 받아오는 경우 -->
    <c:forEach var="entry"  items="${imagesMap}">
    	<c:if test="${not empty entry.value}">
	     <div class="col-xs-12">
	       <div class="nav nav-tabs nav-fill border border-0" id="nav-tab" role="tablist">
	         <div class="nav-item" role="presentation">
	           <a class="nav-link active text-muted " id="nav-action-tab" data-bs-toggle="tab" href="#nav-action"
	             role="tab" aria-controls="nav-action" aria-selected="true">
	             <c:forEach var="genre" items="${genres}" >
		             <c:if test="${genre.gno == entry.key}">
			             ${genre.genre}
		             </c:if> 
	             </c:forEach>
	           	</a>
	         </div>
	       </div>
	       <!-- 장르별 슬라이드 -->
	       <div class="tab-content py-3 px-3 px-sm-0" id="nav-tabContent">
	         <!-- 액션 -->
	         <div class="tab-pane active" id="nav-action" role="tabpanel" aria-labelledby="nav-action-tab">
	           <div class="mb-1 card border border-0">
	             <div class="genre-slider-pager slider-pager">
	             	<c:forEach var="image" items="${entry.value}">
	               <div>
	               <a href="http://localhost:8080/movie?m=${image.mno}">
	              	<img src="${image.backdroppath}" class="img-thumbnail">
	               </a>
	               </div>
	             	</c:forEach>
	             </div>
	           </div>
	         </div>
	       </div>
	     </div>
	     </c:if>
      </c:forEach>
      </c:if>
  <c:if test="${not empty gno || empty lang}">
  <!-- gno만을 파라미터로 받아오는 경우 -->
   <div class="container px-5 my-5 py-5">
       <div class="col-xs-12 pt-2 pb-5">
         <div class="row justify-content-between m-2">
         </div>
         <div class="text-left pt-2 pb-4" id="movieList">
         <c:forEach items="${images}" var="i">
           <a href="/movie?m=${i.mno}"><img width="240" src="${i.backdroppath}" class="img-thumbnail"></a>
   	  </c:forEach>
         </div>
		<button id="more">더 보기</button>
       </div>
     </div>
     </c:if>
  	</div>
  	</div>
  	
	<!-- Footer -->
    <jsp:include page="../includes/footer.jsp"></jsp:include>
</body>
</html>