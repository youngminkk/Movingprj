<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html data-bs-theme="dark">
<head>
<meta charset='utf-8'>
<meta http-equiv='X-UA-Compatible' content='IE=edge'>
<title>Page Title</title>
<meta name='viewport' content='width=device-width, initial-scale=1'>
<link rel="icon" href="data:;base64,iVBORw0KGgo=">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css"
	rel="stylesheet">
<link rel="stylesheet" href="./css/style.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/3.3.1/css/swiper.min.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/3.3.1/js/swiper.min.js"></script>
<script
	src="https://unpkg.com/youtube-background@1.0.14/jquery.youtube-background.min.js"></script>

<script>
	// 슬라이더 초기화 함수
</script>
</head>

<!-- 바디 -->
<body class="pt-5">
	<!-- 헤더 -->
	<jsp:include page="../includes/header.jsp"></jsp:include>

	<!-- 장르별 영화 -->
	<div class="container pt-5 mb-4">
		<div class="row mt-3">
			<h3 class="section-title h3 text-light">검색 결과</h3>
			<div class="row pt-3">
				<div class="col-xs-12">
					
					<%-- 네비게이션 탭 --%>
					<ul class="nav nav-tabs border border-0" id="nav-tab"
						role="tablist">
						<li class="nav-item" role="presentation" value="1"><a
							class="nav-link active text-muted " id="nav-action-tab"
							data-bs-toggle="tab" href="#nav-all" role="tab"
							aria-controls="nav-action" aria-selected="true">통합결과</a></li>
						<li class="nav-item sm" role="presentation" value="2"><a
							class="nav-link text-muted" id="nav-romance-tab"
							data-bs-toggle="tab" href="#nav-movie" role="tab"
							aria-controls="nav-romance" aria-selected="false">영화</a></li>
						<li class="nav-item" role="presentation" value="3"><a
							class="nav-link text-muted" id="nav-comedy-tab"
							data-bs-toggle="tab" href="#nav-cast" role="tab"
							aria-controls="nav-comedy" aria-selected="false">인물</a></li>
					</ul>


					<div class="tab-content mt-3">
						<div class="tab-pane fade active show" id="nav-all"
							role="tabpanel" aria-labelledby="nav-action-tab">
							<div class="mb-1 card border border-0">
								<div class="row" id="contentList">
								
								<%-- 검색결과 없을때 --%>
								<c:if test="${empty movieMain && empty castMain}">
									<div class="ps-4 pb-5 mb-5">검색 결과가 없습니다.</div>
								</c:if>
									<%-- 통합검색 영화결과 10개 --%>
									<c:forEach items="${movieMain}" var="m">
									<div class="col-2 mb-3 rounded-2" id="movieList">
										<a href="${cp}/movie?m=${m.mno}" class="text-decoration-none">
											<div class="col">
												<img src="https://www.themoviedb.org/t/p/w220_and_h330_face${m.img}" class="rounded-4" width="176" height="264">
											</div>
											<div class="overflow-hidden text-light">${m.title}</div>
										</a>
									</div>
									</c:forEach>
									<%-- 통합검색 배우결과 10개 --%>
									<c:forEach items="${castMain}" var="c">
										<div class="row mb-3 rounded-2">
											<div class="col-1">
												<img class="rounded-pill" width="92" src="https://www.themoviedb.org/t/p/w220_and_h330_face${c.profileImage}">
											</div>
											<div class="col py-5">
												${c.name}
											</div>
										</div>
									</c:forEach>
								</div>
							</div>
						</div>
			
						<%-- 영화 전체 검색결과 탭 --%>
						<div class="tab-pane fade" id="nav-movie" role="tabpanel"
							aria-labelledby="nav-action-tab">
							<div class="mb-1 card border border-0">
								<div class="row">
								<c:if test="${empty movieList}">
									<div class="ps-4 pb-5 mb-5">검색 결과가 없습니다.</div>
								</c:if>
									<c:forEach items="${movieList}" var="m">
									<div class="col-2 mb-3 rounded-2">
										<a href="${cp}/movie?m=${m.mno}" class="text-decoration-none">
											<div class="col">
												<img src="https://www.themoviedb.org/t/p/w220_and_h330_face${m.img}" width="154" height="231">
											</div>
											<div class="overflow-hidden text-light">${m.title}</div>
										</a>
									</div>
									</c:forEach>
								</div>
							</div>
						</div>

						<%-- 배우 전체 검색결과 탭 --%>
						<div class="tab-pane fade" id="nav-cast" role="tabpanel"
							aria-labelledby="nav-action-tab">
							<div class="mb-1 card border border-0">
								<div class="genre-slider-pager">
								<c:if test="${empty castList}">
									<div class="ps-4 pb-5 mb-5">검색 결과가 없습니다.</div>
								</c:if>
									<c:forEach items="${castList}" var="c">
										<div class="row mb-3 rounded-2">
											<div class="col-1">
												<img class="rounded-pill" width="92" src="https://www.themoviedb.org/t/p/w220_and_h330_face${c.profileImage}">
											</div>
											<div class="col py-5">
												${c.name}
											</div>
										</div>
									</c:forEach>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Footer -->
	<jsp:include page="../includes/footer.jsp"></jsp:include>
	<!-- 페이지 상단으로 이동 버튼 -->
	<button type="button" class="btn btn-dark btn-floating rounded-5 "
		id="btn-back-to-top">
		<i class="fas fa-arrow-up"></i>
	</button>
</body>
<!-- 스와이퍼(슬라이더) 관련 -->
<script>

	
	var mySwiper = new Swiper('.swiper-container', {
		slideToClickedSlide : true,
		speed : 700,
		spaceBetween : 100,
		initialSlide : 0,
		autoHeight : false,
		direction : 'horizontal',
		loop : true,
		autoplayStopOnLast : false,
		nextButton : '.swiper-button-next',
		prevButton : '.swiper-button-prev',
		effect : 'slide',
		spaceBetween : 60,
		slidesPerView : 2,
		centeredSlides : true,
		slidesOffsetBefore : 0,
		grabCursor : true,
		effect : 'coverflow',
		coverflowEffect : {
			rotate : 30,
			slideShadows : false,
		},
	});
</script>


<!-- 스크롤 내렸을때 페이지 상단 -->
<script>
	let mybutton = document.getElementById("btn-back-to-top");

	window.onscroll = function() {
		scrollFunction();
	};

	function scrollFunction() {
		if (document.body.scrollTop > 20
				|| document.documentElement.scrollTop > 20) {
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