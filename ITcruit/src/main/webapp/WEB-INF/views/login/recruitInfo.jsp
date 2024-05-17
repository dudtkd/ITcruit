<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/2.5.1/jspdf.umd.min.js"></script>
<script src="https://mozilla.github.io/pdf.js/build/pdf.js"></script>
<link href="https://fonts.googleapis.com/css2?family=Roboto:wght@700&display=swap" rel="stylesheet">

<style>
#item-1:focus, #item-2:focus, #item-3:focus, #item-4:focus, #item-5:focus {
  outline: none;
}
.applyBtn:hover, .entApplyBtn:hover {
    color: #fff !important;
    background-color: #8d7ffc !important;
    border-color: #8d7ffc !important;
    border: none;
}
.applyBtn, .entApplyBtn {
    background-color: #dcd8fc !important;
    border: none;
    color: black;
}
#side-item-1, #side-item-2, #side-item-3, #side-item-4, #side-item-5 {
  border-bottom: 1px #868e96 solid;
  background-color: white;
  border-radius: 0%;
  color: black;
}
#side-item-1:hover, #side-item-2:hover, #side-item-3:hover, #side-item-4:hover, #side-item-5:hover {
  border-bottom: 1px #868e96 solid;
  background-color: white;
  border-radius: 0%;
  color: black;
}
.logo-container img {
/*     width: 100%;		*/     /* 컨테이너 너비에 맞춤 */ 
/*     height: 150px;	*/      /* 고정 높이 설정 */  
    object-fit: contain; /* 비율을 유지하면서 요소에 맞춤 */
    display: block;      /* 블록 레벨 요소로 표시 */
    margin: 0 auto;      /* 중앙 정렬 */
}

</style>

<body  data-bs-spy="scroll" data-bs-target="#nav-scroll">
<sec:authorize access="isAuthenticated()">
   <sec:authentication property="principal.account.accountId" var="aId"/>
</sec:authorize>
<c:if test="${likeEnt eq 'y' }">
	<script>
        $(function() {
            $('.heart').toggleClass('text-danger');
//             var toggle = true;
        });
    </script>
</c:if>
<c:if test="${likeRecruit eq 'y' }">
	<script>
        $(function() {
            $('.bi-star-fill').toggleClass('text-warning');
        });
    </script>
</c:if>
<section>
	<div class="container" data-sticky-container>

		<div class="row g-4">
			<!-- Advance Usage content START -->
			<div id="item">
				<div class="card bg-transparent">
					<!-- Article title -->
					<div class="card-header bg-transparent border-bottom py-0 px-0">
						<h5>채용 정보</h5>
					</div>
					
					<!-- Article Info -->
					<div class="card-body px-0">
						<!-- Card item START -->
						<div class="card rounded-0 overflow-hidden shadow">
							<div class="row g-0">

								<!-- Card body -->
								<div class="col-md-12" style="">
									<div class="card-body">
										<!-- Title -->
										<div class="d-flex align-items-center mb-2">
											<h6 class="card-title mb-0">${recruit.entNm }</h6>&nbsp;
											<button class="h6 fw-light like" id="likeEnt" style="border: solid 0.5px; background-color: white; margin: 0px;">
												<i class="heart" style="font-style: normal; color: gray;">&#x2665;</i>
													관심기업
											</button>
										</div>
										<h4 style="font-size: 26px">${recruit.recruitTtl }</h4>
										<hr/>
										<!-- Content -->
										<!-- Info -->
										<table style="width: 100%; text-align: center">
											<tr>
												<th width="50%" colspan="2" style="text-align: center;">지원자격</th>
<!-- 												<th width="30%"></th> -->
												<th width="50%" colspan="2" style="text-align: center;">근무조건</th>
<!-- 												<th width="30%"></th> -->
											</tr>
											<tr>
												<td width="20%">경력사항</td>
												<td width="30%" style="text-align: start; padding-left: 90px;">${recruit.recruitCareerCodeNm }</td>
												<td width="20%">고용형태</td>
												<td width="30%" style="text-align: start; padding-left: 90px;">
													<c:forEach var="hire" items="${hireSttsList }">
														${hire.hireCmmndNm }
													</c:forEach> 
												</td>
											</tr>
											<tr>
												<td>필수사항</td>
												<td style="text-align: start; padding-left: 90px;">
													<c:forEach items="${esntlMap}" var="enstl" varStatus="loop">
								                    	${fn:substringAfter(enstl, "=")}
								                    	<c:if test="${!loop.last}"> </c:if>
								                    </c:forEach>
												</td> 
												<td>급여조건</td>
												<td style="text-align: start; padding-left: 90px;">${recruit.recruitPay }</td> 
											</tr>
											<tr>
												<td>우대사항</td>
												<td style="text-align: start; padding-left: 90px;">
													<c:forEach items="${preferMap}" var="prefer" varStatus="loop">
													    ${fn:substringAfter(prefer, "=")}
													    <c:if test="${!loop.last}"> </c:if>
													</c:forEach>
												</td>
												<td>근무지역</td>
												<td style="text-align: start; padding-left: 90px;">${recruit.cmmncdGrpCd } ${recruit.cmmncdNm1 }</td>
											</tr>
										</table>

										
									</div>
								</div>
							</div>
						</div>
						<!-- Card item END -->

					</div>
					
				</div>
			</div>
			<!-- Advance Usage content END -->
		</div>

		<div class="col-md-12 d-flex justify-content-center">
			<sec:authorize access="!hasRole('ROLE_AUTH103')">
				<button type="button" class="btn btn-primary applyBtn" style="width: 200px; height: 40px; margin-right: 50px;"><i class="bi bi-check-lg"></i>즉시지원</button>
            </sec:authorize>
			<sec:authorize access="hasRole('ROLE_AUTH103')">
				<button type="button" class="btn btn-primary entApplyBtn" style="width: 200px; height: 40px; margin-right: 50px;"><i class="bi bi-check-lg"></i>즉시지원</button>
            </sec:authorize>
			<button type="button" id="likeRecruitBtn" class="btn" style="width: 200px; height: 40px; border: solid 1px;"><i class="bi bi-star-fill" style="color: darkgray;"></i>스크랩</button>
		</div>
		<br/>

		<div class="row g-4">
			<!-- Left side START -->
			<div class="col-md-2">
				<div data-sticky data-margin-top="80" data-sticky-for="576">
					<div id="nav-scroll" class="navbar" style="padding-top: 30px;">
						<nav class="nav nav-pills nav-pill-soft flex-column">
							<a class="nav-link" id="side-item-1"><i class="bi bi-emoji-smile fa-fw me-2"></i>상세요강</a>
							<a class="nav-link" id="side-item-2"><i class="bi bi-layers fa-fw me-2"></i>접수기간/방법</a>
							<a class="nav-link" id="side-item-3"><i class="bi bi-info-circle fa-fw me-2"></i>지원자 정보</a>
							<a class="nav-link" id="side-item-4"><i class="bi bi-search fa-fw me-2"></i>기업 정보</a>
							<a class="nav-link" id="side-item-5"><i class="bi bi-house fa-fw me-2"></i>기업 게시판</a>
						</nav>
					</div>
				</div>
			</div>
			<!-- Left side END -->

			<!-- Right side START -->
			<div class="col-md-10">
				<div class="nav-scroll" data-bs-spy="scroll" data-bs-target="#nav-scroll" data-bs-smooth-scroll="true" tabindex="0">
					<!-- Get Started content START -->
					<div id="item-1" tabindex="-1">
						<div class="card bg-transparent">
							<!-- Article title -->
							<div class="card-header bg-transparent py-0 px-0">
								<h5 style="margin-bottom: 0px;">상세요강</h5>
								<!-- Update and author -->
								<!-- <ul class="nav nav-divider mb-3">
									<li class="nav-item">Last updated: 7 months ago</li>
									<li class="nav-item">by Sam Lanson</li>
								</ul> -->
							</div>
							<!-- Article Info -->
							<div class="card-body px-0 pb-0">
								<div class="col-md-12" style="border: 1px solid #dee2e6;">
									<div class="card-body">
