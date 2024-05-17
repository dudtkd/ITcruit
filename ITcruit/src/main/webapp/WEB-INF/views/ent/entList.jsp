<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<style>
/* table.modal-table th{ */
/* 	padding : 1px; */
/* } */
/* table.modal-table td{ */
/* 	padding : 1px; */
/* } */
/* table.modal-table { */
/*    border-collapse: separate; /* 테이블의 테두리를 별도로 분리합니다. */


/*     border-spacing: 10px; /* 가로 간격을 10px로 지정합니다. */
.hide{
	display:none;
	

}

.btn-primary-soft:active, .btn-primary-soft:hover {
    color: #fff !important;
    background-color: #8d7ffc !important;
    border-color: #8d7ffc !important;
}
.logo-container img {
    width: 100%;         /* 컨테이너 너비에 맞춤 */
    height: 150px;       /* 고정 높이 설정 */
    object-fit: contain; /* 비율을 유지하면서 요소에 맞춤 */
    display: block;      /* 블록 레벨 요소로 표시 */
    margin: 0 auto;      /* 중앙 정렬 */
}


</style>

<!-- **************** MAIN CONTENT START **************** -->
<main>


	<!-- =======================Page content START -->
	 
	<section class="pt-0">
		<div class="container">
			<div style="margin-top: 50px; margin-bottom: 30px;">
				<div style="margin-bottom: 30px;">
					<h4 class="mb-3">기업 검색</h4>
				</div>
				<form class="row g-4" method="post" id="entSearchForm">
					<input type="hidden" name="entPage" id="entPage" />
					<!-- Search -->
					<div class="col-sm-6 col-lg-3">
						<div class="position-relative">
							<input class="form-control pe-5 bg-transparent" type="text"
								placeholder="기업명" aria-label="Search" name="searchEnt"
								id="searchEnt" value="${searchEnt}">
						</div>
					</div>

					<!-- Select option -->
					<div class="col-sm-6 col-lg-3">
						<select class="js-choice" name="searchLoc" id="searchLoc">
							<option value="">지역</option>
							<option value="서울" <c:if test="${searchLoc eq '서울' }"> selected</c:if>>서울</option>
							<option value="경기" <c:if test="${searchLoc eq '경기' }"> selected</c:if>>경기</option>
							<option value="인천" <c:if test="${searchLoc eq '인천' }"> selected</c:if>>인천</option>
							<option value="부산" <c:if test="${searchLoc eq '부산' }"> selected</c:if>>부산</option>
							<option value="대구" <c:if test="${searchLoc eq '대구' }"> selected</c:if>>대구</option>
							<option value="대전" <c:if test="${searchLoc eq '대전' }"> selected</c:if>>대전</option>
							<option value="광주" <c:if test="${searchLoc eq '광주' }"> selected</c:if>>광주</option>
							<option value="울산" <c:if test="${searchLoc eq '울산' }"> selected</c:if>>울산</option>
							<option value="세종" <c:if test="${searchLoc eq '세종' }"> selected</c:if>>세종</option>
							<option value="강원" <c:if test="${searchLoc eq '강원' }"> selected</c:if>>강원</option>
							<option value="경남" <c:if test="${searchLoc eq '경남' }"> selected</c:if>>경남</option>
							<option value="경북" <c:if test="${searchLoc eq '경북' }"> selected</c:if>>경북</option>
							<option value="전남" <c:if test="${searchLoc eq '전남' }"> selected</c:if>>전남</option>
							<option value="전북" <c:if test="${searchLoc eq '전북' }"> selected</c:if>>전북</option>
							<option value="충남" <c:if test="${searchLoc eq '충남' }"> selected</c:if>>충남</option>
							<option value="충북" <c:if test="${searchLoc eq '충북' }"> selected</c:if>>충북</option>
							<option value="제주" <c:if test="${searchLoc eq '제주' }"> selected</c:if>>제주</option>
						</select>
					</div>

					<!-- Select option -->
					<div class="col-sm-6 col-lg-3">
						<select class="js-choice" name="searchCount" id="searchCount">
							<option value="">채용여부</option>
							<option value="채용중"
								<c:if test="${searchJob eq 'server' }"> selected</c:if>>채용중</option>
						</select>
					</div>

					<!-- Button -->
					<div class="col-sm-6 col-lg-3">
						<button class="btn btn-primary-soft mb-0 w-100" style="background-color: #dcd8fc; color: black;" type="submit"> 검색</button>
					</div>
					<sec:csrfInput />
				</form>
			</div>
			<hr>
			<br>
			<div class="row mt-3">
				<!-- Main content START -->
				<div class="col-12">
					<!-- Course Grid START -->
					<div class="row g-4 appendList" >
					<input type="hidden" id="auth" value="${sessionScope.SessionInfo.authCmmncd }">
						<c:set value="${pagingVO.dataList }" var="entList" />
						<c:choose>
							<c:when test="${empty entList }">
								<h5>등록된 기업이 없습니다.</h5>
							</c:when>
							<c:otherwise>
								<c:forEach items="${entList }" var="ent" varStatus="status">
									<!-- Card item START -->
									<div class="col-sm-6 col-lg-4 col-xl-3 big-box ${status.index >= 8 ? 'hide' : ''}">
										<div class="card shadow-hover overflow-hidden h-60"
											style="border: 1px solid #d6d6d6; height: 340px;">
											<!-- <a href="" id="openModal" data-bs-toggle="modal" -->
											<!-- data-bs-target="#detailModal"> <br>  -->
											<a href="" class="openModal" data-entno="${ent.entNo }">
												<br> <!-- Image --> 
												
												<div class="logo-container">
												    <img src="/main/logodisplay?entNo=${ent.entNo}" alt="기업 로고"
												        style="width: 85%; height: 150px; object-fit: contain;">
												</div>
												
																								
												
												<div class="card-body pb-0">
													<!-- Title -->
													<h5 class="card-title">${ent.entNm }</h5>
													<span style="color: black;">${ent.bizTypeNm } </span> <br> 
													<c:choose>
													    <c:when test="${fn:length(ent.ksicNm) > 16}">
													        <span>${fn:substring(ent.ksicNm, 0, 16)}...</span>
													    </c:when>
													    <c:otherwise>
													        <span>${ent.ksicNm}</span>
													    </c:otherwise>
													</c:choose>
												</div>
											</a>
											<!-- Card footer -->
											<div class="card-footer pt-0 pb-3" style="margin-bottom: 30px;">
										    <hr>
										    <div class="d-flex justify-content-between" style="margin-left: 0; width: 100%;">
										        <!-- Badge and favorite -->
										        <c:choose>
										            <c:when test="${ent.recruitCount eq 0 }">
										                <div class="badge mb-3 rounded-pill"><span></span></div>
										            </c:when>
										            <c:otherwise>
										                <div class="badge bg-grad mb-3 rounded-pill">채용중</div>
										            </c:otherwise>
										        </c:choose>
										        
										        <div>
										            <c:if test="${!empty ent.loginId }">
										                <div class="card card-body border p-1">
										                    <a href="#" class="h6 fw-light mb-0 likeEnt"
										                       data-entno="${ent.entNo }" data-session="${SessionInfo}">
										                        <li class="list-inline-item me-0"><i class="fas fa-star text-warning like"></i>&ensp;관심기업</li>
										                    </a>
										                </div>
										            </c:if>
										            
										            <c:if test="${empty ent.loginId}">
										                <div class="card card-body border p-1">
										                    <a href="#" class="h6 fw-light mb-0 disLikeEnt"
										                       data-entno="${ent.entNo }" data-session="${SessionInfo}">
										                        <li class="list-inline-item me-0"><i class="far fa-star disLike"></i>&ensp;관심기업</li>
										                    </a>
										                </div>
										            </c:if>
										        </div>
										    </div>
										</div>
										</div>
									</div>
									<!-- Card item END -->
								</c:forEach>
							</c:otherwise>
						</c:choose>
					</div>
					<!-- Course Grid END -->

					<!-- Pagination START -->
					<div class="col-12" id="entPagingArea"></div>
