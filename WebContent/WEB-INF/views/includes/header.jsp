<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
    <header class="mb-4">
        <nav class="navbar navbar-expand-sm navbar-dark bg-dark fixed-top mb-4">
            <div class="container-fluid mx-5">
                <a class="navbar-brand" href="/">
                    <img src="../image/movinlogo.png" alt="logo" width="150" height="65">
                </a>
                <button class="navbar-toggler collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#mynavbar"
                        aria-controls="mynavbar" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse d-lg-none"  id="mynavbar" style="justify-content: space-between;">
                    <ul class="navbar-nav d-flex">
                        <li class="nav-item" id="menu">
                            <a class="nav-link fs-5" href="${cp}/">Home</a>
                        </li>
                        <li class="nav-item dropdown" id="menu">
                            <a class="nav-link fs-5 " href="${cp}/movie/list?lang=ko" role="button">한국영화</a>
                            <ul class="dropdown-menu">
                                <li><a class="dropdown-item" href="http://localhost:8080/movie/list?g=27&lang=ko">공포</a></li>
                                <li><a class="dropdown-item" href="http://localhost:8080/movie/list?g=10749&lang=ko">로맨스</a></li>
                                <li><a class="dropdown-item" href="http://localhost:8080/movie/list?g=35&lang=ko">코미디</a></li>
                                <li><a class="dropdown-item" href="http://localhost:8080/movie/list?g=14&lang=ko">판타지</a></li>
                                <li><a class="dropdown-item" href="http://localhost:8080/movie/list?g=16&lang=ko">애니메이션</a></li>
                            </ul>
                        </li>
                        <li class="nav-item dropdown" id="menu">
                            <a class="nav-link fs-5" href="${cp}/movie/list?lang=en" role="button">외국영화</a>
                            <ul class="dropdown-menu">
                                <li><a class="dropdown-item" href="http://localhost:8080/movie/list?g=10751&lang=en">가족</a></li>
                                <li><a class="dropdown-item" href="http://localhost:8080/movie/list?g=28&lang=en">액션</a></li>
                                <li><a class="dropdown-item" href="http://localhost:8080/movie/list?g=10749&lang=en">로맨스</a></li>
                                <li><a class="dropdown-item" href="http://localhost:8080/movie/list?g=53&lang=en">스릴러</a></li>
                                <li><a class="dropdown-item" href="http://localhost:8080/movie/list?g=99&lang=en">다큐멘터리</a></li>
                            </ul>
                        </li>
                        <li class="nav-item dropdown" id="menu">
                            <a class="nav-link fs-5" href="${cp}/board/list" role="button">게시판</a>
                            <ul class="dropdown-menu">
                                <c:forEach items="${categories}" var="bc">
                                    <li><a class="dropdown-item" href="${cp}/board/list?category=${bc.bcate}">${bc.boardcategory}</a></li>
                                </c:forEach>
                            </ul>
                        </li>
                    </ul>
                    <c:if test="${not empty member && member.isAdmin}">
                        <button onclick="location.href='/admin'" class="btn btn-outline-secondar boreder-0">관리페이지로</button>
                    </c:if>
                    <div class="d-flex justify-content-end">
                        <ul class="list-unstyled d-flex justify-content-end mb-0">
                            <!-- 검색 아이콘 -->
                            <li class="list-group-item d-flex">
                                <form class="d-flex" action="/search">
                                    <input class="form-control me-2" id="searchCont" name="search" type="search" placeholder="Search" aria-label="Search">
                                    <button class="btn px-0" id="searchBtn">
                                        <i class="fas fa-search" style="font-size: 25px; color: #ffffff;"></i>
                                    </button>
                                </form>
                            </li>
                            <!-- profile (비로그인) -->
                            <c:if test="${empty member}">
                                <li class="list-group-item">
                                    <a class="btn fs-5" href="${cp}/member/signin">로그인</a>
                                </li>
                            </c:if>
                            <!-- profile (로그인) -->
                            <c:if test="${not empty member}">
                                <li class="list-group-item nav-item dropdown mx-2">
                                    <a class="nav-link fs-5 align-items-center" href="#" role="button" data-bs-toggle="dropdown">
                                        <img src="../image/profile.png" alt="" width="30" height="30" class="rounded-pill pb-0">
                                        <span class="mt-3">${member.nickname}</span>
                                    </a>
                                    <div class="row">
                                        <ul class="dropdown-menu my-2">
                                            <li><a class="dropdown-item" href="${cp}/message">쪽지</a></li>
                                            <li><a class="dropdown-item" href="/member/favorite">찜 목록</a></li>
                                            <li><a class="dropdown-item" href="/member/myPage">마이페이지</a></li>
                                            <li><a class="dropdown-item" href="/member/logout">로그아웃</a></li>
                                        </ul>
                                    </div>
                                </li> 
                            </c:if>
                        </ul>
                    </div>
                </div>
            </div>
        </nav>
    </header>
</body>
<script>

	/* 공백 검색 정규식 */
	$("#searchBtn").click(function() {
		var regex = /^\s+|\s+$/g;
		var searchCont = $("#searchCont").val();
		if(searchCont.replace(regex, '' ) == "" ){
			event.preventDefault();
		    alert('검색어를 입력해주세요.');
		}
		$("#searchBtn").submit();	
	})

    document.addEventListener('DOMContentLoaded', (event) => {
        document.querySelector('.navbar-toggler').addEventListener('click', () => {
            const navbarMenu = document.querySelector('#mynavbar');
            if (navbarMenu.style.display === 'none' || navbarMenu.style.display === '') {
                navbarMenu.style.display = 'block';
            } else {
                navbarMenu.style.display = 'none';
            }
        });

        // 드롭다운 메뉴
        const dropdowns = document.querySelectorAll('.nav-item.dropdown');

        dropdowns.forEach((dropdown) => {
            dropdown.addEventListener('mouseenter', () => {
                dropdown.querySelector('.dropdown-menu').classList.add('show');
            });
            dropdown.addEventListener('mouseleave', () => {
                dropdown.querySelector('.dropdown-menu').classList.remove('show');
            });
        });
    });
</script>
</html>
