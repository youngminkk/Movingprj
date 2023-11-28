<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html data-bs-theme="dark">
<head>
    <meta charset='utf-8'>
    <meta http-equiv='X-UA-Compatible' content='IE=edge'>
    <title>Moving 회원삭제</title>
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
                   
						<!--회원 검색 -->
						<form action="/admin/member/delete" method="get" id="searchForm">
							<div class="input-group">
								<input type="hidden" name="pageNum"
									value="${pageDTO.cri.pageNum}"> <input type="hidden"
									name="amount" value="${pageDTO.cri.amount}"> <input
									class="form-control border-end-0 border rounded-pill"
									type="search" placeholder="이름을 입력하세요" name="keyword"
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
					
						<form action="/admin/member/delete" method="delete" id="deleteForm">						
                        <table class="table table-striped table-hover w-100 member-list table-sm">                               
                            <thead class="table-dar">
                                <tr>
                                	<th><input type="checkbox" id="selectAllCheckbox"></th>                               
                                    <th>번호</th>
                                    <th>아이디</th>
                                    <th>닉네임</th>
                                    <th>이름</th>
                                    <th>Email</th>
                                    <th>전화번호</th>
                                    <th>회원생성일</th>
                                   	<th><button type="button" class="btn btn-danger p-1" id="deleteSelectedBtn" disabled>회원 삭제</button></th>
                                </tr>
                            </thead>
                            <tbody>
									<c:forEach items="${list}" var="m">
										<tr class="member-row">
											<td><input type="checkbox" class="delete-checkbox" data-userno="${m.userno}"></td>
											<td data-field="userno">${m.userno}</td>
											<td data-field="userid">${m.userid}</td>
											<td data-field="nickname">${m.nickname}</td>
											<td data-field="username">${m.username}</td>
											<td data-field="email">${m.email}</td>
											<td data-field="number">${m.number}</td>
											<td data-field="regdate"><fmt:formatDate value="${m.regdate}" pattern="yy/MM/dd" /></td>
											<td><button type="button" class="btn btn-danger delete-btn" data-userid="${m.userno}">삭제</button></td>
										</tr>
									</c:forEach>
									<c:if test="${empty list}">
                                    <tr>
                                        <td colspan="7">일치하는 회원이 없습니다</td>
                                    </tr>
                                </c:if>
                            </tbody>
                        </table>
                    </form>
                </div>
            </div>
           </div>
				<div class="container d-flex justify-content-center ">
					<nav aria-label="Page navigation example">
						<ul class="pagination justify-content-center">
							<%-- <li class="page-item ${prev.prevs ? '' : 'disabled'}"><a class="page-link" href="${pageDTO.cri.memberLink}?admin?pageNum=${pageDTO.startPage-1}"><i class="fas fa-angle-double-left"></i></a></li> --%>
							<li class="page-item ${pageDTO.prev ? '' : 'disabled'}"><a
								class="page-link"
								href="?pageNum=${pageDTO.cri.pageNum - 1}&amount=${pageDTO.cri.amount}&keyword=${pageDTO.cri.keyword}"><i
									class="fas fa-angle-left"></i></a></li>
							<c:forEach begin="${pageDTO.startPage}" end="${pageDTO.endPage}"
								var="i">
								<li
									class="page-item ${pageDTO.cri.pageNum == i ? 'active' : ''}">
									<a class="page-link"
									href="?pageNum=${i}&amount=${pageDTO.cri.amount}&keyword=${pageDTO.cri.keyword}">${i}</a>
								</li>
							</c:forEach>
							<li class="page-item ${pageDTO.next ? '' : 'disabled'}"><a
								class="page-link"
								href="?pageNum=${pageDTO.cri.pageNum + 1}&amount=${pageDTO.cri.amount}&keyword=${pageDTO.cri.keyword}"><i
									class="fas fa-angle-right"></i></a></li>
							<%-- <li class="page-item ${pageDTO.nexts ? '' : 'disabled'}"><a class="page-link" href="?${pageDTO.cri.memberLink}&pageNum=${pageDTO.endPage+1}"><i class="fas fa-angle-double-right"></i></a></li> --%>
						</ul>
					</nav>
				</div>
    		</main>
		</div>
</body>
<script>
$(document).ready(function() {
    // 체크박스 클릭 이벤트 처리
    $('.delete-checkbox').on('change', function() {
        updateDeleteButtonState(); 
    });

    // 행 클릭 시 체크박스 체크/해제
    $('.member-row').on('click', function(e) {
        if (!$(e.target).is('input, button')) {
            var checkbox = $(this).find('.delete-checkbox');
            checkbox.prop('checked', !checkbox.prop('checked'));
            updateDeleteButtonState();  
        }
    });

    // "전체 선택" 체크박스 클릭 이벤트 처리
    $('#selectAllCheckbox').on('change', function() {
        var checked = $(this).prop('checked');
        $('.delete-checkbox').prop('checked', checked);
        updateDeleteButtonState();  
    });


    // 선택된 회원 삭제 버튼 클릭 이벤트 처리
    $('#deleteSelectedBtn').on('click', function() {
    	 if (confirm('선택한 회원을 삭제하시겠습니까?')) {  
        var usernos = $('.delete-checkbox:checked').map(function() {
            return $(this).data('userno');
        }).get();

        deleteMembers(usernos); 
  	  }
    });

    // 개별 삭제 버튼 클릭 이벤트 처리
    $('.delete-btn').on('click', function() {
    	if (confirm('해당 회원을 삭제하시겠습니까?')) {
        var userno = $(this).data('userid');
        
        deleteMembers([userno]); 
    	}
    });
    
    // 회원 삭제 
    function deleteMembers(usernos) {
    	console.log("회원 삭제 요청을 보냅니다. 회원 번호: ", usernos);  
        $.ajax({
            url: '/admin/member/delete',
            type: 'DELETE',
            data: JSON.stringify(usernos),
            contentType: 'application/json',
            success: function(result) {
                if (result) {
                    alert("성공적으로 회원을 삭제하였습니다.");
                    location.reload();
                } else {
                    alert("회원 삭제에 실패하였습니다.");
                }
            },
            error: function(jqXHR, textStatus, errorThrown) {
                console.log("회원 삭제 요청이 실패했습니다. 오류: ", textStatus, errorThrown); 
                alert("회원 삭제에 실패하였습니다.");
            }
        });
    }
    // 체크박스 상태에 따라 '회원 삭제' 
    function updateDeleteButtonState() {
        var checked = $('.delete-checkbox:checked').length > 0;
        $('#deleteSelectedBtn').prop('disabled', !checked);
    }
});
$('.delete-checkbox:checked').map(function() {
    return $(this).data('userno');
}).get();
</script>
</html>
