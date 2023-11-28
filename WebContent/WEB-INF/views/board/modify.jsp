<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko" data-bs-theme="dark">
<head>
	<meta charset='utf-8'>
    <meta http-equiv='X-UA-Compatible' content='IE=edge'>
    <title>Page Title</title>
    <meta name='viewport' content='width=device-width, initial-scale=1'>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css" rel="stylesheet">
    <link rel="stylesheet" href="./style.css">
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
	<div id="wrapper">
		<!-- Content Wrapper -->
		<div id="content-wrapper" class="d-flex flex-column">
			<!-- Main Content -->
			<div id="content">
				<!-- Begin Page Content -->
				<div class="container-sm p-3">
					<!-- DataTales Example -->
					<!-- 기본이 12분할이고, col-9이면 12분할에서 9을 차지하겠다는 것이다 -->
					<div class="col-9 mx-auto">
						<!-- Page Heading -->
						<h1 class="h3 mb-2 text-gray-800">게시글 수정 페이지</h1>
						<div class="card shadow mb-4">
							<div class="card-header py-3">
								<h6 class="m-0 font-weight-bold text-primary">Board Modify Page</h6>
							</div>
							<div class="card-body">
								<form method="post">
									<div class="form-group">
										<label for="bno">Bno</label> <input class="form-control"
											id="bno" name="bno" value="${board.bno}" readonly>
									</div>
									<div class="form-group">
										<label for="title">제목</label> <input class="form-control"
											id="title" name="title" value="${board.title}">
									</div>
									<div class="form-group">
										<label for="boardContent">내용</label>
										<textarea class="form-control" id="boardContent"
											name="content" rows="10">${board.content}</textarea>
									</div>
									<div class="form-group">
										<label for="userno">작성자</label> <input class="form-control"
											id="userno" name="userno" value="${board.nickname}" readonly>
									</div>
									<input type="hidden" name="userno" value="${board.userno}">
									<input type="hidden" name="bno" value="${board.bno}">
									<input type="hidden" name="category" value="${cri.category}">
									<input type="hidden" name="pageNum" value="${cri.pageNum}">
									<input type="hidden" name="amount" value="${cri.amount}">	
									<input type="hidden" name="type" value="${cri.type}">	
									<input type="hidden" name="keyword" value="${cri.keyword}">	

									<button class="btn btn-warning" formaction="modify"
										id="btnBoardSubmit">수정</button>
									<button class="btn btn-danger" formaction="remove">삭제</button>
									<a class="btn btn-info" href="list">목록</a>
								</form>
							</div>
						</div>
						<!-- <div class="card shadow mb-4">
							<div class="card-header py-3">
								<h6 class="m-0 font-weight-bold text-primary">File Attach</h6>
							</div>
							<div class="card-body">
								<div class="input-group">
									<div class="custom-file">
										<input type="file" class="custom-file-input" id="files"
											name="files" multiple> <label for="files"
											class="custom-file-label">Choose Files</label>
									</div>
								</div>
								<div class="upload-wrapper">
									<div class="uploadResult mt-3">
										<ul class="list-group">
										</ul>
									</div>
									<div class="thumbResult mt-3">
										<ul class="list-unstyled row">
										</ul>
									</div>
								</div>
							</div>
						</div> -->
					</div>
				</div>
				<!-- /.container-fluid -->
			</div>
			<!-- Footer -->
    		<jsp:include page="../includes/footer.jsp"></jsp:include>
			<!-- 페이지 상단으로 이동 버튼 -->
  			<button type="button" class="btn btn-dark btn-floating rounded-5 " id="btn-back-to-top"><i class="fas fa-arrow-up"></i></button>
		</div>
		<!-- End of Content Wrapper -->
	</div>
</body>
</html>