<!-- 										<label for="boContent"></label> -->
										<img src="/main/fileDisplay?recruitNo=${recruit.recruitNo }&pstnCmmncdNm=${recruit.pstnCmmncdNm}" alt="파일없음" style="width: 1012.05px; height: auto;">
<!-- 										<textarea id="boContent" name="boContent" class="form-control" rows="14"></textarea> -->
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- Get Started content END -->

					<!-- Divider -->
					<div class="text-center h5 my-5"></div>


					<!-- Account setup content START -->
					<div id="item-2" tabindex="-1">
						<div class="card bg-transparent">
							<!-- Article title -->
							<div class="card-header bg-transparent py-0 px-0">
								<h5 style="margin-bottom: 0px;">접수기간/방법</h5>
							</div>

							<!-- Article Info -->
							<div class="card-body px-0">
								<div class="col-md-12" style="border: 1px solid #dee2e6;">
									<div class="card-body">
										<div class="row">
											<div class="col-md-5" style="text-align: center;">
												<div>
													<i class="bi bi-calendar-range" style="font-size: 2em;"></i><br/>
													<span style="font-size: 1em;">남은시간</span>
												</div>
												<span id="time"></span>
												<span id="formatDate"></span>
												<br/>
												<p id="formatTime"></p>
											</div>
											<div class="col-md-7">
												<button type="button" class="btn btn-primary applyBtn" >채용페이지로 이동</button>
												<p>홈페이지 지원 클릭수 : ${recruit.entApply }</p>
												모집분야&nbsp;&nbsp;&nbsp;<span>${recruit.pstnCmmncdNm }</span><br/>
												모집인원&nbsp;&nbsp;&nbsp;<span>${recruit.recruitCnt }명</span><br/>
<!-- 												<input type="button" value="즉시 지원"> -->
											</div>
										</div>
									</div>
								</div>
							</div>
							
							
						</div>
					</div>
					<!-- Account setup content END -->

					<!-- Divider -->
					<div class="text-center h5 my-5"></div>

					<!-- Other Topics content START -->
					<div id="item-3" tabindex="-1">
						<div class="card bg-transparent">
							<!-- Article title -->
							<div class="card-header bg-transparent py-0 px-0">
								<h5 style="margin-bottom: 0px;">지원자 정보</h5>
							</div>

							<!-- Article Info -->
							<div class="card-body px-0">
								<div class="col-md-12" style="border: 1px solid #dee2e6;">
									<div class="card-body">
										<div class="row">
											<div class="col-md-4">
												<table width="100%;">
													<span style="font-size: 18px;">학교</span><hr/>
													<tbody id="schoolTableBody"></tbody>
												</table>
											</div>


											<div class="col-md-4">
												<table width="100%;">
													<span style="font-size: 18px;">전공</span><hr/>
													<tbody id="departmentTableBody"></tbody>
												</table>
											</div>

											<div class="col-md-4" style="position: relative;">
												<span style="font-size: 18px;">성별</span><hr/>
