<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html lang="ko" data-bs-theme="dark">
<head>
	<meta charset='utf-8'>
    <meta http-equiv='X-UA-Compatible' content='IE=edge'>
    <meta name='viewport' content='width=device-width, initial-scale=1'>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css" rel="stylesheet">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
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
<body class="pt-5">
<!-- 헤더 -->
<jsp:include page="../includes/header.jsp"></jsp:include>
<div id="content">
	<div class="container-sm p-3">
		<h1 class="h3 mb-2 text-gray-800 text-center">
			<c:forEach items="${categories}" var="bc">
				<c:if test="${bc.bcate == pageDto.cri.category}">${bc.boardcategory}</c:if>
			</c:forEach>    
		</h1>
	<div class="card shadow mb-4">
		<div class="card-header p-3 clearfix text-bg-secondary rounded-top border border-1">
			<h6 class="m-0 mt-2 font-weight-bold text-light float-start">게시글 목록</h6>
			<a href="register${page.cri.link}" class="btn btn-dark btn-sm float-end">등록</a>
		</div>
		<div class="card-body">
			<div class="table-responsive p-3">
				<table class="table table-bordered text-center p-2">
					<thead>
						<tr>
							<th class="col-1 text-center">번호</th>
							<th class="col-5 text-center">제목</th>
							<th class="col-1 text-center">작성자</th>
							<th class="col-1 text-center">작성일</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${list}" var="b">
							<tr>
								<td>${b.bno}</td>
								<td><a class="text-left" href="get?${pageDto.cri.link}&bno=${b.bno}">${b.title}</a>[${b.replyCnt}]</td>
								<td>${b.nickname}</td>
								<td>${b.regDate}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
			<div class="">
				<form action="list" class="form-inline justify-content-end my-3 " id="searchForm">
					<div class="form-check-inline">
						<label class="form-check-label">
							<input class="form-check-input" type="checkbox" name="type" value="T" ${fn:contains(page.cri.type,'T') ? 'checked' : ''}>제목
						</label>
					</div>
					<div class="form-check-inline">
						<label class="form-check-label">
							<input class="form-check-input" type="checkbox" name="type" value="C" ${fn:contains(page.cri.type,'C') ? 'checked' : ''}>내용
						</label>
					</div>
					<div class="form-check-inline">
						<label class="form-check-label">
							<input class="form-check-input" type="checkbox" name="type" value="N" ${fn:contains(page.cri.type,'N') ? 'checked' : ''}>작성자
						</label>
					</div>
					<div class="input-group mb-3 w-25 float-end">
						<input type="text" class="form-control" placeholder="Search" name="keyword" value="${pageDto.cri.keyword}">
					<div class="input-group-append">
						<button class="btn btn-outline-danger" type="submit">검색</button>
					</div>
					</div>
					<input type="hidden" name="amount" value="${pageDto.cri.amount}">		
					<input type="hidden" name="pageNum" value="${pageDto.cri.pageNum}">		
					<input type="hidden" name="category" value="${pageDto.cri.category}">		
				</form>
			</div>	
			<div class="">
				<ul class="pagination justify-content-center">
					<li class="page-item ${pageDto.prevs ? '' : 'disabled'}"><a class="page-link" href="?pageNum=${pageDto.startPage-1}&${pageDto.cri.pageLink}"><i class="fas fa-angle-double-left"></i></a></li>
					<li class="page-item ${pageDto.prev ? '' : 'disabled'}"><a class="page-link" href="?pageNum=${pageDto.cri.pageNum-1}&${pageDto.cri.pageLink}"><i class="fas fa-angle-left"></i></a></li>
					<c:forEach begin="${pageDto.startPage}" end="${pageDto.endPage}" var="i">
						<li class="page-item ${pageDto.cri.pageNum == i ? 'active' : ''}"><a class="page-link" href="?pageNum=${i}&${pageDto.cri.pageLink}&">${i}</a></li>
					</c:forEach>
					<li class="page-item ${pageDto.next ? '' : 'disabled'}"><a class="page-link" href="?pageNum=${pageDto.cri.pageNum+1}&${pageDto.cri.pageLink}"><i class="fas fa-angle-right"></i></a></li>
					<li class="page-item ${pageDto.nexts ? '' : 'disabled'}"><a class="page-link" href="?pageNum=${pageDto.endPage+1}&${pageDto.cri.pageLink}"><i class="fas fa-angle-double-right"></i></a></li>
				</ul>
			</div>
		</div>
	</div>
	</div>
</div>
 <!-- Footer -->
<jsp:include page="../includes/footer.jsp"></jsp:include>
<!-- 페이지 상단으로 이동 버튼 -->
<button type="button" class="btn btn-dark btn-floating rounded-5 " id="btn-back-to-top"><i class="fas fa-arrow-up"></i></button>
<!-- 스크롤 내렸을때 페이지 상단 -->
<script>
$("#searchForm button").click(function() {
	if(!$("#searchForm :checkbox:checked").length) { // 0개 일떄 선택 안될 때 발생
		alert("검색 종류를 선택하세요")
		return false;
	}
	if(!$("#searchForm :text").val().trim()) { // 입력 내용이 없을 때 발생
		alert("키워드를 입력하세요")
		return false;
	}
});
</script>
<script>
	let mybutton = document.getElementById("btn-back-to-top");
	
	window.onscroll = function () {
	  scrollFunction();
	};
	
	function scrollFunction() {
	  if (
	    document.body.scrollTop > 20 ||
	    document.documentElement.scrollTop > 20) 
	  {
	    mybutton.style.display = "block";
	  }
	  else {
	    mybutton.style.display = "none";
	  	}
	}
	mybutton.addEventListener("click", backToTop);
	
	function backToTop() {
	  document.body.scrollTop = 0;
	  document.documentElement.scrollTop = 0;
	}
</script>
</body>
</html>