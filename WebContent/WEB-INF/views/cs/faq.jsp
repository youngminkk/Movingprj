<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html data-bs-theme="dark">
<head>
    <meta charset='utf-8'>
    <meta http-equiv='X-UA-Compatible' content='IE=edge'>
    <title>자주묻는질문</title>
    <meta name='viewport' content='width=device-width, initial-scale=1'>
    <link rel="stylesheet" href="/css/style.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin >
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</head>


<body class="mt-5">
 
  <!-- 헤더 -->
  <jsp:include page="../includes/header.jsp"></jsp:include>
 <div class="my-5 py-5 container">
   <div class="wrap w-100 row">
   
   <!-- nav -->
 <jsp:include page="../includes/csnav.jsp"></jsp:include>
 
	<section class="speedyui speedyui-faq py-5 mt-3">
    <div class="container">
        <div class="accordion row gx-lg-5 accordion-flush" id="accordionFlushExample">
            <div class="col-lg-6">
                <div class="accordion-item border-0 mb-5">
                    <h2 class="accordion-header" id="flush-headingOne">
                    <button class="accordion-button fs-6 fw-semibold py-3 shadow rounded-pill collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseOne" aria-expanded="false" aria-controls="flush-collapseOne">
                     [PC]시청 중 멈추거나 끊겨요.
                    </button>
                    </h2>
                    <div id="flush-collapseOne" class="accordion-collapse collapse collapsed" aria-labelledby="flush-headingOne" data-bs-parent="#accordionFlushExample">
                    <div class="accordion-body"><p class="text-muted">Moving 서비스는 고화질의 영상 서비스를 제공하고 있기에 네트워크 불안정 문제일 가능성이 많습니다. 아래 항목에 대해 체크 부탁드립니다.<br>         
					1. 접속하신 네트워크 상태 확인
					-네트워크의 영향으로 버퍼링이나 싱크가 맞지 않을 수 있습니다.
					위 사항에 대해 체크 후에도 동일하시다면 고객문의에 자세한 증상을 남겨주시거나
					고객센터(1577-0000)으로 문의 부탁드립니다.</p></div>
                    </div>
                </div><!--.accordion-item-->
                <div class="accordion-item border-0 mb-5">
                    <h2 class="accordion-header" id="flush-headingTwo">
                    <button class="accordion-button fs-6 fw-semibold py-3 shadow rounded-pill collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseTwo" aria-expanded="false" aria-controls="flush-collapseTwo">
                    [결제] 영화 VOD를 개별구매 할 수 없나요?
                    </button>
                    </h2>
                    <div id="flush-collapseTwo" class="accordion-collapse collapse" aria-labelledby="flush-headingTwo" data-bs-parent="#accordionFlushExample">
                    <div class="accordion-body">
                    <p class="text-muted">2023년 9월 6일 영화 개별구매 서비스가 종료되었습니다.<br> 
					기존에 구매하신 개별구매 영화는 시청내역 또는 구매내역 메뉴에서 이용기간 만료일까지 시청하실 수 있습니다.<br>
					* 무빙의 방송/영화 콘텐츠는 이용권 구매 후 스트리밍 시청 가능합니다.</p></div>
                    </div>
                </div><!--.accordion-item-->
                <div class="accordion-item border-0 my-5">
                    <h2 class="accordion-header" id="flush-headingFive">
                    <button class="accordion-button fs-6 fw-semibold py-3 shadow rounded-pill collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseFive" aria-expanded="false" aria-controls="flush-collapseFive">
                    [PC] 브라우저 캐시 초기화 방법
                    </button>
                    </h2>
                    <div id="flush-collapseFive" class="accordion-collapse collapse" aria-labelledby="flush-headingFive" data-bs-parent="#accordionFlushExample">
                    <div class="accordion-body">
                    <p class="text-muted">Chorme (v112 기준)
					- 브라우저 주소창에 chorme://settings/clearBrowserData 입력 또는 설정 > 개인정보 보호 및 보안 > 인터넷 사용 기록 삭제<br>
					- 기간 > 전체 기간<br>
					- 선택 가능한 모든 항목 체크 > 삭제 버튼 클릭<br>
					- 브라우저 종료</p></div>
                    </div>
                </div><!--.accordion-item-->
                <div class="accordion-item border-0 my-5">
                    <h2 class="accordion-header" id="flush-headingSeven">
                    <button class="accordion-button fs-6 fw-semibold py-3 shadow rounded-pill collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseSeven" aria-expanded="false" aria-controls="flush-collapseSeven">
                    [모바일] WIFI 신호가 약해서 동영상이 잘 재생되지 않아요.
                    </button>
                    </h2>
                    <div id="flush-collapseSeven" class="accordion-collapse collapse" aria-labelledby="flush-headingFive" data-bs-parent="#accordionFlushExample">
                    <div class="accordion-body">
                    <p class="text-muted">Wi-Fi의 신호가 약한 상태로 서비스를 이용할 경우 서비스 이용에 지연이 발생할 수 있습니다.<br>
					아래 방법을 통해 Wi-Fi 신호가 약할 경우 자동으로 모바일 데이터로 전환되는 기능을 활성화해 주세요.<br>
					-설정 방법-<br>
					단말기 내 설정 > 연결 > Wi-Fi > 오른쪽 상단 '점 세 개' 버튼 > 고급 > Intelligent Wi-Fi 메뉴 내 '모바일 데이터로 전환' 활성화</p></div>
                    </div>
                </div><!--.accordion-item-->
                <div class="accordion-item border-0 my-2">
                    <h2 class="accordion-header" id="flush-headingNine">
                    <button class="accordion-button fs-6 fw-semibold py-3 shadow rounded-pill collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseNine" aria-expanded="false" aria-controls="flush-collapseNine">
                    [회원] 개명을 했는데요, 등록된 이름을 변경할 수 있나요?
                    </button>
                    </h2>
                    <div id="flush-collapseNine" class="accordion-collapse collapse" aria-labelledby="flush-headingNine" data-bs-parent="#accordionFlushExample">
                    <div class="accordion-body">
                    <p class="text-muted">■ 본인인증으로 재설정<br>
					- 본인 인증된 아이디의 경우 개명 서비스가 미 제공되고 있습니다.<br>
					- 현재 판매 중인 이용권을 이용중에 있으시면<br>
 					 [자동결제 해지] → [이용권 만료] → 탈퇴 → 개명된 이름으로  재 회원 가입 후 이용권을 구매하여 이용 부탁드립니다.</p></div>
                    </div>
                </div><!--.accordion-item-->
            </div><!--.col-grid-->
            <div class="col-lg-6">
                <div class="accordion-item border-0 mb-5">
                    <h2 class="accordion-header" id="flush-headingThree">
                    <button class="accordion-button fs-6 fw-semibold py-3 shadow rounded-pill collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseThree" aria-expanded="false" aria-controls="flush-collapseThree">
                    [결제] 결제한 VOD를 다시 구입하라고 해요.
	                </button>
                    </h2>
                    <div id="flush-collapseThree" class="accordion-collapse collapse" aria-labelledby="flush-headingThree" data-bs-parent="#accordionFlushExample">
                    <div class="accordion-body">
                    <p class="text-muted">이용권이나 VOD를 결제 하는 과정에서 오류가 발생하였을 수 있습니다.<br>
                     과금이 되었으나 구매내역에서 확인이 되지 않으시면 고객센터(1577-0000)나 고객문의에 상세한 내용을 남겨주시면 처리해 드리도록 하겠습니다. </p></div>
                    </div>
                </div><!--.accordion-item-->
                <div class="accordion-item border-0 mb-5">
                    <h2 class="accordion-header" id="flush-headingFour">
                    <button class="accordion-button fs-6 fw-semibold py-3 shadow rounded-pill collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseFour" aria-expanded="false" aria-controls="flush-collapseFour">
                      [서비스] 해외에서 사용할 수 있나요?
                    </button>
                    </h2>
                    <div id="flush-collapseFour" class="accordion-collapse collapse" aria-labelledby="flush-headingFour" data-bs-parent="#accordionFlushExample">
                    <div class="accordion-body">
                    <p class="text-muted">해외 여행객 대상 Moving 서비스 시행<br>
					- 대상 국가 : 싱가폴, 인도네시아, 말레이시아, 필리핀, 베트남, 라오스, 태국 (동남아 7개국)<br>
					- 이용 기간 : 해외에서 처음 콘텐츠를 스트리밍(재생) 시작한 시점부터 최대 7일간 이용 가능<br>
					- 제공 콘텐츠 : Moving 서비스의 콘텐츠 제공은 한국영화, 외국영화로 제공되며, 일부 콘텐츠는 콘텐츠 제공사의 별도 요청, 저작권 문제, 기타 사업권역 문제 등으로 제한될 수 있음
					</p></div>
                    </div>
                </div><!--.accordion-item-->
                <div class="accordion-item border-0 mb-5">
                    <h2 class="accordion-header" id="flush-headingSix">
                    <button class="accordion-button fs-6 fw-semibold py-3 shadow rounded-pill collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseSix" aria-expanded="false" aria-controls="flush-collapseSix">
                     [이용권] 한도초과라는 메시지가 뜹니다.
                    </button>
                    </h2>
                    <div id="flush-collapseSix" class="accordion-collapse collapse" aria-labelledby="flush-headingSix" data-bs-parent="#accordionFlushExample">
                    <div class="accordion-body">
                    <p class="text-muted">휴대폰등 결제수단별로 월 한도금액이 있습니다.<br>
                     미리 알아보신 후 이용해주시기 바랍니다.<br>
                     월 한도가 있는 경우 초과시, 결제과정중 에러가 발생하여 결제가 정상처리 되지 않습니다. </p></div>
                    </div>
                </div><!--.accordion-item-->
                <div class="accordion-item border-0 mb-5">
                    <h2 class="accordion-header" id="flush-headingEight">
                    <button class="accordion-button fs-6 fw-semibold py-3 shadow rounded-pill collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseEight" aria-expanded="false" aria-controls="flush-collapseEight">
                     [재생]소리는 나지만 검은색 화면이 표시되요.
                    </button>
                    </h2>
                    <div id="flush-collapseEight" class="accordion-collapse collapse" aria-labelledby="flush-headingEight" data-bs-parent="#accordionFlushExample">
                    <div class="accordion-body">
                    <p class="text-muted">
                    Google Chrome 업데이트<br>
                    1.브라우저의 오른쪽 상단에서 More 를 클릭합니다.<br>
					2.Help > About Google Chrome을 클릭합니다.<br>
					3.Chrome이 자동으로 새로운 업데이트를 확인하는 동안 기다립니다.<br>
					4.업데이트를 사용할 수 있으면 Relaunch를 클릭합니다.<br>
					5.Moving 재생을 다시 시도해 봅니다.
                    </p></div>
                    </div>
                </div><!--.accordion-item-->
                <div class="accordion-item border-0 mb-2">
                    <h2 class="accordion-header" id="flush-headingTen">
                    <button class="accordion-button fs-6 fw-semibold py-3 shadow rounded-pill collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseTen" aria-expanded="false" aria-controls="flush-collapseTen">
                     [계정]계정이 이미 사용 중이라는 메시지가 표시되요
                    </button>
                    </h2>
                    <div id="flush-collapseTen" class="accordion-collapse collapse" aria-labelledby="flush-headingTen" data-bs-parent="#accordionFlushExample">
                    <div class="accordion-body">
                    <p class="text-muted">
                    이 계정은 다른 디바이스에서 사용 중입니다.<br>
                    회원님이 계정이 너무 많은 디바이스에서 사용중입니다.
                    </p></div>
                    </div>
                </div><!--.accordion-item-->
            </div><!--.col-grid-->
        </div><!--.accordion--> 
    </div><!--.container--> 
	</section>
</div>
</div>
<!--====================== End FAQ Section ======================-->


	<!-- 푸터 -->
  <jsp:include page="../includes/footer.jsp"></jsp:include>
  
</body>
</html>