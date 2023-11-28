<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="ko" data-bs-theme="dark">
<head>
	<meta charset='utf-8'>
    <meta http-equiv='X-UA-Compatible' content='IE=edge'>
    <title>Page Title</title>
    <meta name='viewport' content='width=device-width, initial-scale=1'>
    <link rel="stylesheet" href="/css/style.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css" rel="stylesheet">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>   
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.4/moment-with-locales.min.js" integrity="sha512-42PE0rd+wZ2hNXftlM78BSehIGzezNeQuzihiBCvUEB3CVxHvsShF86wBWwQORNxNINlBPuq7rG4WWhNiTVHFg==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <script src="${cp}/js/reply.js"></script>
	<jsp:include page="../includes/replymodal.jsp"></jsp:include>
</head>
<body class="pt-5">
	<!-- 헤더 -->
	<jsp:include page="../includes/header.jsp"></jsp:include>
	<div id="content-wrapper" class="d-flex flex-column">
            <!-- Main Content -->
            <div id="content">
                <div class="container-sm p-3">
                    <!-- DataTales Example -->
                    <!-- 기본이 12분할이고, col-9이면 12분할에서 9을 차지하겠다는 것이다 -->
                    <div class="col-9 mx-auto">
	                    <!-- Page Heading -->
	                    <h1 class="h3 mb-2 text-gray-800">상세 페이지</h1>                   
	                    <div class="card shadow mb-4">
	                        <div class="card-header py-3">
	                            <h6 class="m-0 font-weight-bold text-primary">Board Register</h6>
	                        </div>
	                        <div class="card-body">
	                        	<form method="post">
		                        	<div class="form-group">
			                        	<label for="bno">Bno</label>
			                        	<input class="form-control" id="bno" name="bno" value="${board.bno}" readonly>
		                        	</div>
		                        	<div class="form-group">
			                        	<label for="title">제목</label>
			                        	<input class="form-control" id="title" name="title" value="${board.title}" readonly>
		                        	</div>
		                        	<div class="form-group">
			                        	<label for="boardContent">내용</label>
			                        	<textarea class="form-control" id="boardContent" name="content" rows="10" readonly>${board.content}</textarea>
		                        	</div>
		                        	<div class="form-group">
			                        	<label for="nickname">작성자</label>
			                        	<input class="form-control" id="nickname" name="nickname" value="${board.nickname}" readonly>
		                        	</div>
		                        	<a class="btn btn-primary" href="modify?bno=${board.bno}&${cri.link}">수정</a>
		                        	<a class="btn btn-info" href="list${criteria.link}">목록</a>
	                        	</form>
	                        </div>
	                    </div>
	                    <!-- <div class="card shadow mb-4">
	                        <div class="card-header py-3">
	                            <h6 class="m-0 font-weight-bold text-primary">File Attach</h6>
	                        </div>
	                        <div class="card-body">
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
	                    <div class="card shadow mb-4">
	                        <div class="card-header py-3">
	                            <h6 class="m-0 mt-2 font-weight-bold text-primary float-start">Reply</h6>
	                            <button type="button" class="btn btn-primary float-end btn-sm" id="addReplyBtn"	>New Reply</button>
	                        </div>
	                        <div class="card-body py-0">
	                        	<ul class="chat list-group list-group-flush">
	                        		<li data-rno="10"  class="list-group-item px-0"></li>
	                        	</ul>
	                        </div>
	                     	<div class="card-footer reply-page">Panel Footer</div>
	                     </div>
                    </div>
                </div>
                <!-- /.container-fluid -->
            </div>
            <!-- End of Main Content -->
			<jsp:include page="../includes/footer.jsp"></jsp:include>
        </div>
        <!-- End of Content Wrapper -->
    <!-- End of Page Wrapper -->
    <!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#page-top">
        <i class="fas fa-angle-up"></i>
    </a>
</body>
<script>
//댓글 목록
const bno = '${board.bno}';		
var pageNum = 1;
showList(1);
function showList(page) {
	console.log(page);
	
	boardreplyService.getList({bno:bno, page:page}, function(replyCnt, list) {
		console.log(replyCnt);
		if(page == -1) {
			pageNum = Math.ceil(replyCnt / 10);
			showList(pageNum);
			return;
		}
		let str ="";
		for(let r of list) {
			str += `
        		<li data-rno="\${r.rno}" class="list-group-item px-0">
    			<div class="header">
    				<strong>\${r.nickname}</strong>
    				<small class="float-right text-muted">\${boardreplyService.displayTime(r.replyDate)}</small>
    			</div>
    			<p>\${r.comment}</p>
    		</li>`;
		}
		$(".chat").html(str);
	})
}
//댓글 작성 버튼 클릭 이벤트
$("#addReplyBtn").click(function() {
	$("#replyModal input");
	$("#userno").prop("readonly", true);
	$("#regDate").closest("div").hide();
	$("#replyModal").find(".modal-footer button").hide().filter(":gt(1)").show();
	$("#replyModal").modal("show");
});
//댓글 작성 이벤트
$("#replyModal").find(".modal-footer button").eq(2).click(function() {
	const comment = $("#comment").val();
	const userno = $("#userno").val();
	let r = {comment, userno, bno};
	console.log(r);
	$("#replyModal").modal("hide");
	boardreplyService.add(r, function(result) {
		showList(-1)
	});
});
//댓글 클릭 이벤트
$(".chat").on("click", "li", function() {
	const rno = $(this).data("rno");
	console.log(rno);
	boardreplyService.get(rno, function(data) {
		console.log(data);
		$("#comment").val(data.comment);//.prop("readonly", true);
		$("#userno").val(data.userno);//.prop("readonly", true);
		$("#regDate").val(boardreplyService.displayTime(data.replyDate)).prop("readonly", true).closest("div").show();
		$("#replyModal").modal("show").data("rno", rno);
		$("#replyModal").find(".modal-footer button").show().eq(2).hide();
	})
});
//댓글 수정 버튼 클릭 이벤트
$("#replyModal").find(".modal-footer button").eq(0).click(function() {
	if(!confirm("수정 하시겠습니까?")) return;
	const rno = $("#replyModal").data("rno");
	const comment = $("#comment").val();
	const r = {rno:rno, comment:comment};
	console.log(r);
	boardreplyService.modify(r, function(data) {
		$("#replyModal").modal("hide");
		showList(pageNum);
	})
});
//댓글 삭제 버튼 클릭 이벤트
$("#replyModal").find(".modal-footer button").eq(1).click(function() {
	if(!confirm("삭제 하시겠습니까?")) return;
	const rno = $("#replyModal").data("rno");
	console.log(rno);
	boardreplyService.remove(rno, function(data) {
		$("#replyModal").modal("hide");
		showList(pageNum);
	})
});
</script>
</html>