<!-- 												<div id="ChartPageViews" style="min-height: 100px; width: 300px;"></div> -->
												<div class="mb-3 mb-xl-0 d-flex justify-content-center" id="apexChartPageViews"></div>
											</div>
											
										</div>
									</div>
								</div>
							</div>
							
						</div>
					</div>
					<!-- Other Topics content END -->

					<!-- Divider -->
					<div class="text-center h5 my-5"></div>

					<!-- Advance Usage content START -->
					<div id="item-4" tabindex="-1">
						<div class="card bg-transparent">
							<!-- Article title -->
							<div class="card-header bg-transparent py-0 px-0">
								<h5 style="margin-bottom: 0px;">기업 정보</h5>
							</div>

							<!-- Article Info -->
							<div class="card-body px-0">
								<div class="col-md-12" style="border: 1px solid #dee2e6;">
									<div class="card-body">

										<!-- Card item START -->
										<div class="card rounded overflow-hidden">
											<div class="row g-0">

												<!-- Image -->
												<div class="col-md-3">
													<div class="logo-container">
														<img src="/main/logodisplay?entNo=${recruit.entNo }" alt="logo" style="height: 143.5px; width: 100%; object-fit: contain;">
													</div>
												</div>
												
												<!-- Card body -->
												<div class="col-md-9">
													<div class="card-body">
														<!-- Title -->
														<div class="d-flex justify-content-start align-items-center mb-2" style="display: flex; align-items: baseline;">
															<h5 class="card-title mb-0">${recruit.entNm }</h5>
															&nbsp;
															<div class="d-flex align-items-center">
																<button onclick="window.location.href='/ent/detail.do?entNo=${recruit.entNo }'" class="h6 fw-light" 
																		style="height: 30px; border: solid 1px; background-color: white; margin: 0px">
																	<span>기업정보</span>
																</button>
																&nbsp;
																<!-- Wishlist icon -->
																<button class="h6 fw-light like" id="likeBtn" style="height: 30px; border: solid 1px; background-color: white; margin: 0px;">
																	<i class="heart" style="font-style: normal; color: gray;">&#x2665;</i>
																		${enterprise.entHit } 관심기업
																</button>
															</div>
														</div>
														<!-- Content -->
														<!-- Info -->
														<table width="100%">
															<tr>
																<td>산업</td>
																<td>${enterprise.ksicNm }</td>
																<td>사원수</td>
																<td>${enterprise.empCnt } 명</td>
															</tr>
															<tr>
																<td>설립</td>
																<td id="fndnYr"></td>
																<td>기업형태</td>
																<td>${enterprise.bizTypeNm }</td>
															</tr>
															<tr>
																<td>매출액</td>
																<td><fmt:formatNumber pattern="#,###" value="${enterprise.entEbit }"/> 원</td>
															</tr>
														</table>

													</div>
												</div>
											</div>
										</div>
										<!-- Card item END -->

									</div>
								</div>
							</div>
							
						</div>
					</div>
					<!-- Advance Usage content END -->

					<!-- Divider -->
					<div class="text-center h5 my-5"></div>

					<div id="item-5" tabindex="-1">
						<div class="card bg-transparent">
							<!-- Article title -->
							<div class="card-header bg-transparent py-0 px-0" style="display: flex; justify-content: space-between; align-items: flex-end;">
								<h5 style="margin-bottom: 0px;">기업 게시판</h5><a href="/board/ent/list.do?entNo=${recruit.entNo }" style="color: black;"><span style="font-size: 13px;">게시판 더보기<i class="bi bi-chevron-right"></i></span></a>
							</div>
							<!-- Article Info -->
							<div class="card-body px-0">
								<div class="col-md-12" style="border: 1px solid #dee2e6;">
									<div class="card-body">
										<table width="100%">
											<tr>
												<td><a href="/board/ent/detail.do?entNo=${boardNotice.entNo }&bbsNo=${boardNotice.bbsNo}"><h5>[공지]${boardNotice.bbsTtl }</h5></a></td>
											</tr>
											<tr>
												<td><h6>${boardNotice.bbsCn }</h6></td>
											</tr>
											<tr>
												<td>
													<i style="font-style: normal;" class="bi bi-eye"> ${boardNotice.bbsInqCnt } </i>조회수&nbsp;&nbsp;
													<i style="font-style: normal;" class="bi bi-chat-left"> ${boardNotice.noticeEntCommentHit } </i>댓글수&nbsp;&nbsp;
													<i style="font-style: normal;" id="noticeReg"></i>
												</td>
											</tr>
										</table>
										<hr/>
										<table width="100%">
											<tr>
												<td><a href="/board/ent/detail.do?entNo=${boardFree.entNo }&bbsNo=${boardFree.bbsNo}"><h5>[자유]${boardFree.bbsTtl }</h5></a></td>
											</tr>
											<tr>
												<td><h6>${boardFree.bbsCn }</h6></td>
											</tr>
											<tr>
												<td>
													<i style="font-style: normal;" class="bi bi-eye"> ${boardFree.bbsInqCnt } </i>조회수&nbsp;&nbsp;
													<i style="font-style: normal;" class="bi bi-chat-left"> ${boardFree.freeEntCommentHit } </i>댓글수&nbsp;&nbsp;
													<i style="font-style: normal;" id="freeReg"></i>
												</td>
											</tr>
										</table>
									</div>
								</div>
							</div>
							
							
						</div>
					</div>

				<!-- Divider -->
				<div class="text-center h5 my-5"></div>

				</div>
			</div>
			<!-- Right side END -->
		</div>
		
		
		<!-- 이력서 모달 -->
        <div class="modal fade twm-saved-jobs-view" id="resumeView" aria-hidden="true" aria-labelledby="saved_job_view" tabindex="-1">
	
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <form>
    
                        <div class="modal-header">
<!--                             <h2 class="modal-title" id="saved_job_view">ITcruit</h2> -->
                            <h5>이력서를 선택해주세요.</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
    
                        <div class="modal-body" id="resumeModalBody">
                            
                        </div>
    
                        <div class="modal-footer">
                            <button type="button" class="btn btn-info site-button" data-bs-dismiss="modal">확인</button>
                        </div>
    
                    </form>
                </div>
            </div>
            
        </div>
        <form id="resumeForm" action="/resume/registerView" method="post">
        	<input type="hidden" name="accounId" value="${aId }">
        <sec:csrfInput/>
        </form>
	</div>
	<div class="modal fade" id="pdfModal" tabindex="-1" role="dialog" aria-labelledby="pdfModalLabel" aria-hidden="true">
	    <div class="modal-dialog modal-xl" role="document"> <!-- 크기를 'modal-xl'로 설정 -->
	        <div class="modal-content">
	            <div class="modal-header">
	                <h5 class="modal-title" id="pdfModalLabel">PDF Viewer</h5>
	               <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	            </div>
	            <div class="modal-body">
	                <iframe id="pdfViewer" style="width:100%; height:800px;"></iframe> <!-- 높이를 증가 -->
	            </div>
	        </div>
	    </div>
	</div>
</section>
</body>


