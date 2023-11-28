<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html data-bs-theme="dark">
<head>
<meta charset='utf-8'>
<meta http-equiv='X-UA-Compatible' content='IE=edge'>
<title>영화 상세페이지</title>
<meta name='viewport' content='width=device-width, initial-scale=1'>
<link rel="icon" href="data:;base64,iVBORw0KGgo=">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css" rel="stylesheet">
<link rel="stylesheet" href="./css/style.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin >
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/3.3.1/css/swiper.min.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>   
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/3.3.1/js/swiper.min.js"></script>
<script src="https://unpkg.com/youtube-background@1.0.14/jquery.youtube-background.min.js"></script>

<style>
    .cast {height : 306px; width : 138px; z-index: 100;}
    .cast-inner img {height : 100%; width : 100%; z-index: 50;}
</style>
 
 

</head>

<body class="pt-5">
	<!-- header -->
	<jsp:include page="../includes/header.jsp"></jsp:include>
	<main>
		<!-- details -->
		<div class="container-fluid bg-dark bg-gradient p-3 md-3 text-white">
			<div class="container">
				<section class="row align-items-center">
					<div class="col-xl-4 col-sm-6 text-center">
						<img class="img-thumbnail" alt="${movie.title}"
							src="${image.backdroppath}">
					</div>
					<div class="col-xl-8 col-sm-6 my-5">
						<h2 class="my-5">
							<p>${movie.title}</p>
						</h2>
						<div class="my-3">
							<span class="border border-light p-1 mx-1">${movie.formattedMdate}</span>
							<c:set var="hours"
								value="${fn:substringBefore(String.valueOf(movie.runningTime / 60), '.')}" />
							<c:set var="minutes" value="${movie.runningTime % 60}" />
							<c:choose>
								<c:when test="${hours gt 0}">
									<span class="border border-light p-1 mx-1">${hours}h
										${minutes}m</span>
								</c:when>
								<c:otherwise>
									<span class="border border-light p-1 mx-1">${minutes}m</span>
								</c:otherwise>
							</c:choose>
							<button class="btn" id="likeButton" onclick="toggle(this)">
								<i class="${empty favorite ? 'far' : 'fas'} fa-heart"
									id="heartIcon"></i>
							</button>
							<!-- favorite가 null이면 far(빈하트), 그렇지 않으면 fas(하트) -->
						</div>
						<div class="my-3">
							<span class="p-1">평점</span> <span class="p-1"> <%--  <c:if test="${movie.cnt != 0}">${movie.avg}</c:if> --%>
								${rate.avg}
							</span>
						</div>
						<h3 class="mt-5">개요</h3>
						<p class="fs-6 overflow-hidden">${movie.outline}</p>
					</div>
				</section>
			</div>
		</div>
		<div class="bg-light text-black">
			<div class="row pb-5">
				<!-- cast -->
				<div class="col-lg-9 col-12">
					<div class="mx-5">
						<div class="my-5">
							<h4>Cast</h4>
						</div>
						<!-- cast-inner -->
						<div>
							<div class="divst-unstyled row adivgn-items-center">
								<c:forEach var="cast" items="${casts}">
									<div
										class="cast card shadow col-auto mx-2 mb-5 p-0 bg-light rounded border-secondary">
										<div class="cast-inner card-header text-center img-fluid p-0">
											<img class="rounded-top" src="${cast.profileImage}">
										</div>
										<div class="card-body p-0">
											<div class="text-black">
												<p class="px-2 text-truncate mt-5">${cast.name}</p>
												<p class="px-2 text-truncate mt-6">${cast.casting}</p>
											</div>
										</div>
									</div>
								</c:forEach>
							</div>
							<div class="text-end">
								<a href="${cp}/movie/cast?m=${movie.mno}">더 보기</a>
							</div>
						</div>
					</div>
				</div>

				<!-- Details2 -->
				<div class="col-lg-3 py-5 px-5 border-start">
					<div>
						<b>원어</b>
						<p>${movie.language}</p>
					</div>
					<div class="py-3">
						<b>상태</b>
						<p>${movie.status}</p>
					</div>
					<div>
						<b>카테고리</b>
						<ul class="list-unstyled">
							<c:forEach var="movieGenre" items="${movieGenres}">
								<c:forEach var="genre" items="${genres}">
									<c:if test="${genre.gno == movieGenre.gno}">
										<li><a
											class="link-dark link-offset-2 link-underline-opacity-25 link-underline-opacity-75-hover"
											href="${cp}/movie/list?g=${genre.gno}">${genre.genre}</a></li>
									</c:if>
								</c:forEach>
							</c:forEach>
						</ul>
					</div>
				</div>
			</div>
		</div>
		
	<!-- Review -->
