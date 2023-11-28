<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html data-bs-theme="dark">
<head>
    <meta charset='utf-8'>
    <meta http-equiv='X-UA-Compatible' content='IE=edge'>
    <title>공지사항</title>
    <meta name='viewport' content='width=device-width, initial-scale=1'>
    <link rel="stylesheet" href="/css/style.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin >
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>   

</head>


<body class="mt-5">
  <!-- 헤더 -->
  <jsp:include page="../includes/header.jsp"></jsp:include>
  
 <div class="my-5 py-5 container">
 
  <div class="wrap w-100 row">

	<jsp:include page="../includes/csnav.jsp"></jsp:include>
	
        <div class="">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12 ">
                        <div class="py-3 px-3 px-sm-0 mt-5">
                            <div class="">
                            <c:forEach var="notice" items="${notices}">
                                <div class="row p-3 mb-3 border border-2 border-secondary rounded-4 box-shadow-5" onclick="openModalForEditing(${notice.bno}, '${notice.nickname}', '${notice.title}', '${notice.content}')">
                                    <div class="col-lg-2 border-end  border-white">
                                        <div class="">                                       
                                            <div class="">
                                                <h5>${notice.bno}</h5>
                                                <p>${notice.nickname}<p>
                                            </div>
                                            <ul>
                                                <li><p><fmt:formatDate value="${notice.regDate}" pattern="yyyy-MM-dd" /><p></li>
                                            </ul>
                                        </div>
                                    </div>
                                    <div class="col-lg-10">
                                        <div class="fix fs-6 ">
                                            <h3>${notice.title}</h3>
                                            <p class="">${notice.content}</p>
                                            <div class=""></div>
                                        </div>
                                    </div>
                                </div>
                                </c:forEach>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
   <!-- 모달 버튼 -->
   <c:if test="${not empty member && member.isAdmin}">
    <button type="button" class="btn btn-primary btn-sm w-25" data-bs-toggle="modal" data-bs-target="#noticeModal" onclick="openModalForWriting()">공지사항작성</button>
   </c:if>
    </div>
</div>


<!-- 공지사항 작성 모달 -->
<c:if test="${not empty member && member.isAdmin}">
<div class="modal fade" id="noticeModal" tabindex="-1"
    aria-labelledby="noticeModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="noticeModalLabel">공지사항</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal"
                    aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form>
                    <div class="mb-3">
                        <label for="bno" class="form-label">글번호:</label>
                        <input type="text" class="form-control" id="bno" readonly>
                    </div>
                    <div class="mb-3">
                        <label for="nickname" class="form-label">닉네임:</label>
                        <input type="text" class="form-control" id="nickname" readonly>
                    </div>
                    <div class="mb-3">
                        <label for="title" class="form-label">제목:</label> 
                        <input type="text" class="form-control" id="title">
                    </div>
                    <div class="mb-3">
                        <label for="content" class="form-label">내용:</label>
                        <textarea class="form-control" id="content" rows="3"></textarea>
                    </div>
                </form>
            </div>

            <div class="modal-footer">
                <button id="modifybtn" class="btn btn-success" type="button" onclick="modifyNotice()">수정</button>
                <button id="deletebtn" class="btn btn-danger" type="button" onclick="deleteNotice()">삭제</button>
                <button id="submitbtn" type="button" class="btn btn-primary" onclick="submitNotice()">저장</button>
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
            </div>
        </div>
    </div>
</div>
</c:if>
	<!-- 푸터 -->
  <jsp:include page="../includes/footer.jsp"></jsp:include>
</body>

<script>
//공지사항 작성 모달 열때
$('#noticeModal').on('show.bs.modal', function (event) {
  var nickname = '<%= session.getAttribute("nickname") %>';
  $('#nickname').val(nickname); //모달창에 닉네임설정
});
//공지사항 작성
	function openModalForWriting() {
    var nickname = '<%= session.getAttribute("nickname") %>'; 
    $('#nickname').val(nickname); //모달창에 닉네임설정
    $('#bno').val(''); // 초기화
    $('#title').val(''); // 초기화
    $('#content').val(''); // 초기화

    $('#modifybtn').hide();
    $('#deletebtn').hide();
    $('#submitbtn').show();

    $('#noticeModal').modal('show');
}

// 공지사항 수정
	function openModalForEditing(bno, nickname, title, content) {
    $('#bno').val(bno);
    $('#nickname').val(nickname);
    $('#title').val(title);
    $('#content').val(content);

    $('#modifybtn').show();
    $('#deletebtn').show();
    $('#submitbtn').hide();

    $('#noticeModal').modal('show');
}
	function submitNotice() {
	  const nickname = document.getElementById('nickname').value;
	  const title = document.getElementById('title').value;
	  const content = document.getElementById('content').value;

	  const data = { nickname, title, content};

	  fetch('http://localhost:8080/customer/write', {  
	    method: 'POST',
	    headers: {
	      'Content-Type': 'application/json'
	    },
	    body: JSON.stringify(data)
	  }).then(response => {
	    if (response.ok) {
	      alert('공지사항이 작성되었습니다.');
	      location.reload(); 
	    } else {
	      alert('공지사항 작성에 실패하였습니다.');
	    }
	  });
	}
	function modifyNotice() {
	  const bno = document.getElementById('bno').value; 
	  
	  const updatedData = {
		bno,
	    nickname: document.getElementById('nickname').value,
	    title: document.getElementById('title').value,
	    content: document.getElementById('content').value
	  };

	  fetch(`http://localhost:8080/customer/modify`, {  
	    method: 'PUT',
	    headers: {
	      'Content-Type': 'application/json'
	    },
	    body: JSON.stringify(updatedData)
	  }).then(response => {
	    if (response.status === 200) {
	      alert('공지사항이 수정되었습니다.');
	      location.reload(); 
	    } else {
	      alert('공지사항 수정에 실패하였습니다.');
	    }
	  });
	}

	function deleteNotice() {
	  const bno = document.getElementById('bno').value; 

	  // 삭제 확인
	  if(!confirm('해당 공지사항을 정말로 삭제하시겠습니까?')) {
	    return;
	  }

	  fetch(`http://localhost:8080/customer/delete`, {  
	    method: 'DELETE',
	    headers: {
	     'Content-Type': 'application/json'
	     },
	     body: JSON.stringify({ bno: bno })
	  }).then(response => {
	    if (response.ok) {
	      alert('공지사항이 삭제되었습니다.');
	      location.reload(); 
	    } else {
	      alert('공지사항 삭제에 실패하였습니다.');
	    }
	  });
	}
</script>
</html>