<%-- 					<div class="col-12" id="entPagingArea">${pagingVO.pagingHTML }</div> --%>
					<!-- Pagination END -->
				</div>
				<!-- Main content END -->
			</div>
			<!-- Row END -->
		</div>
	</section>
	<!-- =======================Page content END -->


</main>
<!-- **************** MAIN CONTENT END **************** -->

<!-- Personal information START -->
<div class="modal fade" id="detailModal" tabindex="-1"
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-xl">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="card-header-title mb-0">기업 정보</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal"
					aria-label="Close"></button>
			</div>
			<div class="modal-body">

				<div style="background-color: white;">
					<div class="card bg-transparent border rounded-3 h-100">


						<!-- Card body START -->
						<a href="#" id="detail">
							<div class="card-body">
							<div class="logo-container">
								<img id="entImg" src="#" class="card-img-top" alt="course image" style="width: 30%; height: 150px;">
							</div>
								<div class="mt-2"></div>
								<!-- Information START -->
								<div class="row">

									<!-- Information item -->
									<div class="col-md-6">
										<table class="table table-borderless modal-table"
											style="width: 200%;">

											<tr>
												<th>산업</th>
												<td id="ksicNm"></td>

												<th>사원수</th>
												<td id="entCnt"></td>
											</tr>
											<tr>
												<th>기업구분</th>
												<td id="bizTypeNm"></td>

												<th>설립일</th>
												<td id="fndnYr"></td>
											</tr>
											<tr>
												<th>자본금</th>
												<td id="cptl"></td>

												<th>전년매출</th>
												<td id="entSlsAmt"></td>
											</tr>
											<tr>
												<th>대표</th>
												<td id="rprsvNm"></td>

												<th>주소</th>
												<td id="address"></td>

											</tr>
											<tr>
												<th>홈페이지</th>
												<td><a href="#" id="url"></a></td>

											</tr>
										</table>
									</div>
								</div>
								<!-- Information END -->
							</div> <!-- Card body END -->
						</a>
					</div>
				</div>
				<!-- Personal information END -->

				<br>

				<!-- Card START -->
				<div style="background-color: white;">
					<div class="card border bg-transparent rounded-3">
						<!-- Card header START -->
						<div class="card-header bg-transparent border-bottom">
							<h3 class="mb-0">기업 공지 게시판</h3>
							<a href="#" id="BoardListBtn" style="display: block; text-align: right; color: black; margin-top: -20px;">더보기</a>
						</div>
						<!-- Card header END -->

						<!-- Card body START -->
						<div class="card-body">

							<!-- Search and select START -->
							<div
								class="row g-3 align-items-center mb-4 d-flex justify-content-between">
								<form class="rounded position-relative d-flex" action="/ent/modalDetail.do" method="post"
									id="BBS202searchForm">
									<input type="hidden" name="BBS202page" id="BBS202page" />
									<input type="hidden" name="entNo" id="entNo" value=""/>
									<!-- Select option -->
									<div class="col-md-3" style="margin-right: 50px;">
										<!-- Short by filter -->
										<select
											class="form-select js-choice border-0 z-index-9 bg-transparent"
											aria-label=".form-select-sm" name="BBS202searchType">
											<option value="BBS202title"
												<c:if test="${BBS202searchType eq 'BBS202title' }"> selected</c:if>>제목</option>
											<option value="BBS202writer"
												<c:if test="${BBS202searchType eq 'BBS202writer' }"> selected</c:if>>작성자</option>
										</select>
									</div>
									<!-- Search -->
									<div class="col-md-8 d-flex">
										<div class="position-relative d-flex flex-grow-1">
											<input class="form-control pe-5 bg-transparent flex-grow-1"
												type="search" placeholder="Search" aria-label="Search"
												name="BBS202searchWord" value="${BBS202searchWord}">
											<button
												class="bg-transparent p-2 border-0 text-primary-hover text-reset"
												type="submit">
												<i class="fas fa-search fs-6"></i>
											</button>
										</div>
									</div>
									<sec:csrfInput />
								</form>
							</div>
							<!-- Search and select END -->

							<!-- Order list table START -->
							<div class="table-responsive border-0">
								<!-- Table START -->
								<table
									class="table align-middle p-4 mb-0 table-hover">
									<!-- Table head -->
									<thead style="background-color: #dcd8fc">
										<tr>
											<th scope="col" class="border-0 rounded-start">
												&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;제
												목</th>
											<th scope="col" class="border-0">&nbsp;작성자</th>
											<th scope="col" class="border-0">작성날짜</th>
											<th scope="col" class="border-0">조회수</th>
										</tr>
									</thead>

									<!-- Table body START -->
									<tbody class="entBoardList">

										<!-- ajax로 list 생성해서 넣어줌  -->

									</tbody>
									<!-- Table body END -->
								</table>
								<!-- Table END -->
							</div>
							<!-- Order list table END -->

							<!-- Pagination START -->
							<div
								class="d-sm-flex justify-content-sm-end align-items-sm-center mt-4 mt-sm-3 paging"
								id="pagingArea">
								<!-- Pagination -->

							</div>
							<!-- Pagination END -->
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- Main content END -->