<div class="container">	
	<div class="reply-area col-12">
	    <h4>
	        <i class="far fa-comment-dots mt-3"></i> 후기<span class="rate-cnt"></span>
	    </h4>
	    <div class="rate-write clearfix" id="rateWrite">
	        <c:if test="${empty member}"> 
	            <div class="reply-not-login">댓글을 입력하려면 로그인해주세요</div>
	        </c:if>
	        <c:if test="${not empty member}">
	            <span>${member.nickname}</span>
	            <div class="text-right">
	                <div class="stars text-white display-6 mb-2">
	                    <i class="far fa-star fa-sm"></i>
	                    <i class="far fa-star fa-sm"></i>
	                    <i class="far fa-star fa-sm"></i>
	                    <i class="far fa-star fa-sm"></i>
	                    <i class="far fa-star fa-sm"></i>    
	                </div>
	                <textarea class="form-control" id="exampleFormControlTextarea1" rows="3" placeholder="댓글과 평점을 입력해주세요"></textarea>
	                <div class="text-right d-flex justify-content-end">
	                    <button class="btn outline-secondary btn-rate-register mt-3">등록</button>
	                </div>
	            </div>
	        </c:if>
	    </div>
	    <hr>
	    <ul class="rates list-unstyled chat list-group list-group-flush chat"></ul>
	    <div class="rate-showmore-area text-right d-flex justify-content-end">
	        <button class="btn outline-secondary btn-block mt-3" id="moreBtn" type="button">더보기</button>
	    </div>  
	</div>
</div>
    
    <!-- Footer -->
    <jsp:include page="../includes/footer.jsp"></jsp:include>
</main>
    
    
 
 <script>
 
 	// 찜 클릭 이벤트
	function toggle(button) { 
			$.ajax("/favToggle?mno=${movie.mno}&userno=${member.userno}").done(function() {
				heartIcon.classList.toggle("fas");
				heartIcon.classList.toggle("far");
			})
	}
	const mno = '${movie.mno}';
	const tno = '${rate.tno}';
	const cp = '${cp}';
	const userno = '${member.userno}';

	const nickname = '${member.nickname}';
	const tcomment = '${rate.tcomment}';
	
	// 평점 1개 li
	function getRateLi(rate){
			let str = `
				<li data-tno='\${rate.tno}' class="list-group-item px-0">
				<div class="clearfix d-flex">
				<p class="rate-writer me-2" style="font-weight: bold;">\${rate.nickname}</p>
				`;
			str += '<div class="text-white" >';
				for(let i = 0 ; i < 5 ; i++) {
					console.log(rate.rate, i)
					if(rate.rate > i) {
						str += '<i class="fas fa-star"></i>'
					}
					else {
						str += '<i class="far fa-star"></i>'
					}
				}	
				str += '</div>'
					str += '</div>'
					str += `
					<div class="row">
						<p class="rate-tcomment col">\${rate.tcomment}</p>
						<div class="text-end col">
						<a href="" class="rate-menu-link top-50 end-0 translate-middle-y">\${userno == rate.userno ? '<i class="fas fa-ellipsis-v"></i>' : ''}</a>
						</div>
					</div>
					<div class="rate-tooltip visually-hidden text-end">
					    <a href="" class="text-decoration-none text-light">수정</a>
					    <a href="" class="text-decoration-none text-light">삭제</a>
					</div>
				</li>`
				return str;
			}

	
	// 평점 목록
	function getList(lastTno) {
    const url = cp + "/rate/mno/" + mno + (lastTno ? "/" + lastTno : "");
    console.log(url);
    $.ajax(url).done((data) => {
        let str = '';
        for (let i of data.list) {
            str += getRateLi(i);
        }
        $(".rates").append(str);


        $.ajax({
            url: cp + "/rate/mno/" + mno + "/" + tno
        }).done((countData) => {
            const commentCount = countData.info.cnt;
            const listCount = $(".rates li").length;
            if (listCount >= commentCount) {
                $("#moreBtn").prop("disabled", true).text("마지막 댓글입니다");
            }
        });
    });
}