<script src="${pageContext.request.contextPath }/resources/assets/vendor/apexcharts/js/apexcharts.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/assets/vendor/sticky-js/sticky.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/pdf.js/2.6.347/pdf.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf-autotable/3.5.23/jspdf.plugin.autotable.min.js"></script>
<script type="text/javascript">
const { jsPDF } = window.jspdf;
$(function(){
	// 관심기업 버튼클릭 이벤트
    var accountId = "${recruit.accountId }";
    var entNo = ${recruit.entNo };
    var recruitNo = "${recruit.recruitNo }";
    var pstnCmmncdNm = "${recruit.pstnCmmncdNm}";

    var obj = {
    	accountId : accountId,
    	entNo : entNo
    }
    
    $('.like').click(function(){
        
    	if(accountId == null || accountId == ""){
    		Swal.fire(
                    '로그인 후 이용해주세요.'
                );
        	return;
        }
        
    	var num = parseInt($(this).text());
    	
    	if($('.heart').hasClass('text-danger')){
    		
    		$.ajax({
            	type : "post",
            	url : "/like/hateEnt.do",
            	contentType : "application/json; charset=utf-8",
            	data : JSON.stringify(obj),
            	beforeSend: function(xhr) {
                    xhr.setRequestHeader(header, token);
                },
                success : function(result){
                	console.log(result);
                	if(result.likeEntYN == "Y"){
                		$('.heart').removeClass('text-danger');
                		$("#likeBtn").html('<i class="heart" style="font-style: normal; color: gray;">&#x2665;</i>' + result.entHit + " 관심기업");
                		console.log("관심기업 등록취소");
                	}else{
                		console.log("관심기업 등록취소 실패");
                	}
                }
                
            });
    		
    	}else{
    		
    		$.ajax({
            	type : "post",
            	url : "/like/loveEnt.do",
            	contentType : "application/json; charset=utf-8",
            	data : JSON.stringify(obj),
            	beforeSend: function(xhr) {
                    xhr.setRequestHeader(header, token);
                },
                success : function(result){
                	console.log(result);
                	if(result.likeEntYN == "Y"){
                		$('.heart').addClass('text-danger');
                		$("#likeBtn").html('<i class="heart text-danger" style="font-style: normal; color: gray;">&#x2665;</i>' + result.entHit + " 관심기업");
                		console.log("관심기업 등록성공");
                	}else{
                		console.log("관심기업 등록실패");
                	}
                }
                
            });
    	}
    });

    // 기업이 지원하기 버튼을 누르는 경우
    var entApplyBtn = $(".entApplyBtn");
    
    entApplyBtn.on("click", function(){
		return;
    });
    
    var applyBtn = $(".applyBtn");
    // 지원버튼 이벤트
    applyBtn.on("click", function(){
    	
//         console.log(accountId);
//         console.log(recruitNo);
        
        if(accountId == null || accountId == ""){
        	Swal.fire({
       		    title: '로그인 후 이용해주세요.'
       		}).then((result) => {
       		  if (result.isConfirmed) {
       		    // 확인 버튼을 클릭한 경우
       		    location.href = "/main/loginForm.do";
       		  }
       		}).catch((error) => {
       	        // 에러 처리 (선택 사항)
       	        console.error(error);
       	    });
       	    return;
        }
        
        
     	// 공고 종료 여부 확인
        var endTime = new Date("${recruit.recruitEndDt}");
        var currentTime = new Date();
        var timeDiff = endTime - currentTime;
        
        if (timeDiff <= 0) {
            // 공고가 이미 마감된 경우
            Swal.fire('채용공고 마감시간이 지났습니다.');
            return; // 함수 종료
        }
        
        var obj = {
        	accountId : accountId,
        	recruitNo : recruitNo,
        	pstnCmmncdNm : pstnCmmncdNm
        }
    	
        $.ajax({
        	type : "post",
        	url : "/like/apply.do",
        	contentType : "application/json; charset=utf-8",
        	data : JSON.stringify(obj),
        	beforeSend: function(xhr) {
                xhr.setRequestHeader(header, token);
            },
            success : function(result){
//             	console.log(result);
//             	console.log(result.resumeList);
//             	console.log(result.recruit);
            	
            	
            	var resumeList = result.resumeList;
            	var recruit = result.recruit;
            	
            	var processYn = recruit.processYn;
            	var entUrl = recruit.entUrl;
            	var resumeCheck = recruit.resumeCheck;
            	var applicantCheck = recruit.applicantCheck;
//             	console.log(processYn);
//             	console.log(entUrl);
//             	console.log(resumeCheck);
//             	console.log(applicantCheck);


// 				// 지원내역  확인
				if(applicantCheck == 'Y'){
					Swal.fire(
			      			  '지원내역이 있습니다.'
			      			)
					return;
				}else{
					// 이력서 확인
					if(resumeCheck == 'N'){
						Swal.fire({
							  title: '이력서 미작성 회원입니다. 이동하시겠습니까?',
							  icon: 'warning',
							  showCancelButton: true,
							  confirmButtonText: '확인',
							  cancelButtonText: '취소'
							}).then((result) => {
							  if (result.isConfirmed) {
							    // 확인 버튼을 클릭한 경우
								   $("#resumeForm").submit();
							  } else {
							    // 취소 버튼을 클릭한 경우
							    return;
							  }
							});
					}else{
						
						
						var modalBody = $('#resumeView .modal-body');
						modalBody.empty(); // 모달 내용 초기화
						
// 				        var rsmNo = resume.rsmNo;
// 				        var accountId = resume.accountId;
// 				        var rsmGender = resume.rsmGender;
// 				        var rsmTtl = resume.rsmTtl;
// 				        var rsmCareerYear = resume.rsmCareerYear;
// 				        var rsmRlsYn = resume.rsmRlsYn;
// 				        var rsmPhoto = resume.rsmPhoto;
// 				        var rsmIntroduction = resume.rsmIntroduction;
// 				        var eduEnd = resume.eduEnd;
// 				        var eduNm = resume.eduNm;
// 				        var grade = resume.grade;
// 				        var full = resume.full;
// 				        var rsmMjrNm = resume.rsmMjrNm;
// 				        var rsmMjrCd = resume.rsmMjrCd;
// 				        var rsmNewCareer = resume.rsmNewCareer;
// 				        var eduAcdmcr = resume.eduAcdmcr;

		                // 테이블 생성
						var table = $('<table class="table"><thead><tr><th></th><th>번호</th><th style="padding-left: 57px;">이름</th><th>보기</th></tr></thead><tbody></tbody></table>');
						modalBody.append(table);
						var tbody = table.find('tbody');
						console.log("resumeList");
						console.log(resumeList);
						$.each(resumeList, function(index, resume) {
							var row = $('<tr>' +
					                  '<td><input class="form-check-input resume-checkbox" type="checkbox" value="' + resume.rsmNo + '" id="resumeCheckbox' + index + '"></td>' +
					                  '<td>' + (index + 1) + '번</td>' +
					                  '<td style="cursor: pointer;" onclick="location.href=\'/resume/updateView?rsmNo='+ resume.rsmNo +'\'">' + resume.rsmTtl + '</td>' +
					                  '<td style="cursor: pointer;"><i class="bi bi-search resume-view-icon" data-rsm-no="' + resume.rsmNo + '"></i></td>' +
					              '</tr>');
					    	tbody.append(row);
					    	
					    	
						
						    // 체크박스 클릭 이벤트 처리
						    row.find('.resume-checkbox').on('change', function() {
						        if ($(this).is(':checked')) {
// 						        	console.log(resume.rsmNo);
						        	var rsmNo = resume.rsmNo;
// 						            resumePdf(rsmNo);
						            
						            // 다른 체크박스들의 체크를 해제
						            $('.resume-checkbox').not(this).prop('checked', false);
						
						            // 선택된 이력서의 소개를 보여주는 div 생성
// 						            var introductionDiv = $('<div class="resume-introduction">' +
// 						                                        '<h4>' + resume.rsmTtl + '</h4>' +
// // 						                                        '<p>' + resumePdf(rsmNo) + '</p>' +
// 						                                    '</div>');
// 						            var pdfViewer = $('<iframe id="pdfViewer" style="width:100%; height:800px;" src="' + resumePdf(rsmNo) + '"></iframe>');

// 						         	// iframe을 introductionDiv 안에 추가
// 						         	introductionDiv.append(pdfViewer);
						         	// 기존에 선택된 이력서 내용이 있다면 삭제
						            $('.resume-introduction').remove();
// 						            modalBody.append(introductionDiv);
						        } else {
						            // 선택 해제된 경우 해당 이력서의 소개를 보여주는 div 제거
						            $('.resume-introduction').remove();
						        }
						        
						        
						    });
					        // 돋보기 누르면 모달로 이력서 pdf 추가
					        modalBody.find('table').on('click', '.resume-view-icon', function() {
					            var rsmNo = $(this).data('rsm-no');
					            console.log('Clicked resume number:', rsmNo);
					            resumePdf(rsmNo);
					        });
						});
		                
		                // 이력서 선택 모달 열기
		                $('#resumeView').modal('show');
		                
		                
		             	// 모달이 닫힐 때 한 번만 실행되는 이벤트 핸들러
		                $('.site-button').on('click', function () {
		                    // 선택한 이력서 정보를 담을 배열
		                    var selectedResumes = [];
		                    // 선택된 체크박스의 값을 배열에 추가
		                    $('.resume-checkbox:checked').each(function () {
		                        selectedResumes.push($(this).val());
		                    });

		                 	// 선택된 이력서가 없는 경우
		                    if (selectedResumes.length === 0) {
		                        return; // 함수 종료
		                    }
		                    
							var rsmNo = selectedResumes[0];
// 							console.log(rsmNo);
		                    
							// 이력서번호 포함해서 다시 보내기
							var obj = {
									rsmNo: rsmNo,
							        accountId: accountId,
							        recruitNo: recruitNo,
							        pstnCmmncdNm: pstnCmmncdNm
							    };
							
							
							 $.ajax({
						        	type : "post",
						        	url : "/like/applyInsert.do",
						        	contentType : "application/json; charset=utf-8",
						        	data : JSON.stringify(obj),
						        	beforeSend: function(xhr) {
						                xhr.setRequestHeader(header, token);
						            },
						            success : function(result){
// 						            	console.log(result);
						            	
						            	// 프로세스 확인
										if(processYn == "Y"){
						            		location.href = "/main/introForm.do?recruitNo=" + recruitNo + "&pstnCmmncdNm=" + pstnCmmncdNm;
						            	}else{
						            		if (!entUrl.startsWith("http://") && !entUrl.startsWith("https://")) {
						            	        // 상대 URL인 경우, 절대 URL로 변환
						            	        entUrl = "http://" + entUrl;
						            	    }
						            	    window.open(entUrl, "_blank");
						            	}
						            }
						            
							 });
							 
							
		                });
		                
						
					}

				}
            }          
        });
        
    });
    
    // 관심공고
    var likeRecruitBtn = $("#likeRecruitBtn");
    
    likeRecruitBtn.on("click", function(){

    	if(accountId == null || accountId == ""){
    		Swal.fire(
                    '로그인 후 이용해주세요.'
                );
        	return;
        }		
    	
        var obj = {
          	accountId : accountId,
        	recruitNo : recruitNo,
        	pstnCmmncdNm : pstnCmmncdNm
        }
        
       	if($('.bi-star-fill').hasClass('text-warning')){
       		
       		$.ajax({
               	type : "post",
               	url : "/like/hateRecruit.do",
               	contentType : "application/json; charset=utf-8",
               	data : JSON.stringify(obj),
               	beforeSend: function(xhr) {
                       xhr.setRequestHeader(header, token);
                   },
                   success : function(result){
//                    	console.log("!!!!" + result);
                   	if(result == "Y"){
                   		$('.bi-star-fill').removeClass('text-warning');
                   		console.log("관심공고 등록취소");
                   	}else{
                   		console.log("관심공고 등록취소 실패");
                   	}
                   }
                   
               });
       		
       	}else{
       		
       		$.ajax({
               	type : "post",
               	url : "/like/loveRecruit.do",
               	contentType : "application/json; charset=utf-8",
               	data : JSON.stringify(obj),
               	beforeSend: function(xhr) {
                       xhr.setRequestHeader(header, token);
                   },
                   success : function(result){
//                    	console.log("!!!!" + result);
                   	if(result == "Y"){
                   		$('.bi-star-fill').addClass('text-warning');
                   		console.log("관심공고 등록성공");
                   	}else{
                   		console.log("관심공고 등록실패");
                   	}
                }
               
            });
       	}
    	
    });
 
    /* 사이드바 선택 시 해당 항목으로 이동 */
    $('#side-item-1').on('click', function(){
	    $('#item-1').attr("tabindex", -1).focus();
    });
    $('#side-item-2').on('click', function(){
	    $('#item-2').attr("tabindex", -1).focus();
    });
    $('#side-item-3').on('click', function(){
	    $('#item-3').attr("tabindex", -1).focus();
    });
    $('#side-item-4').on('click', function(){
	    $('#item-4').attr("tabindex", -1).focus();
    });
    $('#side-item-5').on('click', function(){
	    $('#item-5').attr("tabindex", -1).focus();
    });
    
    
});

