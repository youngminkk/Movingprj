<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html data-bs-theme="dark">
<head>
    <meta charset='utf-8'>
    <meta http-equiv='X-UA-Compatible' content='IE=edge'>
    <title>Moving 영화조회</title>
    <meta name='viewport' content='width=device-width, initial-scale=1'>
    <link rel="icon" href="data:;base64,iVBORw0KGgo=">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css" rel="stylesheet">
    <link rel="stylesheet" href="/css/style.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>   
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
</head>
<body>
		<!-- admin 헤더 -->
	<jsp:include page="../includes/adminHeader.jsp"></jsp:include>
		
    <div class="d-flex">
    
       <!-- admin 사이드바 -->
     <jsp:include page="../includes/adminSidebar.jsp"></jsp:include>
     
     
      <main class="w-100 ">
        <div class="container ml-5">
            <div class="container">
                <div class="container-fluid p-0">
                        <div class="">
                            <div class="card relative d-flex border-0 ">
                                <div class="card-header pb-0 rounded">
                                    <div class="card-actions float-right">
                    					<h1 class="h3 mb-3 text-center">영화 조회</h1>
                                    </div>
                                </div>
                                <div class="card-body">

									<!--영화 검색 -->
									<form action="/admin/movie/list" method="get" id="searchForm">
										<div class="input-group">
											<input type="hidden" name="pageNum"
												value="${pageDTO.cri.pageNum}"> <input type="hidden"
												name="amount" value="${pageDTO.cri.amount}"> <input
												class="form-control border-end-0 border rounded-pill"
												type="search" placeholder="영화를 입력하세요" name="keyword"
												value="${pageDTO.cri.keyword}"> <span
												class="input-group-append">
												<button
													class="btn btn-outline-secondary bg-white border-bottom-0 border rounded-pill ms-n5"
													type="submit" id="searchButton">
													<i class="fa fa-search"></i>
												</button>
											</span>
										</div>
									</form>
									<table class="table table-striped w-100 movie-list">								
                                        <thead>
                                            <tr>
                                                <th>영화번호</th>
                                                <th>제목</th>
                                                <th>상영시간</th>
                                                <th>개봉일</th>
                                                <th>국가분류</th>
                                                <th>상영여부</th>
                                            </tr>
                                        </thead>
                                        <tbody>										
											<c:forEach items="${list}" var="mv">
												<tr>
                                             		<td data-field="id">${mv.mno}</td>
													<td data-field="title">${mv.title}</td>
													<td data-field="runtime">${mv.runningTime}분</td>
													<td data-field="release_date"><fmt:formatDate value="${mv.mdate}" pattern="MM/dd/yyyy" /></td>
													<td data-field="original_language">${mv.language}</td>
													<td data-field="status">${mv.status}</td>
												</tr>
                                           </c:forEach>
												<c:if test="${empty list}">
													<tr>
														<td colspan="6">일치하는 영화가 없습니다</td>
													</tr>
												</c:if>
											</tbody>
                                    </table>
                                </div>
								</div>
								<div class="container d-flex justify-content-center ">
								<nav aria-label="Page navigation example">
								<ul class="pagination justify-content-center">
			                 		  <%-- <li class="page-item ${prev.prevs ? '' : 'disabled'}"><a class="page-link" href="${pageDTO.cri.memberLink}?admin?pageNum=${pageDTO.startPage-1}"><i class="fas fa-angle-double-left"></i></a></li> --%>
			                  		  <li class="page-item ${pageDTO.prev ? '' : 'disabled'}"><a class="page-link" href="?pageNum=${pageDTO.cri.pageNum - 1}&amount=${pageDTO.cri.amount}&keyword=${pageDTO.cri.keyword}"><i class="fas fa-angle-left"></i></a></li>
			                    		<c:forEach begin="${pageDTO.startPage}" end="${pageDTO.endPage}" var="i">
		                      	  	  		<li class="page-item ${pageDTO.cri.pageNum == i ? 'active' : ''}">
		                      	  	  		 <a class="page-link" href="?pageNum=${i}&amount=${pageDTO.cri.amount}&keyword=${pageDTO.cri.keyword}">${i}</a></li>
		                      	  		</c:forEach>
			                    	<li class="page-item ${pageDTO.next ? '' : 'disabled'}"><a class="page-link" href="?pageNum=${pageDTO.cri.pageNum + 1}&amount=${pageDTO.cri.amount}&keyword=${pageDTO.cri.keyword}"><i class="fas fa-angle-right"></i></a></li>
	                          		<%-- <li class="page-item ${pageDTO.nexts ? '' : 'disabled'}"><a class="page-link" href="?${pageDTO.cri.memberLink}&pageNum=${pageDTO.endPage+1}"><i class="fas fa-angle-double-right"></i></a></li> --%>
			            		</ul>
								</nav>
								</div>
							</div>
							
							<!-- Modal -->
						<%-- <jsp:include page="../includes/modal.jsp"></jsp:include> --%>
							<!-- 모달 끝 -->
                </div>
            </div>
        </div>
		</main>
			<div class="justify-content-end flex-row-reverse w-25">
				<div class="card border-0 rounded ms-auto ">
					<div class="card-header rounded">
						<div class="card-actions float-right"></div>
						<h5 class="card-title mb-0 text-center">영화 상세조회</h5>
					</div>
					<div class="card-body ">
						<div class="row g-0">
							<div class="text-center">
								<img src="https://bootdey.com/img/Content/avatar/avatar3.png"
									width="100" height="100" class="rounded-circle mb-3"
									alt="Angelica Ramos">
							</div>
							<div class="col-sm-9 col-xl-12 col-xxl-9"></div>
						</div>
						<div id="movieDetailContainer">
						</div>
					</div>
				</div>
			</div>
    </div>
  </body>

