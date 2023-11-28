<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html data-bs-theme="dark">
<head>
    <meta charset='utf-8'>
    <meta http-equiv='X-UA-Compatible' content='IE=edge'>
    <title>로그인</title>
    <meta name='viewport' content='width=device-width, initial-scale=1'>
    <link rel="stylesheet" href="/css/style.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin >
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js"
        integrity="sha512-v2CJ7UaYy4JwqLDIrZUI/4hqeoQieOmAZNXBeQyjo21dadnwR+8ZaIJVT8EE2iyI61OV8e6M8PP2/4hpQINQ/g=="
        crossorigin="anonymous" referrerpolicy="no-referrer"></script>    
</head>
<body>
  <!-- 헤더 -->
  <jsp:include page="../includes/header.jsp"></jsp:include>
	<section class="bg-image">
		<div class="container h-100">
	    	<div class="row justify-content-center align-items-center mt-5">
	        	<div class="col-md-6 my-5">
	            	<div class="card border-0 mt-5 p-3">
						<form method="post" class="row g-3 needs-validation" novalidate>
						
							<%-- 아이디 --%>
	                    	<h1 class="mb-5 text-center">Login</h1>
	                    	<div class="small mb-5 invalid-feedback" id="useridFeedback">아이디 또는 비밀번호를 잘못 입력했습니다.</div>
	                    	<div class="mb-4 position-relative">
	                        	<label class="form-label fs-5 fw-bold text-muted-50 fst-italic" for="loginName"><i class="fas fa-user"></i> 아이디</label>
	                        	<input type="text" class="form-control p-3 mt-1 border-white rounded-3" name="userid" id="userid" placeholder="아이디를 입력하세요" required>
	                    	</div>
	                    	
	                    	<%-- 비밀번호 --%>
	                    	<div class="mb-4 position-relative">
		                        <label class="form-label fs-5 fw-bold text-muted-50 fst-italic" for="loginPassword"><i class="fas fa-key"></i> 비밀번호</label>
		                        <input type="password" class="form-control p-3 mt-1 border-white rounded-3" name="password" id="loginPassword" placeholder="비밀번호를 입력하세요" required>
	                    	</div>
		                    <div class="mb-4 d-flex justify-content-between">
		                    
		                    	<%-- 비밀번호찾기 --%>
		                        <a class="small text-muted text-decoration-none fw-bold fs-8 ml-2" href="${cp}/member/findpassword"><i class="fas fa-unlock-alt"></i> 비밀번호 찾기</a>
		                        
		                        <%-- 회원가입 --%>
		                        <a class="text-white-50 fw-bold text-decoration-none fs-6" href="${cp}/member/signup"><i class="fas fa-user-plus"></i> 회원가입</a>
		                    </div>
		                    <div class="mb-3 text-center">
		                        <button type="submit" class="btn btn-outline-light btn-lg px-5 fs-5 fw-bold rounded-4 "id="loginBtn"><i class="fas fa-sign-in-alt"></i> 로그인</button>
		                    </div>
						</form>
	            	</div>
				</div>
	    	</div>
		</div> 
	</section>
      <!-- 푸터 -->
  <jsp:include page="../includes/footer.jsp"></jsp:include>  
  
</body>
</html>