function resumePdf(rsmNo){
	console.log("!!#@#");
	console.log(rsmNo);
	$.ajax({
		
		url : "/myPage/enterprise/getResumePdf",
		method : "GET",
		data : {rsmNo : rsmNo},
		beforeSend: function(xhr) {
            xhr.setRequestHeader(header, token);
        },
		success : function(res) {
			
			console.log(res);
			
			
			var sex;
			
			if(res.resume.gender == "M"){
				sex = "남자";
			}else{
				sex = "여자";
			}
			////
			var date = new Date(res.resume.birthYmd);
			var year = date.getFullYear();
			var month = date.getMonth() + 1;
			var day = date.getDate();

			month = month < 10 ? "0" + month : month;
			day = day < 10 ? "0" + day : day;

			var formatDate = year + "/" + month + "/" + day;
			
			////
			var careers = JSON.parse(res.career);
			var formatCareers = careers.map(function(career) {
			    var resignationDate = career.careerRsgntnYm === "0000/00" ? "재직중" : career.careerRsgntnYm;
			
			    return [
			        career.careerJncmpYm + " ~ " + resignationDate,
			        career.careerCoNm, 
			        career.careerJbgdNm, 
			        career.careerTkcgTaskNm 
			    ];
			}).slice(0,3);
			
			while (formatCareers.length < 3) {
				formatCareers.push(["", "", "", ""]);
			}
			
			console.log(formatCareers);
			////////////////////////
			var availLangs = JSON.parse(res.availLang);
			var langNames = availLangs.map(function(lang) {
			    return lang.availLangCmmncdNm;
			}).join(", ");

			console.log(langNames);
			/////////////////////////
			var portfolios = JSON.parse(res.portfolio);
			
			var formatPortfolios = portfolios.map(function(portfolio) {
			    return [portfolio.portUrlTtl, portfolio.portUrl];
			});
			
			while (formatPortfolios.length < 3) {
				formatPortfolios.push(["", ""]);
			}
			
			console.log(formatPortfolios);
			//////////////////
			var certificates = JSON.parse(res.certificate);
			var formatCertificates = certificates.map(function(certificate) {
			    return [
			        certificate.crtfctQlfcAcqsYm,
			        certificate.crtfctNm,
			        certificate.crtfctPblcnInstNm
			    ];
			});
			
			while (formatCertificates.length < 4) {
				formatCertificates.push(["", "", ""]);
			}
			
			console.log(formatCertificates);
			////////////////////////////
			var experiences = JSON.parse(res.experience);
			
			var formatExperiences = experiences.map(function(experience) {
			    var period = experience.experBgngYm + " ~ " + experience.experEndYm;
			    return [
			        period,
			        experience.experNm,
			        experience.experCoNm ,
			        experience.experCn
			    ];
			});
			
			while (formatExperiences.length < 4) {
				formatExperiences.push(["", "", "", ""]);
			}
			
			console.log(formatExperiences);
			////////
			
			var doc = new jsPDF("p", "mm", "a4");
			var font = res.font; 
			var fontBold = res.fontBold;

			// 일반 및 볼드 폰트 추가
			doc.addFileToVFS("malgun.ttf", font);
			doc.addFont("malgun.ttf", "malgun", "normal");

			doc.addFileToVFS("malgunbd.ttf", fontBold);
			doc.addFont("malgunbd.ttf", "malgun", "bold");

			doc.setFont("malgun");

			doc.setFontSize(18);
			doc.text("이력서", 105, 20, { align: "center" });

			doc.setTextColor(100, 100, 100);
			doc.line(10, 25, 200, 25);  

			doc.setTextColor(0, 0, 0); 
			doc.addImage(res.photo, 'JPEG', 15, 30, 40, 45); 

			doc.setFontSize(11);
			doc.text("이름 : ", 65, 35);
			doc.text("연락처 : ", 65, 45);
			doc.text("이메일 : ", 65, 55);
			doc.text("주소 : ", 65, 65);

			doc.text("성별 : ", 145, 35);
			doc.text("생년월일 : ", 145, 45);
			doc.text("경력 : ", 145, 55);

			doc.text(res.resume.accountNm, 80, 35);
			doc.text(res.resume.accountTell, 80, 45);
			doc.text(res.resume.accountMail, 80, 55);
			doc.text(res.resume.accountAddr1, 80, 65);
			doc.text(sex, 155, 35);
			doc.text(formatDate, 165, 45);
			doc.text(res.education.rsmCareerYear.toString()+"년", 155, 55);
			

			doc.setFontSize(17);
			doc.text("학력사항", 15, 85, { align: 'left' });

			doc.setDrawColor(0);
			doc.setLineWidth(0.5);

			doc.setFontSize(14);
			doc.autoTable({
				head: [['졸 업 년 월', '학 교 명', '전 공 / 분 야', '학 점']],
			    body: [
			    	[res.education.eduEnd, res.education.eduNm, res.education.rsmMjrNm, res.education.grade],
			    ],
			    startY: 90,
			    theme: 'grid',
			    styles: { font: 'malgun', lineColor: [0, 0, 0], lineWidth: 0.5, minRowHeight: 20},
			    headStyles: {
			        fillColor: [220, 220, 220],
			        textColor: [0, 0, 0],
			        fontStyle: 'bold' // 볼드 스타일 적용
			    },
			    bodyStyles: { minRowHeight: 30 }
			});

			doc.setFontSize(17);
			doc.text("경력사항", 15, 120, { align: 'left' });
			doc.autoTable({
			    head: [['기 간', '근 무 처', '직 위', '업 무 내 용']],
			    body: formatCareers,
			    startY: 125,
			    theme: 'grid',
			    styles: { font: 'malgun', lineColor: [0, 0, 0], lineWidth: 0.5 },
			    headStyles: {
			        fillColor: [220, 220, 220],
			        textColor: [0, 0, 0],
			        fontStyle: 'bold' // 볼드 스타일 적용
			    },
			    bodyStyles: { minRowHeight: 12 }
			});

			doc.setFontSize(17);
			doc.text("경험(인턴, 대외활동, 아르바이트)", 15, 170, { align: 'left' });
			doc.autoTable({
				head: [['기 간', '제 목', '회 사 명', '내 용']],
			    body: formatExperiences,
			    startY: 175,
			    theme: 'grid',
			    styles: { font: 'malgun', lineColor: [0, 0, 0], lineWidth: 0.5 },
			    headStyles: {
			        fillColor: [220, 220, 220],
			        textColor: [0, 0, 0],
			        fontStyle: 'bold'
			    },
			    bodyStyles: { minRowHeight: 15 }
			});
			
			doc.text("자격증", 15, 225, { align: 'left' });
			doc.autoTable({
			    head: [['취 득 년 월 일', '자 격 / 면 허 증', '시 행 처']],
			    body: formatCertificates,
			    startY: 230,
			    theme: 'grid',
			    styles: { font: 'malgun', lineColor: [0, 0, 0], lineWidth: 0.5 },
			    headStyles: {
			        fillColor: [220, 220, 220],
			        textColor: [0, 0, 0],
			        fontStyle: 'bold' // 볼드 스타일 적용
			    },
			    bodyStyles: { minRowHeight: 15 }
			});

			doc.setTextColor(100, 100, 100);
			doc.line(10, 287, 200, 287);

	        
			doc.addPage();
			doc.setPage(2);
			doc.setFontSize(17);
			doc.text("포트폴리오", 15, 20, { align: 'left' });
			doc.autoTable({
			    head: [['이 름', 'URL']],
			    body: formatPortfolios,
			    startY: 25,
			    theme: 'grid',
			    styles: { font: 'malgun', lineColor: [0, 0, 0], lineWidth: 0.5 },
			    headStyles: {
			        fillColor: [220, 220, 220],
			        textColor: [0, 0, 0],
			        fontStyle: 'bold' 
			    },
			    bodyStyles: { minRowHeight: 15 }
			});
			
			doc.setFontSize(17);
			doc.text("보유기술", 15, 75, { align: 'left' });
			doc.autoTable({
			    head: [['사 용 언 어']],
			    body: [
			        [langNames]
			    ],
			    startY: 80,
			    theme: 'grid',
			    styles: { font: 'malgun', lineColor: [0, 0, 0], lineWidth: 0.5 },
			    headStyles: {
			        fillColor: [220, 220, 220],
			        textColor: [0, 0, 0],
			        fontStyle: 'bold' 
			    },
			    bodyStyles: { minRowHeight: 15 }
			});

			doc.setTextColor(100, 100, 100);
			doc.line(10, 287, 200, 287);
			
            const pdfBlob = doc.output('blob');
            const blobUrl = URL.createObjectURL(pdfBlob);

            document.getElementById('pdfViewer').src = '/resources/pdfjs-4.2.67-dist/web/viewer.html?file=' + encodeURIComponent(blobUrl) + '#zoom=page-fit';
            $('#pdfModal').modal('show'); // Bootstrap 모달을 표시
		}
	});
}