<script>
$(document).ready(function() {
	 // 필드 이름 및 매핑
    var mno;
    var fields = {
        id: "영화번호",
        title: "제목",
        runtime: "상영시간",
        release_date: "개봉일",
        rated: "시청연령",
        original_language: "국가분류",
        overview: "개요",
        status: "상영여부",
    };
    // userno 파라미터로 받아 유저상세정보를 요청
    function requestMovieDetail(mno) {
        $.ajax({
            url : '/admin/movie/detail',
            type : 'GET',
            data : { mno : mno },
            dataType: 'json',
            success : displayMovieDetail,
            error: function(jqXHR, textStatus, errorThrown) { 
                console.error("AJAX 호출 실패: ", textStatus, ", 오류: ", errorThrown);
            }
        });
    }
    // 화면에 표시
    function displayMovieDetail(movieInfo) {
        $(".movie-detail input").val("");
        console.log("서버 응답: ", movieInfo); 

        if (movieInfo === null || movieInfo === undefined) {
            console.error("movieInfo is null or undefined");
            return;
        }

        var movieDetailContainer = $("#movieDetailContainer");
        movieDetailContainer.empty();  

        $.each(fields, function(field, label) {
            var value = movieInfo[field] !== undefined ? movieInfo[field] : "";  
            console.log(field, ' = ', value);

            var inputGroup = $("<div></div>").addClass("input-group mb-3");
            var inputGroupPrepend = $("<div></div>").addClass("input-group-prepend");
            var span = $("<span></span>").addClass("input-group-text").text(label);
            var input = $("<input>").attr({
                type : "text",
                "data-field" : field,
                class: "form-control"
            }).css("width","73%").val(value);

            inputGroupPrepend.append(span);
            inputGroup.append(inputGroupPrepend, input);
            movieDetailContainer.append(inputGroup);
        });
		//수정버튼 클릭이벤트
        var updateButton = $("<button></button>").addClass("btn btn-danger").text("수정");
        updateButton.click(updateMovieInfo);
        movieDetailContainer.append(updateButton);
    }

    function updateMovieInfo() {
        var updatedInfo = {};
        var inputElements = $("#movieDetailContainer").find("[data-field]");

        inputElements.each(function() {
            var inputElement = $(this);
            var field = inputElement.data('field');
            var value = inputElement.val();
            updatedInfo[field] = value;
        });

        console.log('updatedInfo: ', updatedInfo);
		//수정 정보 있으면 업데이트 요청
        if (Object.keys(updatedInfo).length > 0) {
            $.ajax({
                url : '/admin/movie/update',
                type : 'PUT',
                data : JSON.stringify(updatedInfo),
                contentType : 'application/json;charset=UTF-8',
                success : function(result) {
                    alert("영화 정보가 업데이트되었습니다.");
                    //업데이트 성공시 정보 재조회
                    requestMovieDetail(mno);
                },
                error : function() {
                    alert("회원 정보 업데이트에 실패하였습니다.");
                }
            });
        } else {
            alert("수정할 데이터가 없습니다.");
        }
    }
    //  목록의 행 클릭 이벤트 
	$(".movie-list tr").on('mouseover', function() {
    	$(this).css('cursor', 'pointer');
	})
	.on('mouseout', function() {
    	$(this).css('cursor', 'auto');
	})
	.on('click', function() {
   		$(".movie-list tr").removeClass("table-active");
    	$(this).addClass("table-active");
    	
        mno = $(this).find("td:first-child").text(); 
        if (mno) requestMovieDetail(mno);
    });
});
</script>
<script>
/* 검색시 1페이지로 이동 */
$(document).ready(function() {  
    $('#searchForm').submit(function(e) {
        e.preventDefault(); 
        // 검색어를 입력하면 페이지 번호를 1로 설정
        $('input[name="pageNum"]').val(1);
        this.submit();
    });
});
</script>
</html>