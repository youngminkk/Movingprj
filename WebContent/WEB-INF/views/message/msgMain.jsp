<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html data-bs-theme="dark">
<head>
<meta charset='utf-8'>
<meta http-equiv='X-UA-Compatible' content='IE=edge'>
<title>Page Title</title>
<meta name='viewport' content='width=device-width, initial-scale=1'>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script> 
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.0/css/all.min.css"/>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js"
	integrity="sha512-v2CJ7UaYy4JwqLDIrZUI/4hqeoQieOmAZNXBeQyjo21dadnwR+8ZaIJVT8EE2iyI61OV8e6M8PP2/4hpQINQ/g=="
	crossorigin="anonymous" referrerpolicy="no-referrer"></script>
</head>
<style>
.nav-pills #v-pills-receive-tab.active, #v-pills-send-tab.active, #v-pills-write-tab.active {
  background-color: gray;
}
</style>
<body>
	<!-- 헤더 -->
	<jsp:include page="../includes/header.jsp"></jsp:include>

	<div class="container h-100 pt-5 my-3">
		<div class="row pt-5 my-5">
			<div class="row p-2 border-bottom">
				<div class="col">
					<h3>쪽지함</h3>
				</div>
				
				<%-- 삭제버튼 --%>
				<div class="col">
					<div class="col float-end">
						<button id="deleteMsg" class="btn btn-secondary mx-1">선택삭제</button>
					</div>
				</div>
			</div>
			<div class="row p-0">
				<div class="d-flex p-0 col-2">
					
					<%-- 네비게이션 탭 --%>
					<div class="border-0 nav flex-column nav-pills text-center" id="v-pills-tab" role="tablist" aria-orientation="vertical">
						<button class="nav-link active text-light" type="button" id="v-pills-receive-tab" 
                            data-bs-toggle="pill" data-bs-target="#v-pills-receive" role="tab"
							aria-controls="v-pills-receive" aria-selected="true">받은 쪽지함</button> 
						<button class="nav-link text-light" type="button" id="v-pills-send-tab" 
							data-bs-toggle="pill"  data-bs-target="#v-pills-send" role="tab" aria-controls="v-pills-send"
							aria-selected="false">보낸 쪽지함</button>
						<button class="nav-link text-light" type="button" id="v-pills-write-tab" 
							data-bs-toggle="pill"data-bs-target="#v-pills-write" role="tab" aria-controls="v-pills-write"
							aria-selected="false">쪽지 쓰기</button>
					</div>
				</div>
				<div class="col-10">
					<div class="tab-content" id="v-pills-tabContent">
						<!-- 쪽지 목록 
							받은쪽지함-->
						<ul class="tab-pane fade show active" id="v-pills-receive" role="tabpanel" aria-labelledby="v-pills-receive-tab">
							<li class="list-group-item d-flex justify-content-between align-items-center border-bottom py-1">
								<input class="col-1 form-check-input receiveLeader" type="checkbox">
								<div class="col-4">제목</div>
								<div class="col-2">보낸이</div>
								<div class="col-3">날짜</div>
							</li>
							<c:forEach items="${receiList}" var="r">
								<li class="list-group-item d-flex justify-content-between align-items-center">
									<input class="col-1 form-check-input" name="msgnos" type="checkbox" value="${r.msgno}">
									<a href="${cp}/message/view?msgno=${r.msgno}" class="col-4 text-decoration-none text-light">${r.title}</a>
									<div class="col-2">${r.fromnick}</div>
									<div class="col-3"><fmt:formatDate pattern="yyyy-MM-dd" value="${r.regdate}"/></div>
								</li>
							</c:forEach>
						</ul>
						<!-- 보낸 쪽지함 -->
						<ul class="tab-pane fade" id="v-pills-send" role="tabpanel" aria-labelledby="v-pills-send-tab">
							<li class="list-group-item d-flex justify-content-between align-items-center border-bottom py-1">
								<input class="col-1 form-check-input sendLeader" type="checkbox">
								<div class="col-4">제목</div>
								<div class="col-2">받는이</div>
								<div class="col-3">날짜</div>
							</li>
							<c:forEach items="${sendList}" var="s">
                            <li class="list-group-item d-flex justify-content-between align-items-center">
                                <input class="col-1 form-check-input" name="msgnos" type="checkbox" value="${s.msgno}">
                                <a href="${cp}/message/view?msgno=${s.msgno}" class="col-4 text-decoration-none text-light">${s.title}</a>
                                <div class="col-2">${s.tonick}</div>
                                <div class="col-3"><fmt:formatDate pattern="yyyy-MM-dd" value="${s.regdate}"/></div>
                            </li>
							</c:forEach>
						</ul>
						
                        <!-- 쪽지쓰기 -->
						<div class="tab-pane fade" id="v-pills-write" role="tabpanel"
							aria-labelledby="v-pills-write-tab">
                            <div class="container">
                                <form method="post" class="row">
                                    <div class="col-8 border-bottom ps-5">
                                        <div class="row m-3">
                                        	<form>
	                                            <div class="col-2 px-0">
	                                                <div>받는이</div>
	                                            </div>
	                                            <%-- 닉네임을 통해 회원유무 확인 --%>
	                                            <div class="col input-group border-start">
	                                                <input type="text" class="rounded-3" name="tonick" id="tonick">
	                                                <div class="ms-2">
	                                                	<button type="button" class="btn btn-sm border-secondary rounded-4" id="msgMemberCheck">회원확인</button>
	                                                </div>
	                                                <i class="fas fa-check p-1 mt-1 ms-1 d-none" id="existMember"></i>
	                                                <div class="invalid-feedback col ps-2" id="nickFeedback">존재하지 않는 회원입니다.</div>
	                                            </div>
                                        	</form>
                                        </div>
                                        <div class="row m-3">
                                            <div class="col-2 px-0">
                                                <div>제목</div>
                                            </div>
                                            <div class="col input-group border-start">
                                                <input type="text" name="title" class="rounded-3">
                                            </div>
                                        </div>
                                        <div class="row m-3">
                                            <div class="col-2 py-5 px-0">
                                                <div class="my-5 small">쪽지내용</div>
                                            </div>
                                            <div class="col input-group border-start">
                                                <textarea name="content" cols="60" rows="10"></textarea>
                                            </div>
                                        </div>
                                        <input hidden name="fromnick" value="${member.nickname}">
                                        <div class="row text-center my-3">
                                            <div class="col-11 ps-5">
                                                <button id="writeBtn" class="btn btn-outline-light" type="submit">보내기</button>
                                            </div>
                                        </div>
                                    </div>
                                </form>
                            </div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 푸터 -->
	<jsp:include page="../includes/footer.jsp"></jsp:include>