// 남은시간표시
function timer(){
	var endTime = new Date("${recruit.recruitEndDt }");
    var currentTime = new Date();
    
    var time = endTime - currentTime;
    var timeHTML = "";
 	// 공고 종료 시간이 지났을 경우
    if (time <= 0) {
    	timeHTML = "<span style='color: red; font-size: 1.3em;'>공고마감</span><br/>";
    	document.getElementById("time").innerHTML = timeHTML;
    	
//     	var applyBtn = $(".applyBtn");
//     	applyBtn.off("click"); // 클릭 이벤트 제거
//     	applyBtn.prop("disabled", true); // 버튼 비활성화
        
        return; // 시간을 업데이트하지 않고 함수를 종료
    }
    
    // 타입에 맞게 저장
    var days = Math.floor(time / (1000 * 60 * 60 * 24));
    var hours = Math.floor((time % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
    var minutes = Math.floor((time % (1000 * 60 * 60)) / (1000 * 60));
    var seconds = Math.floor((time % (1000 * 60)) / 1000);
    
    // 9을 09로 출력
    var daysStr = days < 10 ? "0" + days : days;
    var hoursStr = hours < 10 ? "0" + hours : hours;
    var minutesStr = minutes < 10 ? "0" + minutes : minutes;
    var secondsStr = seconds < 10 ? "0" + seconds : seconds;
    
	timeHTML += "<span style='color: red; font-size: 1.3em;'>" + daysStr + "일</span>&nbsp;";
	timeHTML += "<span style='color: red; font-size: 1.3em;'>" + hoursStr + ":" + minutesStr + ":" + secondsStr + "(시간)</span><br/>";

	document.getElementById("time").innerHTML = timeHTML;
}

timer();
	
setInterval(timer, 1000);

// 시작일,마감일 변경
function formatDate(dateString) {
    var date = new Date(dateString);
    var year = date.getFullYear();
    var month = date.getMonth() + 1; 
    var day = date.getDate();

    month = month < 10 ? "0" + month : month;
    day = day < 10 ? "0" + day : day;

    // 요일 구하기
    var days = ['일', '월', '화', '수', '목', '금', '토'];
    var dayOfWeek = days[date.getDay()];

    return year + "." + month + "." + day + "(" + dayOfWeek + ")";
}
var startDate = "${recruit.recruitStrtDt}";
var formatStartDate = formatDate(startDate).trim();
var endDate = "${recruit.recruitEndDt}";
var formatEndDate = formatDate(endDate).trim();
var dateHTML = "시작일 <span style='font-weight: bold;'>" + formatStartDate + "</span><br/>";
dateHTML += "마감일 <span style='font-weight: bold;'>" + formatEndDate + "</span><br/>";
document.getElementById("formatDate").innerHTML = dateHTML;

// 마감시간 변경
var endHours = "${recruit.recruitEndDt}";
var indexT = endHours.indexOf('T'); 
var endTime = endHours.substring(indexT + 1); 
var formatEndTime = endTime.replace(':', '시 ') + '분 마감';
var timeHTML = "<p>" + formatEndTime + "</p>";
document.getElementById("formatTime").innerHTML = timeHTML;

document.addEventListener("DOMContentLoaded", function() {
	
    // 기존 도넛 차트를 제거합니다.
    var existingChartElement = document.querySelector("#apexChartPageViews");
    if (existingChartElement) {
        existingChartElement.innerHTML = "";
    }
    
	// 성별 목록을 쉼표(,)로 분리하여 배열로 변환
	genderList = '${genderList }'.split(', ');
// 	console.log(genderList);

	//성별별 빈도수 계산
	var maleCount = 0;
	var femaleCount = 0;
	genderList.forEach(function(gender) {
	    // 대괄호 제거하고 trim
	    gender = gender.trim().replace("[", "").replace("]", "");
	    if (gender === 'M') {
	        maleCount++;
	    } else if (gender === 'F') {
	        femaleCount++;
	    }
	});

    // 도넛 차트를 렌더링합니다.
    var ThemeColor = {
        getCssVariableValue: function (variableName) {
            var style = getComputedStyle(document.documentElement);
            return style.getPropertyValue(variableName).trim();
        }
    };

    var ff = document.querySelector("#apexChartPageViews");
    if (typeof(ff) != 'undefined' && ff != null) {
        var options = {
            series: [maleCount, femaleCount], // 여기에 남녀수를 넣으면 될거같음
            labels: ['남성', '여성'],
            chart: {
                height: 150,
                width: 150,
                type: 'pie',
                sparkline: {
                    enabled: true
                }
            },
            stroke: {
                colors: 'transparent',
            },
            colors: [
                ThemeColor.getCssVariableValue('--bs-success'),
                ThemeColor.getCssVariableValue('--bs-danger'),
            ],
            tooltip: {
                theme: "dark"
            },
            dataLabels: {
                enabled: true,
                style: {
                    fontSize: '16px' // 데이터 라벨의 폰트 크기를 조절합니다.
//                     ,colors: ['#fff']
                },
                formatter: function (val, context) {
					var name = context.w.config.labels[context.seriesIndex];
					var percent = val.toFixed(1);
// 					console.log(name, percent);

// 					var strTest = name + '\n' + percent + '%';
					var strTest = percent + '%';
// 					console.log(strTest);
					var test = strTest.replace(/\\r\\n|\\n|\\r/gm,"<br>");
// 					console.log(test);
					return strTest;
                }
//                 ,
//                 offsetX: 0, // 가로 방향으로의 이동 거리 (음수 값은 왼쪽, 양수 값은 오른쪽)
//                 offsetY: -10 // 세로 방향으로의 이동 거리 (음수 값은 위쪽, 양수 값은 아래쪽)
            },
            responsive: [{
                breakpoint: 480,
                options: {
                    chart: {
                        height: 100,
                        width: 100
                    },
                    legend: {
                        position: 'bottom'
                    }
                }
            }]
        };
        var chart = new ApexCharts(document.querySelector("#apexChartPageViews"), options);
        chart.render();
        
     
    }
});


function dateFormat(dateStr) {
    // 날짜 문자열을 공백을 기준으로 분리하여 배열로 만듭니다.
    var parts = dateStr.split(" ");

    // 월의 약어를 숫자로 변환합니다.
    var monthMap = {
        "Jan": "01",
        "Feb": "02",
        "Mar": "03",
        "Apr": "04",
        "May": "05",
        "Jun": "06",
        "Jul": "07",
        "Aug": "08",
        "Sep": "09",
        "Oct": "10",
        "Nov": "11",
        "Dec": "12"
    };
    var month = monthMap[parts[1]];

    // 날짜와 시간을 추출합니다.
    var day = parts[2];
    var time = parts[3];
    var year = parts[5];

    // 최종적으로 ISO 8601 형식으로 날짜 문자열을 생성합니다.
    var date = year + "." + month + "." + day;

    return date;
}

var noticeDate = "${boardNotice.bbsRegDt }"; 
var freeDate = "${boardFree.bbsRegDt }"; 
// console.log(noticeDate);
// console.log(freeDate);
// var formatNotice = dateFormat(noticeDate);
// var formatFree = dateFormat(freeDate);
// var noticeBoard = document.getElementById("noticeReg");
// var FreeBoard = document.getElementById("freeReg");
// noticeBoard.innerHTML = "등록일(" + formatNotice + ")";
// FreeBoard.innerHTML = "등록일(" + formatFree + ")";
if(noticeDate !== '') {
    var formatNotice = dateFormat(noticeDate);
    var noticeBoard = document.getElementById("noticeReg");
    noticeBoard.innerHTML = "등록일(" + formatNotice + ")";
}else{
    var noticeBoard = document.getElementById("noticeReg");
    noticeBoard.innerHTML = "등록일( )";
}

if(freeDate !== ''){
	var formatFree = dateFormat(freeDate);
	var FreeBoard = document.getElementById("freeReg");
	FreeBoard.innerHTML = "등록일(" + formatFree + ")";
}else{
	var FreeBoard = document.getElementById("freeReg");
	FreeBoard.innerHTML = "등록일( )";
}




var dateString = "${enterprise.fndnYr}";
var year = dateString.substr(0, 4);

var dateObject = new Date(year); // month는 0부터 시작하므로 1을 빼줍니다.

// 현재 날짜를 가져옵니다.
var currentDate = new Date();

// 연도 차이를 계산합니다.
var yearDifference = currentDate.getFullYear() - dateObject.getFullYear();

// 변환된 문자열을 생성합니다.
var formattedDate = year + "년(" + yearDifference + "년차)";

// console.log(formattedDate);
document.getElementById("fndnYr").innerText = formattedDate;


// 학교 목록을 쉼표(,)로 분리하여 배열로 변환
schoolList = '${schoolList}'.split(', ');
console.log(schoolList);

//중복을 고려한 학교의 빈도수 계산
var schoolCounts = {};
schoolList.forEach(function(school) {
    // 대괄호 제거
    school = school.trim().replace("[", "").replace("]", "");
    if (schoolCounts.hasOwnProperty(school)) {
        schoolCounts[school]++;
    } else {
        schoolCounts[school] = 1;
    }
});

// 총 학교 수 계산
var totalSchools = schoolList.length;

// 빈도수를 내림차순으로 정렬하되, 빈도수가 같으면 학교 이름을 가나다 순으로 오름차순 정렬
var sortedSchools = Object.keys(schoolCounts).sort(function(a, b) {
    // 빈도수가 같으면 학교 이름을 가나다 순으로 정렬
    if (schoolCounts[a] === schoolCounts[b]) {
        return a.localeCompare(b);
    }
    // 빈도수가 다르면 내림차순으로 정렬
    return schoolCounts[b] - schoolCounts[a];
});

// 결과를 표시할 테이블의 <tbody> 요소 선택
var schoolTableBody = document.getElementById("schoolTableBody");

// 상위 5개 학교만 표시
sortedSchools.slice(0, 5).forEach(function(school, index) {
    var rank = index + 1;
    var count = schoolCounts[school];
    var percentage = (count / totalSchools) * 100;

    // 새로운 <tr> 요소 생성
    var newRow = document.createElement("tr");

    // 새로운 <tr> 요소에 데이터 추가
    newRow.innerHTML = "<td width='15%'>" + rank + "위</td><td width='65%'>" + school + "</td><td width='20%'>" + percentage.toFixed(1) + "%</td>";

    // 테이블의 <tbody> 요소에 새로운 <tr> 요소 추가
    schoolTableBody.appendChild(newRow);
});




//학과 목록을 쉼표(,)로 분리하여 배열로 변환
departmentList = '${departmentList}'.split(', ');
console.log(departmentList);

//학과별 빈도수 계산
var departmentCounts = {};
departmentList.forEach(function(department) {
    // 대괄호 제거
    department = department.trim().replace("[", "").replace("]", "");
    if (departmentCounts.hasOwnProperty(department)) {
        departmentCounts[department]++;
    } else {
        departmentCounts[department] = 1;
    }
});

// 총 학과 수 계산
var totalDepartments = departmentList.length;

// 빈도수를 내림차순으로 정렬하되, 빈도수가 같으면 학과 이름을 가나다 순으로 오름차순 정렬
var sortedDepartments = Object.keys(departmentCounts).sort(function(a, b) {
    // 빈도수가 같으면 학과 이름을 가나다 순으로 정렬
    if (departmentCounts[a] === departmentCounts[b]) {
        return a.localeCompare(b);
    }
    // 빈도수가 다르면 내림차순으로 정렬
    return departmentCounts[b] - departmentCounts[a];
});

// 결과를 표시할 테이블의 <tbody> 요소 선택
var departmentTableBody = document.getElementById("departmentTableBody");

// 상위 5개 학과만 표시
sortedDepartments.slice(0, 5).forEach(function(department, index) {
    var rank = index + 1;
    var count = departmentCounts[department];
    var percentage = (count / totalDepartments) * 100;

    // 새로운 <tr> 요소 생성
    var newRow = document.createElement("tr");

    // 새로운 <tr> 요소에 데이터 추가
    newRow.innerHTML = "<td width='15%'>" + rank + "위</td><td width='65%'>" + department + "</td><td width='20%'>" + percentage.toFixed(1) + "%</td>";

    // 테이블의 <tbody> 요소에 새로운 <tr> 요소 추가
    departmentTableBody.appendChild(newRow);
});



</script>