<script type="text/javascript">
$(function(){
	
	var self = this;
	var entPagingArea = $("#entPagingArea");
	var entSearchForm = $("#entSearchForm");
	
	entPagingArea.on("click","a",function(e){
		e.preventDefault();
		var entPagingNo = $(this).data("page");
		entSearchForm.find("#entPage").val(entPagingNo);
		entSearchForm.submit();
		
	});
	
	
	var pagingArea = $("#pagingArea");
	var BBS202searchForm = $("#BBS202searchForm");
	
	pagingArea.on("click","a",function(event){
		event.preventDefault();
		var pageNo = $(this).data("page");
		BBS202searchForm.find("#BBS202page").val(pageNo);
		BBS202searchForm.submit();
		
		
	});
	
	
	
	// 관심기업 해제 처리
    $(document).on("click", ".likeEnt", function(e) {
        e.preventDefault();
        var $this = $(this);

        Swal.fire({
            title: "관심 기업을 해지하시겠습니까?",
            icon: "warning",
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: '확인',
            cancelButtonText: '취소',
            reverseButtons: false
        }).then((result) => {
            if (result.value) {
                var entNo = $this.data("entno");
                var data = { entNo: entNo };

                $.ajax({
                    type: "post",
                    url: "/ent/likeEnt.do",
                    contentType: "application/json; charset=utf-8",
                    data: JSON.stringify(data),
                    beforeSend: function(xhr) {
                        xhr.setRequestHeader(header, token);
                    },
                    success: function(res) {
                        console.log("res >>>>>" + res);
                        $this.find('i').removeClass("fas fa-star text-warning").addClass("far fa-star");
                        $this.removeClass("likeEnt").addClass("disLikeEnt");
                    }
                });
            }
        });
    });

    // 관심기업 등록 처리
    $(document).on("click", ".disLikeEnt", function(e) {
        e.preventDefault();
        var $this = $(this);
        var session = $this.data("session");

        // 권한 코드를 가져옵니다.
        var authCode = $("#auth").val();

        // AUTH101이나 AUTH103이면 경고를 표시하고 함수를 종료합니다.
        if (authCode == 'AUTH101' || authCode == 'AUTH103') {
            Swal.fire({
            	icon : "info",
            	text : "관심 기업은 일반회원만 등록이 가능합니다"
            });
            return; // 함수를 여기서 종료
        }
        
        
        if (session == null || session == "") {
            Swal.fire({
                title: "관심 기업 등록은 로그인 후 <br> 이용 가능합니다",
                text: "로그인 페이지로 이동 하시겠습니까?",
                icon: "info",
                showCancelButton: true,
                confirmButtonColor: '#3085d6',
                cancelButtonColor: '#d33',
                confirmButtonText: '확인',
                cancelButtonText: '취소',
                reverseButtons: false
            }).then((result) => {
                if (result.value) {
                    location.href = "/main/loginForm.do";
                }
            });
        } else {
            var entNo = $this.data("entno");
            var data = { entNo: entNo };

            $.ajax({
                type: "post",
                url: "/ent/disLikeEnt.do",
                contentType: "application/json; charset=utf-8",
                data: JSON.stringify(data),
                beforeSend: function(xhr) {
                    xhr.setRequestHeader(header, token);
                },
                success: function(res) {
                    console.log("res >>>>>" + res);
                    $this.find('i').removeClass("far fa-star").addClass("fas fa-star text-warning");
                    $this.removeClass("disLikeEnt").addClass("likeEnt");
                }
            });
        }
    });
	
	$(".openModal").click(function(e){
		e.preventDefault();
		
		$("#detailModal").modal("show");
		
		var entNo = $(this).data("entno");
		console.log(entNo);
		
		var data = {
				entNo : entNo
		}
		$.ajax({
			type : "post",
			url : "/ent/modalDetail.do",
			
			//JSON 라이브러리가 설정되어 있으면 VO로 받아야된다.
// 			contentType : "application/json; charset=utf-8",
// 			data : JSON.stringify(data),

			// requestParam 또는 Map 형태로 받을때는 url폼 형식으로 보내준다.
/* 			data :{
				entNo : entNo
			}, */
			data :{
				entNo : entNo
			},
            beforeSend: function(xhr) {
                xhr.setRequestHeader(header, token);
            },
			success : function(res) {
				console.log(res);
				$("#entNo").val(res.entVO.entNo);
				$("#entImg").attr("src", "/main/logodisplay?entNo=" + res.entVO.entNo);
				$("#detail").attr("href","/ent/detail.do?entNo=" + res.entVO.entNo);
				$("#BoardListBtn").attr("href","/board/ent/list.do?entNo=" + res.entVO.entNo);
				console.log(res.entVO.entNo);
				$("#ksicNm").text(res.entVO.ksicNm); // 산업
		        $("#entCnt").text(res.entVO.empCnt + " 명"); // 사원수
		        $("#bizTypeNm").text(res.entVO.bizTypeNm); // 기업구분
		     	
		        // 날짜 문자열 추출
		        var dateString = res.entVO.fndnYr;

		        // 날짜 형식으로 변환
		        var dateObject = new Date(dateString.substring(0, 4), // 연도
		                                  dateString.substring(4, 6) - 1, // 월 (0부터 시작하므로 -1)
		                                  dateString.substring(6, 8)); // 일

		        // 날짜를 원하는 형식으로 형식화
		        var formattedDate = dateObject.getFullYear() + '-' + ('0' + (dateObject.getMonth() + 1)).slice(-2) + '-' + ('0' + dateObject.getDate()).slice(-2);

		        // 결과를 출력
		        $("#fndnYr").text(formattedDate);
		        
		        // 3자리마다 ,를 찍기위한 작업
		        var number = res.entVO.cptl; // 자본금
		        var cptl = number.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","); 
		        $("#cptl").text(cptl + " 원");
		        
		        var number1 = res.entVO.entSlsAmt;
		        var entSlsAmt = number1.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
		        $("#entSlsAmt").text(entSlsAmt + " 원"); // 전년매출
		        $("#rprsvNm").text(res.entVO.rprsvNm); // 대표
		        $("#address").text(res.entVO.accountAddr1 +  res.entVO.accountAddr2); // 주소
		        $("#url").attr("href","http://"+ res.entVO.entUrl).attr("target", "_blank").attr("style", "color: gray; text-decoration: none; width: 30%; height: 150px;").attr("onmouseover", "this.style.color='#3399FF';").attr("onmouseout", "this.style.color='gray';").text(res.entVO.entUrl);

		        if (res.pagingVO.dataList && res.pagingVO.dataList.length > 0) {
	                // 테이블 body 참조
	                var tableBody = $(".entBoardList");

	                // 기존에 있던 테이블 내용 제거
	                tableBody.empty();
	                
	                // dataList를 순회하며 각 항목을 테이블에 추가
	                res.pagingVO.dataList.forEach(function(item) {
	                    // 각 항목에 대한 정보 추출
	                    var bbsInqCnt = item.bbsInqCnt;
	                    var regDt = new Date(item.bbsRegDt);
	                    var bbsRegDt = regDt.getFullYear() + "-" + (regDt.getMonth()+1) + "-" + regDt.getDate();
// 	                    + " " +	regDt.getHours() + ":" + regDt.getMinutes();
	                    var bbsTtl = item.bbsTtl;
	                    var bbsWriter = item.bbsWriter;
	                    var entNo = item.entNo;
	                    var bbsNo = item.bbsNo;
	                    
	                    // 테이블에 새로운 행 추가
	                    var newRow = $("<tr></tr>");
	                    newRow.append("<td><h6 class='table-responsive-title mt-2 mt-lg-0 mb-0'><a href='/board/ent/detail.do?entNo=" + encodeURIComponent(entNo) + "&bbsNo=" + encodeURIComponent(bbsNo) + "'>&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;" + bbsTtl + "</a></h6></td>");
	                    newRow.append("<td class='text-center text-sm-start text-primary-hover'><u>" + bbsWriter + "</u></td>");
	                    newRow.append("<td>" + bbsRegDt + "</td>");
	                    newRow.append("<td class='bi bi-eye-fill'>&nbsp;" + bbsInqCnt + "</td>");
	                    
	                    // 테이블에 새로운 행 추가
	                    tableBody.append(newRow);
	                });
	                $(".paging").html(res.pagingVO.pagingHTML);
	            }else {
	            	// 게시글이 없으면 페이지 버튼 안나오게
	                var paging = $(".paging");
	            	paging.empty();
	                
	            	// 테이블 body 참조
	                var tableBody = $(".entBoardList");

	                // 기존에 있던 테이블 내용 제거
	                tableBody.empty();

	                // "게시글이 없습니다." 메시지 출력
	                var newRow = $("<tr><td colspan='4'>게시글이 없습니다.</td></tr>");
	                tableBody.append(newRow);
	                
	                
	            }
		        	
		        	 	
		        console.log(newRow);
		        
				console.log(res.entVO.url);
				
				console.log(entNm + ">>>>>>>>>> entNm");
				
			}
		})	
	});
});

//링크 클릭 시 모달 닫기
$("#detail").click(function(e) {
    $("#detailModal").modal("hide");
});


// 페이지 무한스크롤
$(document).ready(function() {
    $(window).scroll(function() {
        if ($(window).scrollTop() + $(window).height() > $(document).height() - 100) {
            var hiddenBoxes = $(".big-box.hide").slice(0, 8); // 한 번에 8개씩 로드
            if (hiddenBoxes.length > 0) {
                hiddenBoxes.removeClass('hide');
            } else {
                console.log('더 이상 로드할 내용이 없습니다.');
            }
        }
    });

    // 초기에 8개 요소만 보여주기
    $(".big-box.hide").slice(0, 8).removeClass('hide');
});
</script>


