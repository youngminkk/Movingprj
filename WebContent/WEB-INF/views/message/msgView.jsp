<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<body>
	<!-- 헤더 -->
	<jsp:include page="../includes/header.jsp"></jsp:include>

	<div class="container h-100 pt-5 my-3">
		<div class="row pt-5 my-5">
			<div class="row p-2 border-bottom">
				<div class="col">
					<h3>쪽지함</h3>
				</div>
			</div>
		</div>
		<div class="row p-5 m-5">
            <div class="content border-top border-2">
                <div class="p-3">
                    <div>제목 : ${msg.title}</div>
                </div>
                <div class="p-3 row justify-content-between border-top border-bottom">
                    <div class="col">
                        <div>${member.nickname == msg.fromnick ? '받는이' : '보낸이'} : ${member.nickname == msg.fromnick ? msg.tonick : msg.fromnick}</div>
                    </div>
                    <div class="col text-end">
                        <div>날짜 : <fmt:formatDate pattern="yyyy/MM/dd" value="${msg.regdate}"/></div>
                    </div>
                </div>
                <div class="p-3">
                    <div class="border-bottom">내용</div>
                    <div>${msg.content}</div>
                </div>
                <div class="row border-top">
                    <div class="text-end p-2">
                        <a href="${cp}/message" class="btn btn-secondary text-decoration-none">목록</a>
                        <a href="${cp}/message/remove?msgno=${msg.msgno}" class="btn btn-danger text-decoration-none">삭제</a>
                    </div>
                </div>
            </div>
		</div>
	</div>
	<!-- 푸터 -->
	<jsp:include page="../includes/footer.jsp"></jsp:include>
</body>
</html>