getList();
	
	//페이지 로드 후 함수 호출
	$(document).ready(function() {
	    applyReplyCount(tno);
	});

	// 댓글 갯수 표시
	function applyReplyCount(tno) {
	    $.ajax({
	        url: cp + "/rate/mno/" + mno + "/" + tno
	    }).done((data) => {
	        console.log(data.list);
	        $(".rate-cnt").text(data.info.cnt);
	    });
	}
	//  applyReplyCount(tno);

	
	// 댓글 더보기 클릭이벤트
	$(".rate-showmore-area button").click(() => {
	    const lastTno = $(".rates li").last().data("tno");
	    getList(lastTno); 
	    console.log(lastTno);
	});
	

	function makeStar(jQueryEl, idx) {
		jQueryEl.find("i").removeClass("fas").addClass("far").filter(":lt(" + idx + ")").removeClass("far").addClass("fas");
	 } 

	 // 별점
	$(function (){
	    $(".stars i").click(function () {
	        const idx = $(this).index();
	        makeStar($(".stars"), idx+1);
	        const rate = $(".stars i.fas").length;
	        $("h3").text(rate);
	    });
	});

	 	// 댓글 등록
		$(".btn-rate-register").click(function () {
		    if (!confirm("댓글을 등록하시겠습니까?")) {
		        return;
		    }
		    const nickname = '${member.nickname}';
		    const tcomment = $("#rateWrite textarea").val().trim();
		    const rate = $(".stars i.fas").length; 
		    if (!tcomment) {
		        alert("댓글 내용과 별점을 모두 입력하세요");
		        $("#rateWrite textarea").focus();
		        return;
		    }

		    const myrate = { mno, userno, nickname, tcomment, rate };
		    console.log(myrate);
		    console.log(JSON.stringify(myrate));
		    

		    // 댓글 서버에 등록, 화면에 추가 
		    $.ajax(cp + "/rate", {
		        method: "post",
		        data: JSON.stringify(myrate),
		        success: function (data) {
		            console.log("데이터:" + data);
		            alert("댓글이 등록되었습니다");
		            
		          // $.ajax(cp + "/rate/" + data).done(function (data) {
		            	console.log(myrate); 
		            	$(".rates").prepend(getRateLi(data));
		                $("#rateWrite textarea").val("");
		           // });
		        }
		    });
		});

		// 툴팁 박스 클릭 이벤트 
		$(".rates").on("click", ".rate-menu-link", function() {
       		event.preventDefault();
       		console.log("클릭클릭");
		   	if($(".rates textarea").length){
		   		confirm("현재 수정중인 내용이 있습니다 계속하시겠습니까?");
		   	}
	
	    const $target = $(this).closest("li").find(".rate-tooltip").toggleClass("visually-hidden"); 
	    
// 	    const flag = $target.hasClass("active"); 
	   	 $(".rate-tooltip").removeClass("active");
	   
	     $(".rates textarea").each(function(){
	    	 const $li = $(this).closest("li");
	    	 const tno = $li.data("tno")
	    	 $.ajax(cp+ "/rate/"+tno).done(function(data){
	    		 $li.find(".rate-tcomment").html(data.tcomment);
		    	 })
		     });
		})

	// 툴팁 - 삭제 
	$(".rates").on("click", ".rate-tooltip a:nth-child(2)", function () {
      event.preventDefault();
     if (!confirm("댓글을 삭제하시겠습니까?")) {
    return;
     }

    console.log("click");
    const $li = $(this).closest("li");
   	const tno = $li.data("tno");
    console.log(tno);

	   $.ajax(cp + "/rate/" + tno, {
		  	method : "delete",
			  	success : function(data) {
			   	console.log("success");
			    $li.remove();
			    $(".rate-cnt").text((i, val) => val - 1);
			    //applyReplyCount();
			}
		})
	})


	// 툴팁 - 수정 
	$(".rates").on("click",".rate-tooltip a:first-child", function(){
		event.preventDefault();
		
		const $li = $(this).closest("li");
		const tno = $li.data("tno");
		
		$.ajax(cp+"/rate/"+tno, {
			success : function(data){
				$li.find(".rate-tcomment").html(`<textarea placeholder="댓글을 작성하세요.">\${data.tcomment}</textarea>
					<div class="text-right">
					    <p><span class="rate-write-cnt">${data.tcomment.length}</span></p>
					    <button class="btn btn-primary btn-rate-modify">수정</button>
					</div>`).end()
					.find(".rate-tooltip").removeClass("active");
				}
			});
		})
	
	// 댓글 수정
	$(".rates").on("click",".btn-rate-modify", function(){
			if(!confirm("댓글을 수정하시겠습니까?")){
				return;
			}
			
		const tcomment = $(this).parent().prev().val().trim();
		if(!tcomment){
			alert("댓글 내용을 입력하세요");
			$(this).parent().prev().focus();
			return;
		}
		const $li = $(this).closest("li");
		const tno = $li.data("tno");
		const rate = {tno, tcomment};
		 console.log(JSON.stringify(rate));
		
		$.ajax(cp+"/rate",{
			method : "put",
			data : JSON.stringify(rate),
			success : function(data) {
				console.log(data);
				alert("댓글이 수정되었습니다");
				
				$.ajax(cp+"/rate/"+tno).done(function(data){
					$li.replaceWith(getRateLi(data));
					$(".rates textarea").val("");
				})
			}
		})
	});
	

</script>

</body>
</html>