</body>
<script>
	$(function() {
		/* 전체 체크 */
		 $(".sendLeader").change(function() {
		      $("#v-pills-send :checkbox:not(.sendLeader)").prop("checked", $(this).is(":checked")) 
		  })
		 $(".receiveLeader").change(function() {
		      $("#v-pills-receive :checkbox:not(.receiveLeader)").prop("checked", $(this).is(":checked")) 
		  })
		
		
		/* 쪽지삭제 */
		$("#deleteMsg").click(function() {
			if(!confirm("삭제하시겠습니까?")) {
				return false;
			}
			var msgnos = [];
	      $("li :checkbox:not(.sendLeader, .receiveLeader):checked").each(function() {
	          msgnos.push($(this).val());
	      })
	      console.log(msgnos)
	      console.log("msgnos : " + msgnos)
			$.ajax({
			      method : "post",
			      url : '/message/remove',
			      traditional : true,
			      data : {msgnos:msgnos}
			    }).done(function(result) {
			    	location.reload();
					alert("삭제 완료했습니다")
				})
		})
		
        
        /* 회원확인 */
		$("#msgMemberCheck").click(function() {
			const tonick = $("#tonick").val();
			console.log(tonick)
			$.post("/message/memberCheck", {tonick:tonick}, function(data) {
				if(data.available == "1") {
					$("#tonick").removeClass("is-invalid").addClass("is-valid")
					$("#existMember").removeClass("d-none").addClass("d-block");
					$("#nickFeedback").css("display", "none");
				}
				else {
					$("#tonick").removeClass("is-valid").addClass("is-invalid")
					$("#existMember").removeClass("d-block").addClass("d-none");
					$("#nickFeedback").css("display", "inline-block");
				}
			})
		})
		
		/* 쪽지발송 */ 
		$("#writeBtn").click(function () {
	        console.log("전송이벤트");
	        if($(".is-valid").length < 1) {
	        	alert("받는이를 다시 확인해주세요.")
	            console.log("막음");
	            event.preventDefault();
	            return false;
	        }
	        $("#writeBtn").submit();
	        console.log("전송");
	    })
	});
</script>
</html>