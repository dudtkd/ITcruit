<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>	

<style>
.logo-container img {
    width: 100%;         /* 컨테이너 너비에 맞춤 */
    height: 150px;       /* 고정 높이 설정 */
    object-fit: contain; /* 비율을 유지하면서 요소에 맞춤 */
    display: block;      /* 블록 레벨 요소로 표시 */
    margin: 0 auto;      /* 중앙 정렬 */
    
}
.btn-primary-soft:active, .btn-primary-soft:hover {
    color: #fff !important;
    background-color: #8d7ffc !important;
    border-color: #8d7ffc !important;
}

</style>
<!-- **************** MAIN CONTENT START **************** -->
<main>

	<input type="hidden" name="sessionInfo" id="sessionInfo" value="${sessionScope.SessionInfo }">
	<!-- ======================= Page intro START -->
	<br> <br>
	<hr style="border:#8d7ffc solid 2px;"/>
	<section class=" py-3" >
		<div class="container">
			<div class="row justify-content-lg-between align-items-center">
				<!-- align-items-center 추가 -->

				<div class="col-lg-3">
				<div class="logo-container">
					<img
						src="/main/logodisplay?entNo=${entVO.entNo }"
						class="card-img-top" alt="course image"
						style="width: 100%; height: 150px;">
					</div>
				</div>

				<div class="col-lg-9">
					<!-- Title --> 
					<c:set value="${recruitPagingVO.dataList }" var="recruitMiniList"/>
					<c:choose>
						<c:when test="${empty recruitMiniList }">
							<div class="badge bg-dark mb-3 rounded-pill"></div>
						</c:when>
						<c:otherwise>
							<div class="badge bg-grad mb-3 rounded-pill">채용중</div>
						</c:otherwise>
					</c:choose>
					<div class="badge bg-dark mb-3 rounded-pill">
						<li class="far fa-star text-warning">&nbsp;코스닥</li>
					</div>
					<h1 class="text-black">${entVO.entNm }</h1>
					<p class="text-black">${entVO.ksicNm }</p>
					<li class="list-inline-item h6 fw-light me-3 mb-1 mb-sm-0"
						style="font-size: 20px;"><iS
							class="fas fa-star text-warning me-1"> </i></li>
					<c:choose>
						<c:when test="${!empty esVO }">
							<span style="color: black; font-size: 20px;">${esVO.avgTscr }
								/ 5.0</span>
						</c:when>
						<c:otherwise>
							<span style="color: black;">평점이 등록되지 않았습니다</span>
						</c:otherwise>
					</c:choose>
					<br>
					<!-- Content -->
				</div>
			</div>
		</div>
	</section>
<hr style="border:#8d7ffc solid 2px;"/>
	<!-- =======================    Page intro END -->

	<!-- =======================    Page content START -->
	<section class="pt-5">
		<div class="container">
			<div class="row">
				<!-- Main content START -->
				<div class="col-12">
					<div class="card shadow rounded-2 p-0 mt-n5">
						<!-- Tabs START -->
						<div class="card-header border-bottom px-4 pt-3 pb-0">
							<ul class="nav nav-bottom-line py-0" id="course-pills-tab"
								role="tablist">
								<!-- Tab item -->
								<li class="nav-item me-2 me-sm-4" role="presentation">
									<button class="nav-link mb-2 mb-md-0 active"
										id="course-pills-tab-1" data-bs-toggle="pill"
										data-bs-target="#course-pills-1" type="button" role="tab"
										aria-controls="course-pills-1" aria-selected="true">기업정보</button>
								</li>
								<!-- Tab item -->
								<li class="nav-item me-2 me-sm-4" role="presentation">
									<button class="nav-link mb-2 mb-md-0" id="course-pills-tab-2"
										data-bs-toggle="pill" data-bs-target="#course-pills-2"
										type="button" role="tab" aria-controls="course-pills-2"
										aria-selected="false">채용</button>
								</li>
								<!-- Tab item -->
								<li class="nav-item me-2 me-sm-4" role="presentation">
									<button class="nav-link mb-2 mb-md-0" id="course-pills-tab-3"
										data-bs-toggle="pill" data-bs-target="#course-pills-3"
										type="button" role="tab" aria-controls="course-pills-3"
										aria-selected="false">기업리뷰</button>
								</li>
								<!-- Tab item -->
								<li class="nav-item me-2 me-sm-4" role="presentation">
									<button class="nav-link mb-2 mb-md-0" id="course-pills-tab-4"
										data-bs-toggle="pill" data-bs-target="#course-pills-4"
										type="button" role="tab" aria-controls="course-pills-4"
										aria-selected="false">면접후기</button>
								</li>
							</ul>
						</div>
						<!-- Tabs END -->

						<!-- Tab contents START -->
						<div class="card-body p-sm-4">
							<div class="tab-content" id="course-pills-tabContent">
								<!-- Content START -->
								<div class="tab-pane fade show active" id="course-pills-1"
									role="tabpanel" aria-labelledby="course-pills-tab-1">
									<!-- Personal information START -->
									<div class="col-xxl-15">
										<h5 class="card-header-title mb-3">기업 정보</h5>
										<div class="card bg-transparent border rounded-3 h-70">

											<!-- Card header -->

											<!-- Card body START -->
											<div class="card-body">
												<!-- Information START -->
												<div class="row">

													<!-- Information item -->
													<div class="col-md-6">
														<table class="table table-borderless text-center" style="width: 200%;">
															<tr>
																<th style="color: black; font-weight: bold;">산업</th>
            													<td style="font-weight :bold; text-align: left;">${entVO.ksicNm}</td>
																	
																<th style="color: black; font-weight: bold;">사원수</th>
																<td style="font-weight :bold; text-align: left;">${entVO.empCnt }명</td>
															</tr>
															<tr>
																<th style="color: black; font-weight: bold;">기업구분</th>
																<td style="font-weight :bold; text-align: left;">${entVO.bizTypeNm }</td>

																<th style="color: black; font-weight: bold;">설립일</th>
																<td style="font-weight :bold; text-align: left;"> 
																<fmt:parseDate value="${entVO.fndnYr }" var="fndnYr" pattern="yyyyMMdd" />
																<fmt:formatDate value="${fndnYr }" pattern="yyyy-MM-dd"/> 
																</td>
															</tr>
															<tr>
																<th style="color: black; font-weight: bold;">자본금</th>
																<td style="font-weight :bold; text-align: left;"> <fmt:formatNumber value="${entVO.cptl }" pattern="#,###"/> 원</td>
																<th style="color: black; font-weight: bold;">전년 매출</th>
																<td style="font-weight :bold; text-align: left;"> <fmt:formatNumber value="${entVO.entSlsAmt }" pattern="#,###"/> 원</td>
															</tr>
															<tr>
																<th style="color: black; font-weight: bold;">대표자</th>
																<td style="font-weight :bold; text-align: left;">${entVO.rprsvNm }</td>

																
																<th style="color: black; font-weight: bold;">홈페이지</th>
																<td style="font-weight :bold; text-align: left;"><a href="http://${entVO.entUrl}" target="_blank" style="color: gray; text-decoration: none;" onmouseover="this.style.color='#3399FF';" onmouseout="this.style.color='gray';">${entVO.entUrl }</a></td>
															</tr>
															<tr>
																<th style="color: black; font-weight: bold;">주소</th>
																<td style="font-weight :bold; text-align: left;">${entVO.accountAddr1 } ${entVO.accountAddr2 }</td>
															</tr>
														</table>
													</div>
												</div>
												<!-- Information END -->
											</div>
											<!-- Card body END -->
										</div>
									</div>
									<br> <br>
									<!-- Chart START -->
									<div class="row g-4">
										<div class="col-xxl-8">
											<h5 class="text-dark mb-3">고용현황</h5>
											<div class="row row-cols-1 row-cols-md-2"
												style="width: 103%;">
												<!-- 그리드 시스템 수정 -->
												<!-- Active student START -->
												<div class="col mb-3">
                                                    <div class="card bg-transparent border overflow-hidden flex-grow-1" style="height: 366px;">
                                                        <h6 class="text-dark mb-2" style="margin-top: 15px; margin-left: 15px;">채용 History</h6>
                                                        <c:choose>
                                                        	<c:when test="${rsVO.totalRecruit ne 0}">
		                                                        <div class="card-body p-4">
		                                                            <div style="display: flex; justify-content: space-between; align-items: center; padding: 20px;">
		                                                                <div style="display: flex; flex-direction: column; justify-content: center; width: 300px;">
		                                                                    <h5 style="width: 120px;">${rsVO.totalRecruit }회 채용중</h5>
		                                                                    <div style="white-space: nowrap;">
		                                                                        <span style="font-weight: bold; color: #3399FF;">정규직 채용</span>
		                                                                        <span style="font-weight: bold;">은</span>
		                                                                        <span style="font-weight: bold; color: #3399FF;">${rsVO.regularCount }</span>
		                                                                        <span style="font-weight: bold;">회 입니다</span>
		                                                                    </div>
		                                                                </div>
		                                                                <!-- Adjusted canvas size and flex properties -->
		                                                                <input type="hidden" id="careerCount" name="careerCount" value="${rsVO.careerCount }">
		                                                                <input type="hidden" id="newCareerCount" name="newCareerCount" value="${rsVO.newCareerCount }">
		                                                                <input type="hidden" id="nothingCount" name="nothingCount" value="${rsVO.nothingCount }">
		                                                                <canvas id="recruitCount-chart" style="flex: 1 1 auto; max-width: 300px; height: 230px;"></canvas>
		                                                            </div>
		                                                        </div>
                                                        	</c:when>
                                                        	<c:when test="${rsVO.totalRecruit eq 0 }">
                                          						<div class="text-center mt-8">
																<span class="mb-5">등록된 정보가 없습니다</span>
																</div>
																<div class="mt-8"></div>
                                                        	</c:when>
                                                        </c:choose>
                                                    </div>
                                                </div>
												<!-- Active student END -->

												<!-- Active student START -->
												<div class="col mb-3">
													<!-- 변경된 부분 -->
													<div class="card bg-transparent border overflow-hidden flex-grow-1">
														<!-- Card body -->
													<h6 class="text-dark mb-2" style="margin-top: 15px; margin-left: 15px;">사원수</h6>
                                                        <c:choose>
                                                        	<c:when test="${!empty entVO}">
		                                                        <div class="card-body p-4">
																	<div style="display: flex; flex-direction: row; justify-content: space-between; align-items: center; padding: 20px;">
																	    <input type="hidden" id="empCount" name="empCount" value="${entVO.empCnt }">
																	    <canvas id="empCount-chart" style="flex: 1 1 auto; max-width: 500px; height: 200px;"></canvas>
																	    <!-- alignSelf과 marginLeft 추가하여 오른쪽 아래로 위치 조정 -->
																	</div>
																	    <p style="align-self: flex-end; margin-left: auto; text-align: right; color: #9999a6; font-size: 10px" >최근 1년 기준 </p>
		                                                        </div>
                                                        	</c:when>
                                                        	<c:when test="${empty pCont}">
                                          						<div class="text-center mt-8">
																<span class="mb-5">등록된 정보가 없습니다</span>
																</div>
																<div class="mt-8"></div>
                                                        	</c:when>
                                                        </c:choose>
													</div>
												</div>
												<!-- Active student END -->
											</div>
										</div>
									</div>
									<!-- Chart END -->
									<br>
									<h5 class="text-dark mb-1">채용공고</h5>
									<div class="row">
										<div class="col-md-12">
											<table class="table">
												<thead>
													<tr>
														<th class="text-center" scope="col" style="color: black;">
															접수기간</th>
														<th class="text-center" scope="col" style="color: black;">
															채용제목</th>
														<th class="text-center" scope="col" style="color: black;">구분
														</th>
													</tr>
												</thead>
												<tbody>
												<c:set value="${recruitPagingVO.dataList }" var="recruitMiniList"/>
													<c:choose>
														<c:when test="${empty recruitMiniList }">
															<tr>
																<td colspan='4'>진행중인 채용공고가 없습니다.</td>
															</tr>
														</c:when>
														<c:otherwise>
															<c:forEach items="${recruitMiniList }" var="recruitMiniList">
															<tr>
																<td class="text-center">${ recruitMiniList.recruitStrtDt} ~ ${ recruitMiniList.recruitEndDt}</td>
																<td class="text-center"><span class="badge bg-orange bg-opacity-10 text-orange" style="margin-right: 10px">채용중</span> <a href="/main/recruitDetail.do?recruitNo=${recruitMiniList.recruitNo}&pstnCmmncdNm=${recruitMiniList.pstnCmmncdNm}" style="color: gray; text-decoration: none;" onmouseover="this.style.color='#3399FF';" onmouseout="this.style.color='gray';"> ${recruitMiniList.recruitTtl } </a></td>
																<td class="text-center">${ recruitMiniList.cmmncdGrpCd} | ${ recruitMiniList.recruitCareerCodeNm} | ${ recruitMiniList.pstnCmmncdNm}</td>
															</tr>
															</c:forEach>
														</c:otherwise>
													</c:choose>
												</tbody>
											</table>
										</div>
										<form method="post" id="recruitMiniListForm">
											<input type="hidden" id="recruitMiniListPage" name="recruitMiniListPage">
											<sec:csrfInput/>
										</form>
										<div id="recruitMiniListPagingArea" class="d-sm-flex justify-content-sm-between align-items-sm-center mt-1 mt-sm-0">
										<p class="mb-0 text-center text-sm-start"></p>
										${recruitPagingVO.pagingHTML }
										</div>
									</div>
					
									<div class="mt-4"></div>

									<!-- Main content START -->
									<!-- Card START -->
									<h5 class="text-dark mb-1">기업 게시판</h5>
									<div class="card border bg-transparent rounded-3">
										<!-- Card body START -->
										<div class="card-body">

											<!-- Search and select START -->
											<div
												class="row g-3 align-items-center mb-4 d-flex justify-content-between">
												<form class="rounded position-relative d-flex" method="post"
													id="BBS201searchForm">
													<input type="hidden" name="BBS201page" id="BBS201page" />
													<!-- Select option -->
													<div class="col-md-3" style="margin-right: 50px;">
														<!-- Short by filter -->
														<select
															class="form-select js-choice border-0 z-index-9 bg-transparent"
															aria-label=".form-select-sm" name="BBS201searchType">
															<option value="BBS201title"
																<c:if test="${BBS201searchType eq 'BBS201title' }"> selected</c:if>>제목</option>
															<option value="BBS201writer"
																<c:if test="${BBS201searchType eq 'BBS201writer' }"> selected</c:if>>작성자</option>
														</select>
													</div>
													<!-- Search -->
													<div class="col-md-8 d-flex">
														<div class="position-relative d-flex flex-grow-1">
															<input
																class="form-control pe-5 bg-transparent flex-grow-1"
																type="search" placeholder="Search" aria-label="Search"
																name="BBS201searchWord" value="${BBS201searchWord}">
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
																&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;제
																목</th>
															<th scope="col" class="border-0">작성자</th>
															<th scope="col" class="border-0">작성날짜</th>
															<th scope="col" class="border-0">조회수</th>
														</tr>
													</thead>

													<!-- Table body START -->
													<tbody>
														<c:set value="${pagingVO.dataList }" var="boardList" />
														<c:choose>
															<c:when test="${empty boardList }">
																<tr>
																	<td colspan='4'>게시글이 없습니다.</td>
																</tr>
															</c:when>
															<c:otherwise>
																<c:forEach items="${boardList }" var="BBS201">

																	<tr>
																		<!-- Table data -->
																		<td>
																			<h6 class="table-responsive-title mt-2 mt-lg-0 mb-0">
																				<a href="/board/ent/detail.do?entNo=${BBS201.entNo }&bbsNo=${BBS201.bbsNo}">${BBS201.bbsTtl }</a>
																			</h6>
																		</td>

																		<!-- Table data -->
																		<td
																			class="text-center text-sm-start text-primary-hover">
																			<a href="#" class="text-body"><u>${BBS201.bbsWriter }</u></a>
																		</td>

																		<!-- Table data -->
																		<td><fmt:formatDate pattern="yyyy-MM-dd" value="${BBS201.bbsRegDt }"/> </td>

																		<!-- Table data -->
																		<td class="bi bi-eye-fill">&nbsp;${BBS201.bbsInqCnt }</td>
																	</tr>
																</c:forEach>
															</c:otherwise>
														</c:choose>
														<!-- Table item -->

													</tbody>
													<!-- Table body END -->
												</table>
												<!-- Table END -->
											</div>
											<!-- Order list table END -->

											<!-- Pagination START -->
											<div class="col-12" id="BBS201pagingArea">
												${pagingVO.pagingHTML }
												<div class="d-sm-flex justify-content-end">
													<button type="button" class="btn btn-primary-soft mb-0" style="background-color: #dcd8fc; color: black;" onclick="location.href='/board/ent/insert?entNo=${entVO.entNo}'">게시글
														작성</button>
												</div>
											</div>
											<!-- Pagination END -->
										</div>
										<!-- Card body START -->
									</div>
									<!--Card END  -->

								</div>


								<!-- Content START -->
								<div class="tab-pane fade" id="course-pills-2" role="tabpanel"
									aria-labelledby="course-pills-tab-2">
									<div class="container">

<!-- 										Filter bar START -->
<!-- 										<form class="p-0 rounded-3 my-4 z-index-9 position-relative"> -->
<!-- 											<div class="row g-3"> -->

<!-- 												Select item -->
<!-- 												<div class="col-xl-8"> -->
<!-- 													<div class="row g-3"> -->
<!-- 														Select items -->
<!-- 														<div class="col-sm-6 col-md-3 pb-2 pb-md-0"> -->
<!-- 															<select class="form-select form-select-sm js-choice" -->
<!-- 																aria-label=".form-select-sm example"> -->
<!-- 																<option value="">직종</option> -->
<!-- 																<option>All</option> -->
<!-- 																<option>Development</option> -->
<!-- 																<option>Design</option> -->
<!-- 																<option>Accounting</option> -->
<!-- 																<option>Translation</option> -->
<!-- 																<option>Finance</option> -->
<!-- 																<option>Legal</option> -->
<!-- 																<option>Photography</option> -->
<!-- 																<option>Writing</option> -->
<!-- 																<option>Marketing</option> -->
<!-- 															</select> -->
<!-- 														</div> -->

<!-- 														Search item -->
<!-- 														<div class="col-sm-6 col-md-3 pb-2 pb-md-0"> -->
<!-- 															<select class="form-select form-select-sm js-choice" -->
<!-- 																aria-label=".form-select-sm example"> -->
<!-- 																<option value="">직종 상세</option> -->
<!-- 																<option>All</option> -->
<!-- 																<option>Free</option> -->
<!-- 																<option>Paid</option> -->
<!-- 															</select> -->
<!-- 														</div> -->

<!-- 														Search item -->
<!-- 														<div class="col-sm-6 col-md-3 pb-2 pb-md-0"> -->
<!-- 															<select class="form-select form-select-sm js-choice" -->
<!-- 																aria-label=".form-select-sm example"> -->
<!-- 																<option value="">경력 구분</option> -->
<!-- 																<option>All levels</option> -->
<!-- 																<option>Beginner</option> -->
<!-- 																<option>Intermediate</option> -->
<!-- 																<option>Advanced</option> -->
<!-- 															</select> -->
<!-- 														</div> -->

<!-- 														Search item -->
<!-- 														<div class="col-sm-6 col-md-3 pb-2 pb-md-0"> -->
<!-- 															<select class="form-select form-select-sm js-choice" -->
<!-- 																aria-label=".form-select-sm example"> -->
<!-- 																<option value="">지역</option> -->
<!-- 																<option>English</option> -->
<!-- 																<option>Francas</option> -->
<!-- 																<option>Russian</option> -->
<!-- 																<option>Hindi</option> -->
<!-- 																<option>Bengali</option> -->
<!-- 																<option>Spanish</option> -->
<!-- 															</select> -->
<!-- 														</div> -->
<!-- 													</div> -->
<!-- 													Row END -->
<!-- 												</div> -->
<!-- 												Button -->
<!-- 												<div class="col-xl-1"> -->
<!-- 													<button type="button" -->
<!-- 														class="btn btn-primary mb-0 rounded z-index-1 w-100"> -->
<!-- 														<i class="fas fa-search"></i> -->
<!-- 													</button> -->
<!-- 												</div> -->
<!-- 											</div> -->
<!-- 											Row END -->
<!-- 										</form> -->
<!-- 										Filter bar END -->

										<div class="row mt-5">
											<div>
												<span style="font-weight: bold;">채용 공고 총 </span>  
												<span id="recruitCount" style="color: green; font-weight: bold;"> ${recruitTotalCount} </span><span style="font-weight: bold;"> 건</span>
												<input type="checkbox" id="endRecruit" name="endRecruit" onchange="filterRecruits()" style="margin-left: 30px; font-weight: bold;"> 마감된 공고 보기
												
											</div>

											<!-- Main content START -->
											<div class="col-12 mt-4">

												<!-- Course Grid START -->
												<div class="row g-4">
													<c:set value="${recruitListPagingVO.dataList }" var="recruitList"></c:set>
													<c:choose>
														<c:when test="${empty recruitList }">
															<span>등록된 채용공고가 없습니다</span>
														</c:when>
														<c:otherwise>
															<c:forEach items="${recruitList}" var="recruit">
															    <!-- Card item START -->
															    <div class="col-sm-6 col-lg-4 col-xl-3 recruitCard">
															        <div class="card shadow-hover overflow-hidden"
															            style="height: 260px; border: 1px solid #d6d6d6; background-color: ${recruit.endDt eq '공고마감' ? '#d6d6d6' : (recruit.strtDt eq '공고예정' ? '#fafafa' : 'white')};">
															            <!-- Card body -->
															           <div class="card-body pb-0 recruitCardBody" id="recruitCardBody" style="cursor: pointer;" data-strtdt="${recruit.strtDt }" data-recruitno="${recruit.recruitNo }" data-pstncmmncdnm="${recruit.pstnCmmncdNm}">
															                <!-- Badge and favorite -->
															                <div class="d-flex justify-content-between mb-2">
																		    <c:choose>
																		        <c:when test="${recruit.strtDt eq '공고예정'}">
																		            <p style="font-weight: bold;">공고예정(${fn:substringBefore(recruit.recruitEndDt,'T')}~)</p>
																		        </c:when>
																		        <c:when test="${recruit.endDt eq '공고마감'}">
																		            <p style="font-weight: bold;">마감(~${fn:substringBefore(recruit.recruitEndDt,'T')})</p>
																		        </c:when>
																		        <c:when test="${recruit.recruitYn eq 'Y'}">
																		            <p class="badge bg-purple bg-opacity-10 text-purple">상시채용</p>
																		            <li class="list-inline-item h6 fw-light mb-1 mb-sm-0"><i class="far fa-clock text-danger me-2"></i> <span style="margin-right: 10px">${recruit.endDt}</span></li>
																		        </c:when>
																		        <c:when test="${recruit.recruitYn eq 'N'}">
																		            <p class="badge bg-purple bg-opacity-10 text-purple">정기채용</p>
																		            <li class="list-inline-item h6 fw-light mb-1 mb-sm-0"><i class="far fa-clock text-danger me-2"></i> <span style="margin-right: 10px">${recruit.endDt}</span></li>
																		        </c:when>
																		    </c:choose>                                                                        
																		    <c:choose>
																		        <c:when test="${recruit.endDt ne '공고마감'}">
																		            <c:if test="${!empty recruit.accountId}">
																		                <span class="h6 fw-light mb-0"><a href="#" class="likeRecruit" data-recruitno="${recruit.recruitNo}" data-pstnnm="${recruit.pstnCmmncdNm}" data-session="${SessionInfo}"><i class="text-danger fas fa-heart like"></i></a></span>
																		            </c:if>
																		            <c:if test="${empty recruit.accountId}">
																		                <span class="h6 fw-light mb-0"><a href="#" class="disLikeRecruit" data-recruitno="${recruit.recruitNo}" data-pstnnm="${recruit.pstnCmmncdNm}" data-session="${SessionInfo}"><i class="far fa-heart dislike"></i></a></span>
																		            </c:if>
																		        </c:when>
																		        <c:otherwise>
<!-- 																		            공고 마감되어 관심공고 등록 비활성화 -->
																		            <span class="h6 fw-light mb-0 text-muted"></span>
																		        </c:otherwise>
																		    </c:choose>
																		</div>
															                <!-- Title -->
																                <h6 class="card-title" style="height: 20px">${recruit.recruitTtl}</h6>
															                <div class="d-flex justify-content-between mt-4">
																                <span class="badge bg-orange bg-opacity-10 text-orange mt-3">${recruit.recruitCareerCodeNm}</span>
																                <div>
																                	<span class="badge bg-purple bg-opacity-10 text-purple mt-3">${recruit.cmmncdGrpCd}</span>
																                </div>
															                </div>
															                <div class="d-flex justify-content-be-between">
															                	<div>
																	                <c:forEach items="${recruit.hireType}" var="hire">
																	                <span class="badge bg-primary bg-opacity-10 text-primary mt-3">${fn:substringAfter(hire,"=")}</span>
																	                </c:forEach>
																                </div>
															                </div>
															                <div class="d-flex justify-content-be-between">
																                <div>
																	                <c:forEach items="${recruit.esntlType}" var="esntl">
																	                <span class="badge bg-success bg-opacity-10 text-success mt-3">${fn:substringBefore(esntl,"=")}</span>
																	                </c:forEach>
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

											</div>
											<!-- Main content END -->
										</div>
										<!-- Row END -->
									</div>
								</div>
								<!-- Content END -->

								<!-- Content START -->
								<div class="tab-pane fade" id="course-pills-3" role="tabpanel"
									aria-labelledby="course-pills-tab-3">
									<div class="card">
										<!-- Card header -->
										<div class="card-header border-bottom p-0 pb-3">
											<!-- Title -->
											<h4 class="mb-3">전체리뷰</h4>
										</div>
										<br>

										<!-- 4개의 섹션 -->
										<div class="row">
											<!-- 섹션 1 -->
											<div class="col-md-6 border-end">
												<div class="text-center">
													<c:choose>
														<c:when test="${!empty esVO }">
															<span class="mb-0" style="color: green;">전체 리뷰 통계</span>
															<span>(${esVO.reviewCount }명)</span>
														</c:when>
														<c:otherwise>
															<span class="mb-0" style="color: black;">아직 작성된
																리뷰가 없습니다</span>
														</c:otherwise>
													</c:choose>

													<div class="text-center">
														<!-- Info -->
														<c:choose>
															<c:when test="${!empty esVO }">
																<h2 class="mb-0">${esVO.avgTscr }</h2>
															</c:when>
															<c:otherwise>
																<h2 class="mb-0">0</h2>
															</c:otherwise>
														</c:choose>
														<input type="hidden" id="avgtscr" value="${esVO.avgTscr }">
														<!-- Star -->
														<ul class="list-inline mb-0"
															data-starcategory="totalScore">
															<li class="list-inline-item me-0"><i
																class="far fa-star text-warning"></i></li>
															<li class="list-inline-item me-0"><i
																class="far fa-star text-warning"></i></li>
															<li class="list-inline-item me-0"><i
																class="far fa-star text-warning"></i></li>
															<li class="list-inline-item me-0"><i
																class="far fa-star text-warning"></i></li>
															<li class="list-inline-item me-0"><i
																class="far fa-star text-warning"></i></li>
														</ul>
													</div>
													<div class="mt-4"></div>
													<!-- Progress-bar and star -->
												<div class="col-md-8">
													<div class="row align-items-center">
														<!-- 복지 및 급여 -->
														<div class="col">
															<div style="text-align: left;">
																<span style="font-weight: bold; color: bold;">복지 및 급여</span> <input type="hidden"
																	name="avgwelfare" id="avgwelfare"
																	value="${esVO.avgWelfare }">
															</div>
															<div class="row align-items-center">
																<!-- Progress bar and Rating -->
																<div class="col-8 col-sm-8">
																	<!-- Progress item -->
																	<div
																		class="progress progress-sm bg-warning bg-opacity-15" style="width: 150%">
																		<div class="progress-bar bg-warning" role="progressbar"
																			style="width: 0%" aria-valuenow="100" aria-valuemin="0"
																			aria-valuemax="100" data-progresscategory="welfare"></div>
																	</div>
																</div>
		
																<div class="col-4 col-sm-4">
																	<!-- Star item -->
																	<ul class="list-inline mb-0" data-starcategory="welfare" style="min-width: 160px; margin-left: 100px;">
																		<li class="list-inline-item me-0"><i
																			class="far fa-star text-warning"></i></li>
																		<li class="list-inline-item me-0"><i
																			class="far fa-star text-warning"></i></li>
																		<li class="list-inline-item me-0"><i
																			class="far fa-star text-warning"></i></li>
																		<li class="list-inline-item me-0"><i
																			class="far fa-star text-warning"></i></li>
																		<li class="list-inline-item me-0"><i
																			class="far fa-star text-warning"></i></li>
																	</ul>
																</div>
															</div>
														</div>
													</div>
												</div>
													<!-- Progress-bar and star -->
													<div class="col-md-8">
														<div class="row align-items-center">
															<!-- 업무와 삶의 균형 -->
															<div class="col">
																<div style="text-align: left;">
																	<span style="font-weight: bold; color: bold;">업무와 삶의 균형</span> <input type="hidden" name="avgwnl" id="avgwnl"
																		value="${esVO.avgWnl }">
																</div>
																<div class="row align-items-center">
																	<!-- Progress bar -->
																	<div class="col-8 col-sm-8">
																		<!-- Progress item -->
																		<div
																			class="progress progress-sm bg-warning bg-opacity-15" style="width: 150%">
																			<div class="progress-bar bg-warning"
																				role="progressbar" style="width: 0%"
																				aria-valuenow="80" aria-valuemin="0"
																				aria-valuemax="100" data-progresscategory="wnl"></div>
																		</div>
																	</div>

																	<div class="col-4 col-sm-4">
																		<!-- Star item -->
																		<ul class="list-inline mb-0" data-starcategory="wnl" style="min-width: 160px; margin-left: 100px;">
																			<li class="list-inline-item me-0"><i
																				class="far fa-star text-warning"></i></li>
																			<li class="list-inline-item me-0"><i
																				class="far fa-star text-warning"></i></li>
																			<li class="list-inline-item me-0"><i
																				class="far fa-star text-warning"></i></li>
																			<li class="list-inline-item me-0"><i
																				class="far fa-star text-warning"></i></li>
																			<li class="list-inline-item me-0"><i
																				class="far fa-star text-warning"></i></li>
																		</ul>
																	</div>
																</div>
															</div>
														</div>
													</div>

													<!-- Progress-bar and star -->
													<div class="col-md-8">
														<div class="row align-items-center">
															<!-- 사내문화 -->
															<div class="col">
																<div style="text-align: left;">
																	<span style="font-weight: bold; color: bold;">사내문화</span>
																	<input type="hidden" id="avgculture"
																		value="${esVO.avgCulture }">
																</div>
																<div class="row align-items-center">
																	<!-- Progress bar and Rating -->
																	<div class="col-8 col-sm-8">
																		<!-- Progress item -->
																		<div
																			class="progress progress-sm bg-warning bg-opacity-15" style="width: 150%">
																			<div class="progress-bar bg-warning"
																				role="progressbar" style="width: 0%"
																				aria-valuenow="60" aria-valuemin="0"
																				aria-valuemax="100" data-progresscategory="culture"></div>
																		</div>
																	</div>

																	<div class="col-4 col-sm-4">
																		<!-- Star item -->
																		<ul class="list-inline mb-0"
																			data-starcategory="culture" style="min-width: 160px; margin-left: 100px;">
																			<li class="list-inline-item me-0"><i
																				class="far fa-star text-warning"></i></li>
																			<li class="list-inline-item me-0"><i
																				class="far fa-star text-warning"></i></li>
																			<li class="list-inline-item me-0"><i
																				class="far fa-star text-warning"></i></li>
																			<li class="list-inline-item me-0"><i
																				class="far fa-star text-warning"></i></li>
																			<li class="list-inline-item me-0"><i
																				class="far fa-star text-warning"></i></li>
																		</ul>
																	</div>
																</div>
															</div>
														</div>
													</div>

													<!-- Progress-bar and star -->
													<div class="col-md-8">
														<div class="row align-items-center">
															<!-- 승진 기회 및 가능성 -->
															<div class="col">
																<div style="text-align: left;">
																	<span style="font-weight: bold; color: bold;">승진
																		기회 및 가능성</span> <input type="hidden" id="avgpromotion"
																		value="${esVO.avgPromotion }">
																</div>
																<div class="row align-items-center">
																	<!-- Progress bar and Rating -->
																	<div class="col-8 col-sm-8">
																		<!-- Progress item -->
																		<div
																			class="progress progress-sm bg-warning bg-opacity-15" style="width: 150%">
																			<div class="progress-bar bg-warning"
																				role="progressbar" style="width: 0%"
																				aria-valuenow="40" aria-valuemin="0"
																				aria-valuemax="100"
																				data-progresscategory="promotion"></div>
																		</div>
																	</div>

																	<div class="col-4 col-sm-4">
																		<!-- Star item -->
																		<ul class="list-inline mb-0"
																			data-starcategory="promotion" style="min-width: 160px; margin-left: 100px;">
																			<li class="list-inline-item me-0"><i
																				class="far fa-star text-warning"></i></li>
																			<li class="list-inline-item me-0"><i
																				class="far fa-star text-warning"></i></li>
																			<li class="list-inline-item me-0"><i
																				class="far fa-star text-warning"></i></li>
																			<li class="list-inline-item me-0"><i
																				class="far fa-star text-warning"></i></li>
																			<li class="list-inline-item me-0"><i
																				class="far fa-star text-warning"></i></li>
																		</ul>
																	</div>
																</div>
															</div>
														</div>
													</div>

													<!-- Progress-bar and star -->
													<div class="col-md-8">
														<div class="row align-items-center">
															<!-- 경영진 -->
															<div class="col">
																<div style="text-align: left;">
																	<span style="font-weight: bold; color: bold;">경영진</span>
																	<input type="hidden" id="avgmanagement"
																		value="${esVO.avgManagement }">
																</div>
																<div class="row align-items-center">
																	<!-- Progress bar and Rating -->
																	<div class="col-8 col-sm-8">
																		<!-- Progress item -->
																		<div
																			class="progress progress-sm bg-warning bg-opacity-15" style="width: 150%">
																			<div class="progress-bar bg-warning"
																				role="progressbar" style="width: 0%"
																				aria-valuenow="20" aria-valuemin="0"
																				aria-valuemax="100"
																				data-progresscategory="management"></div>
																		</div>
																	</div>

																	<div class="col-4 col-sm-4">
																		<!-- Star item -->
																		<ul class="list-inline mb-0"
																			data-starcategory="management" style="min-width: 160px; margin-left: 100px;">
																			<li class="list-inline-item me-0"><i
																				class="far fa-star text-warning"></i></li>
																			<li class="list-inline-item me-0"><i
																				class="far fa-star text-warning"></i></li>
																			<li class="list-inline-item me-0"><i
																				class="far fa-star text-warning"></i></li>
																			<li class="list-inline-item me-0"><i
																				class="far fa-star text-warning"></i></li>
																			<li class="list-inline-item me-0"><i
																				class="far fa-star text-warning"></i></li>
																		</ul>
																	</div>
																</div>
															</div>
														</div>
													</div>


												</div>
											</div>

											<!-- 섹션 4 -->
											<div class="col-md-6 border-1">
												<div class="text-center interview"
													style="display: flex; justify-content: center; width: 80%; height: auto;">
													<c:choose>
														<c:when test="${!empty esVO }">
															<input type="hidden" id="entScrRcmdY" value="${esVO.entScrRcmdY}">
											            	<input type="hidden" id="entScrRcmdN" value="${esVO.entScrRcmdN}">
											            	<input type="hidden" id="entScrCeoGood" value="${esVO.entScrCeoGood}">
											            	<input type="hidden" id="entScrCeoBad" value="${esVO.entScrCeoBad}">
											            	<input type="hidden" id="entScrFutureY" value="${esVO.entScrFutureY}">
											            	<input type="hidden" id="entScrFutureN" value="${esVO.entScrFutureN}">
											                <table style="margin: 100px auto; margin-left: 150px; border-collapse: separate; border-spacing: 40px 10px;">
											                    <tr>
											                        <td style="padding: 8px 20px; border-bottom: 1px solid #ccc;">기업추천율<span style="margin-left: 15px;" id="rcmdPercentage">기업추천율</span></td>
											                    </tr>
											                    <tr>
											                        <td style="padding: 8px 20px; border-bottom: 1px solid #ccc;">CEO 지지율<span style="margin-left: 15px;" id="ceoPercentage">CEO지지율</span></td>
											                    </tr>
											                    <tr>
											                        <td style="padding: 8px 20px; border-bottom: 1px solid #ccc;">성장가능성<span style="margin-left: 15px;" id="futurePercentage">성장가능성</span></td>
											                    </tr>
											                </table>
														</c:when>

														<c:when test="${empty esVO }">
															<div class="text-center mt-9">
																<span class="mt-5">&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;리뷰가
																	작성되지 않았습니다</span>
															</div>
														</c:when>
													</c:choose>
												</div>
											</div>
										</div>


										<br>
										<hr>
										<br>
										<!-- Card header -->
										<div class="card-header border-bottom p-0 pb-3">
											<!-- Title -->
											<h4 class="mb-3">모아보기</h4>
											<form class="row g-4" id="reviewSearchForm" method="post">
												<input type="hidden" name="entReviewPage" id="entReviewPage">
												<!-- Search Item -->
												<div class="col-sm-4 col-lg-3">
													<div class="position-relative">
														<select class="js-choice" id="reviewJob" name="reviewJob">
															<option value="">직무</option>
															<option value="서버"
																<c:if test="${reviewJob eq '서버' }">selected</c:if>>서버</option>
															<option value="프론트엔드"
																<c:if test="${reviewJob eq '프론트엔드' }">selected</c:if>>프론트엔드</option>
															<option value="백엔드"
																<c:if test="${reviewJob eq '백엔드' }">selected</c:if>>백엔드</option>
															<option value="응용소프트웨어 "
																<c:if test="${reviewJob eq '응용소프트웨어' }">selected</c:if>>응용소프트웨어</option>
															<option value="시스템소프트웨어"
																<c:if test="${reviewJob eq '시스템소프트웨어' }">selected</c:if>>시스템소프트웨어</option>
															<option value="앱개발자"
																<c:if test="${reviewJob eq '앱개발자' }">selected</c:if>>앱개발자</option>
															<option value="크로스플랫폼 앱개발자"
																<c:if test="${reviewJob eq '크로스플랫폼' }">selected</c:if>>크로스플랫폼
																앱개발자</option>
															<option value="게임 개발자"
																<c:if test="${reviewJob eq '게임 개발자' }">selected</c:if>>게임
																개발자</option>
															<option value="DBA"
																<c:if test="${reviewJob eq 'DBA' }">selected</c:if>>DBA</option>
															<option value="빅데이터 엔지니어"
																<c:if test="${reviewJob eq '빅데이터 엔지니어' }">selected</c:if>>빅데이터
																엔지니어</option>
															<option value="인공지능/머신러닝"
																<c:if test="${reviewJob eq '인공지능/머신러닝' }">selected</c:if>>인공지능/머신러닝</option>
															<option value="devops/시스템	엔지니어"
																<c:if test="${reviewJob eq 'devops/시스템 엔지니어' }">selected</c:if>>devops/시스템
																엔지니어</option>
															<option value="HW/임베디드"
																<c:if test="${reviewJob eq 'HW/임베디드' }">selected</c:if>>HW/임베디드</option>
															<option value="블록체인"
																<c:if test="${reviewJob eq '블록체인' }">selected</c:if>>블록체인</option>
															<option value="PM"
																<c:if test="${reviewJob eq 'PM' }">selected</c:if>>PM</option>
														</select>
													</div>
												</div>

												<!-- Filter and Button in the same div, with spacing between them -->
												<div class="col-sm-4 col-lg-3 d-flex align-items-center">
													<div class="position-relative flex-grow-1 pe-3">
														<!-- 추가된 pe-3 클래스로 오른쪽 패딩 적용 -->
														<select class="js-choice" id="reviewWorkStts"
															name="reviewWorkStts">
															<option value="">전/현직자</option>
															<option value="전직자"
																<c:if test="${reviewWorkStts eq '전직자' }">selected</c:if>>전직자</option>
															<option value="현직자"
																<c:if test="${reviewWorkStts eq '현직자' }">selected</c:if>>현직자</option>
														</select>
													</div>
													<button
														class="bg-transparent border-0 text-primary-hover text-reset p-2"
														type="submit" >
														<i class="fas fa-search fs-6"></i>
													</button>
												</div>
												<sec:csrfInput />
											</form>

										</div>
										<br>
										<!-- FAQs START -->
										<div>
											<c:choose>
												<c:when test="${!empty esVO }">
													<span>총</span>
													<span style="color: green;">${esVO.reviewCount }</span>
													<span>개의 리뷰</span>
												</c:when>
												<c:otherwise>
													<p></p>
												</c:otherwise>
											</c:choose>
										</div>
										<c:set value="${reviewPagingVO.dataList }" var="reviewList" />
										<c:choose>
											<c:when test="${empty reviewList }">
												작성된 리뷰가 없습니다. 첫번째 리뷰를 남겨주세요
											</c:when>
											<c:otherwise>
												<c:forEach items="${reviewList }" var="review">
													<div class="col-12">
														<br>
														<div class="card border rounded-3">
															<!-- Card body START -->
															<div class="card-body">
																<!-- FAQ item -->
																<div>
																	<span style="margin-right: 10px">
																		${review.pstnCmmncd } </span> | <span
																		style="margin-left: 10px; margin-right: 10px">
																		${review.workStts } </span> | <span style="margin-left: 10px">
																		${review.entScrDate }</span>
																</div>
																<br>

																<div style="display: flex;">
																	<div style="flex: 0 0 130px;">
																		<div class="text-center">
																			<!-- Info -->
																			<div class="mt-5">
																				<span style="font-weight: bold;">승진 기회 및 가능성</span>
																				<input type="hidden" name="rvwLevel" value="${review.entScrPromotion }">
																				<c:choose>
																					<c:when test="${review.entScrPromotion == 1 }">
																						<!-- Star -->
																						<ul class="list-inline mb-0"
																							data-starcategory="rvwLevel">
																							<li class="list-inline-item me-0"><i
																								class="fas fa-star text-warning"></i></li>
																							<li class="list-inline-item me-0"><i
																								class="far fa-star text-warning"></i></li>
																							<li class="list-inline-item me-0"><i
																								class="far fa-star text-warning"></i></li>
																							<li class="list-inline-item me-0"><i
																								class="far fa-star text-warning"></i></li>
																							<li class="list-inline-item me-0"><i
																								class="far fa-star text-warning"></i></li>
																						</ul>
																					</c:when>
																					<c:when test="${review.entScrPromotion == 2 }">
																						<!-- Star -->
																						<ul class="list-inline mb-0"
																							data-starcategory="rvwLevel">
																							<li class="list-inline-item me-0"><i
																								class="fas fa-star text-warning"></i></li>
																							<li class="list-inline-item me-0"><i
																								class="fas fa-star text-warning"></i></li>
																							<li class="list-inline-item me-0"><i
																								class="far fa-star text-warning"></i></li>
																							<li class="list-inline-item me-0"><i
																								class="far fa-star text-warning"></i></li>
																							<li class="list-inline-item me-0"><i
																								class="far fa-star text-warning"></i></li>
																						</ul>
																					</c:when>
																					<c:when test="${review.entScrPromotion == 3 }">
																						<!-- Star -->
																						<ul class="list-inline mb-0"
																							data-starcategory="rvwLevel">
																							<li class="list-inline-item me-0"><i
																								class="fas fa-star text-warning"></i></li>
																							<li class="list-inline-item me-0"><i
																								class="fas fa-star text-warning"></i></li>
																							<li class="list-inline-item me-0"><i
																								class="fas fa-star text-warning"></i></li>
																							<li class="list-inline-item me-0"><i
																								class="far fa-star text-warning"></i></li>
																							<li class="list-inline-item me-0"><i
																								class="far fa-star text-warning"></i></li>
																						</ul>
																					</c:when>
																					<c:when test="${review.entScrPromotion == 4 }">
																						<!-- Star -->
																						<ul class="list-inline mb-0"
																							data-starcategory="rvwLevel">
																							<li class="list-inline-item me-0"><i
																								class="fas fa-star text-warning"></i></li>
																							<li class="list-inline-item me-0"><i
																								class="fas fa-star text-warning"></i></li>
																							<li class="list-inline-item me-0"><i
																								class="fas fa-star text-warning"></i></li>
																							<li class="list-inline-item me-0"><i
																								class="fas fa-star text-warning"></i></li>
																							<li class="list-inline-item me-0"><i
																								class="far fa-star text-warning"></i></li>
																						</ul>
																					</c:when>
																					<c:when test="${review.entScrPromotion == 5 }">
																						<!-- Star -->
																						<ul class="list-inline mb-0"
																							data-starcategory="rvwLevel">
																							<li class="list-inline-item me-0"><i
																								class="fas fa-star text-warning"></i></li>
																							<li class="list-inline-item me-0"><i
																								class="fas fa-star text-warning"></i></li>
																							<li class="list-inline-item me-0"><i
																								class="fas fa-star text-warning"></i></li>
																							<li class="list-inline-item me-0"><i
																								class="fas fa-star text-warning"></i></li>
																							<li class="list-inline-item me-0"><i
																								class="fas fa-star text-warning"></i></li>
																						</ul>
																					</c:when>
																				</c:choose>
																				<div class="mt-3"></div>
																				<span style="font-weight: bold;">복지 및 급여</span>
																				<input type="hidden" name="rvwLevel"
																					value="${review.entScrWelfare }">
																				<c:choose>
																					<c:when test="${review.entScrWelfare == 1 }">
																						<!-- Star -->
																						<ul class="list-inline mb-0"
																							data-starcategory="rvwLevel">
																							<li class="list-inline-item me-0"><i
																								class="fas fa-star text-warning"></i></li>
																							<li class="list-inline-item me-0"><i
																								class="far fa-star text-warning"></i></li>
																							<li class="list-inline-item me-0"><i
																								class="far fa-star text-warning"></i></li>
																							<li class="list-inline-item me-0"><i
																								class="far fa-star text-warning"></i></li>
																							<li class="list-inline-item me-0"><i
																								class="far fa-star text-warning"></i></li>
																						</ul>
																					</c:when>
																					<c:when test="${review.entScrWelfare == 2 }">
																						<!-- Star -->
																						<ul class="list-inline mb-0"
																							data-starcategory="rvwLevel">
																							<li class="list-inline-item me-0"><i
																								class="fas fa-star text-warning"></i></li>
																							<li class="list-inline-item me-0"><i
																								class="fas fa-star text-warning"></i></li>
																							<li class="list-inline-item me-0"><i
																								class="far fa-star text-warning"></i></li>
																							<li class="list-inline-item me-0"><i
																								class="far fa-star text-warning"></i></li>
																							<li class="list-inline-item me-0"><i
																								class="far fa-star text-warning"></i></li>
																						</ul>
																					</c:when>
																					<c:when test="${review.entScrWelfare == 3 }">
																						<!-- Star -->
																						<ul class="list-inline mb-0"
																							data-starcategory="rvwLevel">
																							<li class="list-inline-item me-0"><i
																								class="fas fa-star text-warning"></i></li>
																							<li class="list-inline-item me-0"><i
																								class="fas fa-star text-warning"></i></li>
																							<li class="list-inline-item me-0"><i
																								class="fas fa-star text-warning"></i></li>
																							<li class="list-inline-item me-0"><i
																								class="far fa-star text-warning"></i></li>
																							<li class="list-inline-item me-0"><i
																								class="far fa-star text-warning"></i></li>
																						</ul>
																					</c:when>
																					<c:when test="${review.entScrWelfare == 4 }">
																						<!-- Star -->
																						<ul class="list-inline mb-0"
																							data-starcategory="rvwLevel">
																							<li class="list-inline-item me-0"><i
																								class="fas fa-star text-warning"></i></li>
																							<li class="list-inline-item me-0"><i
																								class="fas fa-star text-warning"></i></li>
																							<li class="list-inline-item me-0"><i
																								class="fas fa-star text-warning"></i></li>
																							<li class="list-inline-item me-0"><i
																								class="fas fa-star text-warning"></i></li>
																							<li class="list-inline-item me-0"><i
																								class="far fa-star text-warning"></i></li>
																						</ul>
																					</c:when>
																					<c:when test="${review.entScrWelfare == 5 }">
																						<!-- Star -->
																						<ul class="list-inline mb-0"
																							data-starcategory="rvwLevel">
																							<li class="list-inline-item me-0"><i
																								class="fas fa-star text-warning"></i></li>
																							<li class="list-inline-item me-0"><i
																								class="fas fa-star text-warning"></i></li>
																							<li class="list-inline-item me-0"><i
																								class="fas fa-star text-warning"></i></li>
																							<li class="list-inline-item me-0"><i
																								class="fas fa-star text-warning"></i></li>
																							<li class="list-inline-item me-0"><i
																								class="fas fa-star text-warning"></i></li>
																						</ul>
																					</c:when>
																				</c:choose>
																				<div class="mt-3"></div>
																				<span style="font-weight: bold;">엄무와 삶의 균형</span>
																				<input type="hidden" name="rvwLevel"
																					value="${review.entScrWnl }">
																				<c:choose>
																					<c:when test="${review.entScrWnl == 1 }">
																						<!-- Star -->
																						<ul class="list-inline mb-0"
																							data-starcategory="rvwLevel">
																							<li class="list-inline-item me-0"><i
																								class="fas fa-star text-warning"></i></li>
																							<li class="list-inline-item me-0"><i
																								class="far fa-star text-warning"></i></li>
																							<li class="list-inline-item me-0"><i
																								class="far fa-star text-warning"></i></li>
																							<li class="list-inline-item me-0"><i
																								class="far fa-star text-warning"></i></li>
																							<li class="list-inline-item me-0"><i
																								class="far fa-star text-warning"></i></li>
																						</ul>
																					</c:when>
																					<c:when test="${review.entScrWnl == 2 }">
																						<!-- Star -->
																						<ul class="list-inline mb-0"
																							data-starcategory="rvwLevel">
																							<li class="list-inline-item me-0"><i
																								class="fas fa-star text-warning"></i></li>
																							<li class="list-inline-item me-0"><i
																								class="fas fa-star text-warning"></i></li>
																							<li class="list-inline-item me-0"><i
																								class="far fa-star text-warning"></i></li>
																							<li class="list-inline-item me-0"><i
																								class="far fa-star text-warning"></i></li>
																							<li class="list-inline-item me-0"><i
																								class="far fa-star text-warning"></i></li>
																						</ul>
																					</c:when>
																					<c:when test="${review.entScrWnl == 3 }">
																						<!-- Star -->
																						<ul class="list-inline mb-0"
																							data-starcategory="rvwLevel">
																							<li class="list-inline-item me-0"><i
																								class="fas fa-star text-warning"></i></li>
																							<li class="list-inline-item me-0"><i
																								class="fas fa-star text-warning"></i></li>
																							<li class="list-inline-item me-0"><i
																								class="fas fa-star text-warning"></i></li>
																							<li class="list-inline-item me-0"><i
																								class="far fa-star text-warning"></i></li>
																							<li class="list-inline-item me-0"><i
																								class="far fa-star text-warning"></i></li>
																						</ul>
																					</c:when>
																					<c:when test="${review.entScrWnl == 4 }">
																						<!-- Star -->
																						<ul class="list-inline mb-0"
																							data-starcategory="rvwLevel">
																							<li class="list-inline-item me-0"><i
																								class="fas fa-star text-warning"></i></li>
																							<li class="list-inline-item me-0"><i
																								class="fas fa-star text-warning"></i></li>
																							<li class="list-inline-item me-0"><i
																								class="fas fa-star text-warning"></i></li>
																							<li class="list-inline-item me-0"><i
																								class="fas fa-star text-warning"></i></li>
																							<li class="list-inline-item me-0"><i
																								class="far fa-star text-warning"></i></li>
																						</ul>
																					</c:when>
																					<c:when test="${review.entScrWnl == 5 }">
																						<!-- Star -->
																						<ul class="list-inline mb-0"
																							data-starcategory="rvwLevel">
																							<li class="list-inline-item me-0"><i
																								class="fas fa-star text-warning"></i></li>
																							<li class="list-inline-item me-0"><i
																								class="fas fa-star text-warning"></i></li>
																							<li class="list-inline-item me-0"><i
																								class="fas fa-star text-warning"></i></li>
																							<li class="list-inline-item me-0"><i
																								class="fas fa-star text-warning"></i></li>
																							<li class="list-inline-item me-0"><i
																								class="fas fa-star text-warning"></i></li>
																						</ul>
																					</c:when>
																				</c:choose>
																				<div class="mt-3"></div>
																				<span style="font-weight: bold;">사내문화</span>
																				<input type="hidden" name="rvwLevel"
																					value="${review.entScrCulture }">
																				<c:choose>
																					<c:when test="${review.entScrCulture == 1 }">
																						<!-- Star -->
																						<ul class="list-inline mb-0"
																							data-starcategory="rvwLevel">
																							<li class="list-inline-item me-0"><i
																								class="fas fa-star text-warning"></i></li>
																							<li class="list-inline-item me-0"><i
																								class="far fa-star text-warning"></i></li>
																							<li class="list-inline-item me-0"><i
																								class="far fa-star text-warning"></i></li>
																							<li class="list-inline-item me-0"><i
																								class="far fa-star text-warning"></i></li>
																							<li class="list-inline-item me-0"><i
																								class="far fa-star text-warning"></i></li>
																						</ul>
																					</c:when>
																					<c:when test="${review.entScrCulture == 2 }">
																						<!-- Star -->
																						<ul class="list-inline mb-0"
																							data-starcategory="rvwLevel">
																							<li class="list-inline-item me-0"><i
																								class="fas fa-star text-warning"></i></li>
																							<li class="list-inline-item me-0"><i
																								class="fas fa-star text-warning"></i></li>
																							<li class="list-inline-item me-0"><i
																								class="far fa-star text-warning"></i></li>
																							<li class="list-inline-item me-0"><i
																								class="far fa-star text-warning"></i></li>
																							<li class="list-inline-item me-0"><i
																								class="far fa-star text-warning"></i></li>
																						</ul>
																					</c:when>
																					<c:when test="${review.entScrCulture == 3 }">
																						<!-- Star -->
																						<ul class="list-inline mb-0"
																							data-starcategory="rvwLevel">
																							<li class="list-inline-item me-0"><i
																								class="fas fa-star text-warning"></i></li>
																							<li class="list-inline-item me-0"><i
																								class="fas fa-star text-warning"></i></li>
																							<li class="list-inline-item me-0"><i
																								class="fas fa-star text-warning"></i></li>
																							<li class="list-inline-item me-0"><i
																								class="far fa-star text-warning"></i></li>
																							<li class="list-inline-item me-0"><i
																								class="far fa-star text-warning"></i></li>
																						</ul>
																					</c:when>
																					<c:when test="${review.entScrCulture == 4 }">
																						<!-- Star -->
																						<ul class="list-inline mb-0"
																							data-starcategory="rvwLevel">
																							<li class="list-inline-item me-0"><i
																								class="fas fa-star text-warning"></i></li>
																							<li class="list-inline-item me-0"><i
																								class="fas fa-star text-warning"></i></li>
																							<li class="list-inline-item me-0"><i
																								class="fas fa-star text-warning"></i></li>
																							<li class="list-inline-item me-0"><i
																								class="fas fa-star text-warning"></i></li>
																							<li class="list-inline-item me-0"><i
																								class="far fa-star text-warning"></i></li>
																						</ul>
																					</c:when>
																					<c:when test="${review.entScrCulture == 5 }">
																						<!-- Star -->
																						<ul class="list-inline mb-0"
																							data-starcategory="rvwLevel">
																							<li class="list-inline-item me-0"><i
																								class="fas fa-star text-warning"></i></li>
																							<li class="list-inline-item me-0"><i
																								class="fas fa-star text-warning"></i></li>
																							<li class="list-inline-item me-0"><i
																								class="fas fa-star text-warning"></i></li>
																							<li class="list-inline-item me-0"><i
																								class="fas fa-star text-warning"></i></li>
																							<li class="list-inline-item me-0"><i
																								class="fas fa-star text-warning"></i></li>
																						</ul>
																					</c:when>
																				</c:choose>
																				<div class="mt-3"></div>
																				<span style="font-weight: bold;">경영진</span>
																				<input type="hidden" name="rvwLevel"
																					value="${review.entScrManagement }">
																				<c:choose>
																					<c:when test="${review.entScrManagement == 1 }">
																						<!-- Star -->
																						<ul class="list-inline mb-0"
																							data-starcategory="rvwLevel">
																							<li class="list-inline-item me-0"><i
																								class="fas fa-star text-warning"></i></li>
																							<li class="list-inline-item me-0"><i
																								class="far fa-star text-warning"></i></li>
																							<li class="list-inline-item me-0"><i
																								class="far fa-star text-warning"></i></li>
																							<li class="list-inline-item me-0"><i
																								class="far fa-star text-warning"></i></li>
																							<li class="list-inline-item me-0"><i
																								class="far fa-star text-warning"></i></li>
																						</ul>
																					</c:when>
																					<c:when test="${review.entScrManagement == 2 }">
																						<!-- Star -->
																						<ul class="list-inline mb-0"
																							data-starcategory="rvwLevel">
																							<li class="list-inline-item me-0"><i
																								class="fas fa-star text-warning"></i></li>
																							<li class="list-inline-item me-0"><i
																								class="fas fa-star text-warning"></i></li>
																							<li class="list-inline-item me-0"><i
																								class="far fa-star text-warning"></i></li>
																							<li class="list-inline-item me-0"><i
																								class="far fa-star text-warning"></i></li>
																							<li class="list-inline-item me-0"><i
																								class="far fa-star text-warning"></i></li>
																						</ul>
																					</c:when>
																					<c:when test="${review.entScrManagement == 3 }">
																						<!-- Star -->
																						<ul class="list-inline mb-0"
																							data-starcategory="rvwLevel">
																							<li class="list-inline-item me-0"><i
																								class="fas fa-star text-warning"></i></li>
																							<li class="list-inline-item me-0"><i
																								class="fas fa-star text-warning"></i></li>
																							<li class="list-inline-item me-0"><i
																								class="fas fa-star text-warning"></i></li>
																							<li class="list-inline-item me-0"><i
																								class="far fa-star text-warning"></i></li>
																							<li class="list-inline-item me-0"><i
																								class="far fa-star text-warning"></i></li>
																						</ul>
																					</c:when>
																					<c:when test="${review.entScrManagement == 4 }">
																						<!-- Star -->
																						<ul class="list-inline mb-0"
																							data-starcategory="rvwLevel">
																							<li class="list-inline-item me-0"><i
																								class="fas fa-star text-warning"></i></li>
																							<li class="list-inline-item me-0"><i
																								class="fas fa-star text-warning"></i></li>
																							<li class="list-inline-item me-0"><i
																								class="fas fa-star text-warning"></i></li>
																							<li class="list-inline-item me-0"><i
																								class="fas fa-star text-warning"></i></li>
																							<li class="list-inline-item me-0"><i
																								class="far fa-star text-warning"></i></li>
																						</ul>
																					</c:when>
																					<c:when test="${review.entScrManagement == 5 }">
																						<!-- Star -->
																						<ul class="list-inline mb-0"
																							data-starcategory="rvwLevel">
																							<li class="list-inline-item me-0"><i
																								class="fas fa-star text-warning"></i></li>
																							<li class="list-inline-item me-0"><i
																								class="fas fa-star text-warning"></i></li>
																							<li class="list-inline-item me-0"><i
																								class="fas fa-star text-warning"></i></li>
																							<li class="list-inline-item me-0"><i
																								class="fas fa-star text-warning"></i></li>
																							<li class="list-inline-item me-0"><i
																								class="fas fa-star text-warning"></i></li>
																						</ul>
																					</c:when>
																				</c:choose>
																			</div>
																		</div>
																	</div>

																	<div
																		style="flex: 0 0 auto; margin-left: 50px; word-wrap: break-word; width: calc(100% - 180px); overflow-wrap: break-word;">
																		<div>
																			<h5>"${review.entScrEvl }"</h5>
																			<br>
																		</div>
																		<div>
																			<h6 style="color: blue;">장점</h6>
																			<p class="mb-0">${review.entScrAdvantage }</p>
																		</div>

																		<!-- FAQ item -->
																		<div class="mt-4">
																			<h6 style="color: red;">단점</h6>
																			<p class="mb-0">${review.entScrWeakness }</p>
																		</div>

																		<!-- FAQ item -->
																		<div class="mt-4">
																			<h6>경영진에 바라는 점</h6>
																			<p class="mb-0">${review.entScrWish }</p>
																		</div>

																		<!-- FAQ item -->
																		<div class="mt-4">
																			<c:if test="${review.entScrFutureCmmncd eq '비슷' }">
																				<p class="mb-0">이 기업은 1년 후 <span style="font-weight: bold; color: black;">비슷</span> 할 것이다.</p>
																			</c:if>
																			<c:if test="${review.entScrFutureCmmncd ne '비슷' }">
																				<p class="mb-0">이 기업은 1년 후
																					<span style="font-weight: bold; color: black;"> ${review.entScrFutureCmmncd } </span> 하고 있을 것이다.</p>
																			</c:if>
																		</div>
																		<!-- FAQ item -->
																		<div class="mt-4">
																			<h6>이 기업을 추천 하십니까?</h6>
																			<p class="mb-0">${review.entScrRcmdYn }</p>
																		</div>
																	</div>
																</div>

																<div class="mt-4">


																	<div class="mt-4"></div>

																	<div class="btn-group" role="group"
																		aria-label="Basic radio toggle button group">
																		<br>
																		<!-- Yes button -->
																		 <label
																			class="btn btn-outline-light btn-sm mb-0 entScrLike"
																			for="btnradio3" data-entscrno="${review.entScrNo }"><i
																			class="far fa-thumbs-up me-1"></i> 도움이 돼요 (<span id="scr-like-${review.entScrNo }"> ${review.entScrLikeCount} </span>)</label>
																	</div>
																</div>
															</div>
														</div>
													</div>
												</c:forEach>
											</c:otherwise>
										</c:choose>

										<!-- Pagination START -->
										<div class="col-12" id="reviewPagingArea">
											${reviewPagingVO.pagingHTML }
										</div>
										<div class="d-sm-flex justify-content-end">
											<form action="/ent/entReviewForm.do" method="post" id="reviewForm">
												<input type="hidden" name="entNo" value="${entVO.entNo }">
												<button type="submit" class="btn btn-primary-soft mb-0" style="background-color: #dcd8fc; color: black;" data-session="${SessionInfo}" id="reviewBtn">리뷰 등록</button>
												<sec:csrfInput />
											</form>
										</div>
										<!-- Pagination END -->
									</div>
									<!-- Review END -->
								</div>
								<!-- Content END -->

								<!-- Content START -->
								<div class="tab-pane fade" id="course-pills-4" role="tabpanel"
									aria-labelledby="course-pills-tab-4">
									<div class="card">
										<!-- Card header -->
										<div class="card-header border-bottom p-0 pb-3">
											<!-- Title -->
											<h4 class="mb-3">전체리뷰</h4>
										</div>
										<br>
										<!-- 4개의 섹션 -->
										<div class="row">
											<!-- 섹션 1 -->
											<div class="col-md-6 border-end border-bottom">
												<div class="text-center">
													<span class="mb-4" style="font-weight: bold;">면접 난이도</span>
													<input type="hidden" id="avgLevel" value="${eiVO.avgLevel }">
													<c:choose>
														<c:when test="${!empty eiVO}">
														<div class="text-center mt-4">
															<!-- Info -->
															<c:choose>
																<c:when
																	test="${eiVO.avgLevel > 0 && eiVO.avgLevel <= 1.0 }">
																	<h6 class="mb-1">매우 쉬움</h6>
																</c:when>
																<c:when
																	test="${eiVO.avgLevel > 1.0 && eiVO.avgLevel <= 2.0 }">
																	<h6 class="mb-1">쉬움</h6>
																</c:when>
																<c:when
																	test="${eiVO.avgLevel > 2.0 && eiVO.avgLevel <= 3.0 }">
																	<h6 class="mb-1">보통</h6>
																</c:when>
																<c:when
																	test="${eiVO.avgLevel > 3.0 && eiVO.avgLevel <= 4.0 }">
																	<h4 class="mb-1">어려움</h4>
																</c:when>
																<c:when
																	test="${eiVO.avgLevel > 4.0 && eiVO.avgLevel <= 5.0 }">
																	<h6 class="mb-1">매우 어려움</h6>
																</c:when>
															</c:choose>
															<!-- Star -->
															<ul class="list-inline mt-4 mb-3" data-starcategory="totalLevel">
																<li class="list-inline-item me-1"><i
																	class="far fa-star text-warning"></i></li>
																<li class="list-inline-item me-1"><i
																	class="far fa-star text-warning"></i></li>
																<li class="list-inline-item me-1"><i
																	class="far fa-star text-warning"></i></li>
																<li class="list-inline-item me-1"><i
																	class="far fa-star text-warning"></i></li>
																<li class="list-inline-item me-1"><i
																	class="far fa-star text-warning"></i></li>
															</ul>
														</div>
														</c:when>
														<c:when test="${empty eiVO}">
															<div class="text-center mt-3" style="margin-bottom: 20px">
																<span>후기가	작성되지 않았습니다</span>
															</div>
														</c:when>
													</c:choose>
												</div>
											</div>
											<!-- 섹션 2 -->
											<div class="col-md-6 border-bottom">
												<div class="text-center">
													<span class="mb-0" style="font-weight: bold;">면접 경로</span>
													<c:choose>
														<c:when test="${!empty eiVO}">
															<input type="hidden" id="onlineCount"
																value="${eiVO.rvwCourseOnline }">
															<input type="hidden" id="friendCount"
																value="${eiVO.rvwCourseFriend }">
															<input type="hidden" id="headHunterCount"
																value="${eiVO.rvwCourseHeadHunter }">
															<input type="hidden" id="publicCount"
																value="${eiVO.rvwCoursePublic }">
															<input type="hidden" id="schoolCount"
																value="${eiVO.rvwCourseSchool }">
															<input type="hidden" id="etcCount"
																value="${eiVO.rvwCourseEtc }">
															<table
																style="margin: 20px auto; border-collapse: separate; border-spacing: 15px 10px; width: 80;">

																<tr>
																	<td
																		style="padding: 8px 20px; border-bottom: 1px solid #ccc;">온라인
																		지원 <span style="margin-left: 70px;"
																		id="onlinePercentage"></span>
																	</td>
																	<td
																		style="padding: 8px 20px; border-bottom: 1px solid #ccc;">직원추천
																		<span style="margin-left: 60px;" id="friendPercentage"></span>
																	</td>
																</tr>
																<tr>
																	<td
																		style="padding: 8px 20px; border-bottom: 1px solid #ccc;">헤드헌터
																		<span style="margin-left: 90px;"
																		id="headHunterPercentage"></span>
																	</td>
																	<td
																		style="padding: 8px 20px; border-bottom: 1px solid #ccc;">공개채용
																		<span style="margin-left: 60px;" id="publicPercentage"></span>
																	</td>
																</tr>
																<tr>
																	<td
																		style="padding: 8px 20px; border-bottom: 1px solid #ccc;">학교
																		취업지원 센터 <span style="margin-left: 25px;"
																		id="schoolPercentage"></span>
																	</td>
																	<td
																		style="padding: 8px 20px; border-bottom: 1px solid #ccc;">기타
																		<span style="margin-left: 90px;" id="etcPercentage"></span>
																	</td>
																</tr>
															</table>
														</c:when>
														<c:when test="${empty eiVO}">
															<div class="text-center mt-3">
																<span class="mt-3">후기가 작성되지 않았습니다</span>
															</div>
														</c:when>
													</c:choose>

												</div>
											</div>

											<!-- 섹션 3 -->
											<div class="col-md-6 border-end">
												<div class="text-center interview"
													style="display: flex; justify-content: center; width: 80%; height: auto;">
													<c:choose>
														<c:when test="${!empty eiVO}">
															<canvas id="rvwExperience-chart"
																style="flex: 0 0 400px; height: 250px;"></canvas>
															<div id="rvwExperienceDisplay"
																style="display: flex; flex-direction: column; justify-content: center;">
																<input type="hidden" id="positiveCount"
																	value="${eiVO.rvwExperiencePositiveCount}"> <input
																	type="hidden" id="normalCount"
																	value="${eiVO.rvwExperienceNormalCount}"> <input
																	type="hidden" id="negativeCount"
																	value="${eiVO.rvwExperienceNegativeCount}">
																<p id="positivePercentage"
																	style="white-space: nowrap; overflow: hidden; text-overflow: ellipsis; width: 100%;"></p>
																<p id="normalPercentage"
																	style="white-space: nowrap; overflow: hidden; text-overflow: ellipsis; width: 100%;"></p>
																<p id="negativePercentage"
																	style="white-space: nowrap; overflow: hidden; text-overflow: ellipsis; width: 100%;"></p>
															</div>
														</c:when>

														<c:when test="${empty eiVO}">
															<div class="text-center mt-5">
																<span class="mt-5">&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;후기가
																	작성되지 않았습니다</span>
															</div>
														</c:when>
													</c:choose>

												</div>
											</div>

											<!-- 섹션 4 -->
											<div class="col-md-6 border-1">
												<div class="text-center interview"
													style="display: flex; justify-content: center; width: 80%; height: auto;">
													<c:choose>
														<c:when test="${!empty eiVO}">
															<canvas id="rvwStts-chart"
																style="flex: 0 0 300px; height: 150px;"></canvas>
															<div id="rvwSttsDisplay"
																style="display: flex; flex-direction: column; justify-content: center; width: 300px;">
																<input type="hidden" id="passCount"
																	value="${eiVO.rvwSttsPass}"> <input
																	type="hidden" id="waitingCount"
																	value="${eiVO.rvwSttsWaiting}"> <input
																	type="hidden" id="notPassCount"
																	value="${eiVO.rvwSttsNotPass}">
																<p id="passPercentage"
																	style="white-space: nowrap; overflow: hidden; text-overflow: ellipsis; width: 100%;">합격
																	비율</p>
																<p id="waitingPercentage"
																	style="white-space: nowrap; overflow: hidden; text-overflow: ellipsis; width: 100%;">대기
																	비율</p>
																<p id="notPassPercentage"
																	style="white-space: nowrap; overflow: hidden; text-overflow: ellipsis; width: 100%;">불합격
																	비율</p>
															</div>
														</c:when>

														<c:when test="${empty eiVO}">
															<div class="text-center mt-5">
																<span class="mt-5">&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;후기가
																	작성되지 않았습니다</span>
															</div>
														</c:when>
													</c:choose>
												</div>
											</div>

										</div>
										<br>
										<hr>
										<br>
										<!-- Card header -->
										<div class="card-header border-bottom p-0 pb-3">
											<!-- Title -->
											<h4 class="mb-3">모아보기</h4>
											<form class="row g-4" id="interviewSearchForm" method="post">
												<input type="hidden" id="entInterviewPage"
													name="entInterviewPage">
												<!-- Search -->
												<div class="col-sm-6 col-lg-3 position-relative">
													<div class="position-relative" style="width: 90%">
														<select class="js-choice" name="interviewSearchType"
															id="interviewSearchType">
															<option value="">합격/불합격 후기</option>
															<option value="합격"
																<c:if test="${interviewSearchType eq '합격' }">selected</c:if>>합격후기
															</option>
															<option value="불합격"
																<c:if test="${interviewSearchType eq '불합격' }">selected</c:if>>불합격
																후기</option>
														</select>
													</div>
													<div style="margin-left: 30px;">
														<button
															class="bg-transparent p-2 position-absolute top-50 end-0 translate-middle-y border-0 text-primary-hover text-reset"
															type="submit" style="margin-left: 30px;">
															<i class="fas fa-search fs-6"></i>
														</button>
													</div>
												</div>
												<sec:csrfInput />
											</form>
										</div>
										<br>
										<!-- FAQs START -->
										<div>
											<c:choose>
												<c:when test="${!empty eiVO}">
													<span>총</span>
													<span style="color: green;">${eiVO.rvmCount}</span>
													<span>개의 리뷰</span>
												</c:when>
												<c:otherwise>
													<p></p>
												</c:otherwise>
											</c:choose>
										</div>
										<c:set value="${interviewPagingVO.dataList }"
											var="interviewList" />
										<c:choose>
											<c:when test="${empty interviewList }">
													작성된 후기가 없습니다. 첫번째 후기를 남겨주세요
												</c:when>
											<c:otherwise>
												<c:forEach items="${interviewList }" var="interview">
													<div class="col-12">
														<br>
														<div class="card border rounded-3">
															<!-- Card body START -->
															<div class="card-body">
																<!-- FAQ item -->
																<div>
																	<span style="margin-right: 10px;">
																		${interview.rvwCmmncd } </span> | <span
																		style="margin-left: 10px;"> ${interview.rvwYmd }</span>
																</div>
																<br>

																<div style="display: flex;">
																	<div style="flex: 0 0 100px;">
																		<div class="text-center">
																			<!-- Info -->
																			<div class="mt-4">
																				<h6>면접난이도</h6>
																				<input type="hidden" name="rvwLevel" value="${interview.rvwLevel }">
																				<c:choose>
																					<c:when test="${interview.rvwLevel == 1 }">
																						<p class="mb-0">매우 쉬움</p>
																						<!-- Star -->
																						<ul class="list-inline mb-0" data-starcategory="rvwLevel">
																							<li class="list-inline-item me-0"><i
																								class="fas fa-star text-warning"></i></li>
																							<li class="list-inline-item me-0"><i
																								class="far fa-star text-warning"></i></li>
																							<li class="list-inline-item me-0"><i
																								class="far fa-star text-warning"></i></li>
																							<li class="list-inline-item me-0"><i
																								class="far fa-star text-warning"></i></li>
																							<li class="list-inline-item me-0"><i
																								class="far fa-star text-warning"></i></li>
																						</ul>
																					</c:when>
																					<c:when test="${interview.rvwLevel == 2 }">
																						<p class="mb-0">쉬움</p>
																						<!-- Star -->
																						<ul class="list-inline mb-0"
																							data-starcategory="rvwLevel">
																							<li class="list-inline-item me-0"><i
																								class="fas fa-star text-warning"></i></li>
																							<li class="list-inline-item me-0"><i
																								class="fas fa-star text-warning"></i></li>
																							<li class="list-inline-item me-0"><i
																								class="far fa-star text-warning"></i></li>
																							<li class="list-inline-item me-0"><i
																								class="far fa-star text-warning"></i></li>
																							<li class="list-inline-item me-0"><i
																								class="far fa-star text-warning"></i></li>
																						</ul>
																					</c:when>
																					<c:when test="${interview.rvwLevel == 3 }">
																						<p class="mb-0">보통</p>
																						<!-- Star -->
																						<ul class="list-inline mb-0"
																							data-starcategory="rvwLevel">
																							<li class="list-inline-item me-0"><i
																								class="fas fa-star text-warning"></i></li>
																							<li class="list-inline-item me-0"><i
																								class="fas fa-star text-warning"></i></li>
																							<li class="list-inline-item me-0"><i
																								class="fas fa-star text-warning"></i></li>
																							<li class="list-inline-item me-0"><i
																								class="far fa-star text-warning"></i></li>
																							<li class="list-inline-item me-0"><i
																								class="far fa-star text-warning"></i></li>
																						</ul>
																					</c:when>
																					<c:when test="${interview.rvwLevel == 4 }">
																						<p class="mb-0">어려움</p>
																						<!-- Star -->
																						<ul class="list-inline mb-0"
																							data-starcategory="rvwLevel">
																							<li class="list-inline-item me-0"><i
																								class="fas fa-star text-warning"></i></li>
																							<li class="list-inline-item me-0"><i
																								class="fas fa-star text-warning"></i></li>
																							<li class="list-inline-item me-0"><i
																								class="fas fa-star text-warning"></i></li>
																							<li class="list-inline-item me-0"><i
																								class="fas fa-star text-warning"></i></li>
																							<li class="list-inline-item me-0"><i
																								class="far fa-star text-warning"></i></li>
																						</ul>
																					</c:when>
																					<c:when test="${interview.rvwLevel == 5 }">
																						<p class="mb-0">매우 어려움</p>
																						<!-- Star -->
																						<ul class="list-inline mb-0"
																							data-starcategory="rvwLevel">
																							<li class="list-inline-item me-0"><i
																								class="fas fa-star text-warning"></i></li>
																							<li class="list-inline-item me-0"><i
																								class="fas fa-star text-warning"></i></li>
																							<li class="list-inline-item me-0"><i
																								class="fas fa-star text-warning"></i></li>
																							<li class="list-inline-item me-0"><i
																								class="fas fa-star text-warning"></i></li>
																							<li class="list-inline-item me-0"><i
																								class="fas fa-star text-warning"></i></li>
																						</ul>
																					</c:when>
																				</c:choose>
																			</div>

																		</div>
																		<div class="text-center">
																			<div class="mt-4">
																				<h6>면접일자</h6>
																				<p class="mb-0">${interview.rvwIntYmd }</p>
																			</div>
																		</div>
																	</div>

																	<div
																		style="flex: 0 0 auto; margin-left: 50px; word-wrap: break-word; width: calc(100% - 150px); overflow-wrap: break-word;">
																		<div>
																			<h5>"${interview.rvwCrs }"</h5>
																			<br>
																		</div>

																		<div>
																			<h6>면접 질문</h6>
																			<p class="mb-0">${interview.rvwQue }</p>
																		</div>

																		<!-- FAQ item -->
																		<div class="mt-4">
																			<h6>면접답변 혹은 면접느낌</h6>
																			<p class="mb-0">${interview.rvwAns }</p>
																		</div>

																		<!-- FAQ item -->
																		<div class="mt-4">
																			<h6>발표날짜</h6>
																			<p class="mb-0">${interview.rvwAnnYmd }</p>
																		</div>
																	</div>
																</div>

																<div class="mt-4">

																	<div class="bg-light rounded-3 p-3 mb-4"
																		style="max-width: 900px; margin: 0 auto;">
																		<div
																			class="row g-4 justify-content-center align-items-center">
																			<!-- Organization -->
																			<div class="col-md-4 text-center">
																				<div class="d-flex align-items-center">
																					<!-- Avatar -->
																					<h6 class="fw-normal mb-0 ms-2 me-2">면접 결과</h6>
																					<c:choose>
																						<c:when test="${interview.rvwStts eq '합격' }">
																							<div class="me-2">
																								<i class="fa-solid fa-face-laugh-beam fa-2x"></i>
																							</div>
																							<span class="align-middle" style="color: blue;">합격</span>
																						</c:when>
																						<c:when test="${interview.rvwStts eq '대기중' }">
																							<div class="me-2">
																								<i class="fa-solid fa-face-meh-blank fa-2x"></i>
																							</div>
																							<span class="align-middle" style="color: green;">대기중</span>
																						</c:when>
																						<c:when test="${interview.rvwStts eq '불합격' }">
																							<div class="me-2">
																								<i class="fa-solid fa-face-sad-cry fa-2x"></i>
																							</div>
																							<span class="align-middle" style="color: red;">불합격</span>
																						</c:when>

																					</c:choose>
																				</div>
																			</div>

																			<div class="col-md-4 text-center">
																				<div class="d-flex align-items-center">
																					<!-- Avatar -->
																					<h6 class="fw-normal mb-0 ms-2 me-2">면접 경험</h6>
																					<c:choose>
																						<c:when
																							test="${interview.rvwExperience eq '긍정적' }">
																							<div class="me-2">
																								<i class="fa-solid fa-face-laugh-beam fa-2x"></i>
																							</div>
																							<span class="align-middle" style="color: blue;">긍정적</span>
																						</c:when>
																						<c:when test="${interview.rvwExperience eq '보통' }">
																							<div class="me-2">
																								<i class="fa-solid fa-face-meh-blank fa-2x"></i>
																							</div>
																							<span class="align-middle" style="color: green;">보통</span>
																						</c:when>
																						<c:when
																							test="${interview.rvwExperience eq '부정적' }">
																							<div class="me-2">
																								<i class="fa-solid fa-face-sad-cry fa-2x"></i>
																							</div>
																							<span class="align-middle" style="color: red;">부정적</span>
																						</c:when>

																					</c:choose>
																				</div>
																			</div>

																		</div>
																	</div>

																	<div class="mt-4"></div>

																	<div class="btn-group" role="group"
																		aria-label="Basic radio toggle button group">
																		<br>
																		<!-- Yes button -->
																		 <label
																			class="btn btn-outline-light btn-sm mb-0 entLikeInterview"
																			for="btnradio3" data-entrvwno="${interview.rvwNo }"><i
																			class="far fa-thumbs-up me-1" ></i>  도움이 돼요 (<span id="rvw-like-${interview.rvwNo }">${interview.rvwLikeCount }</span>) </label>
																	</div>
																</div>
															</div>
														</div>
													</div>
												</c:forEach>
											</c:otherwise>
										</c:choose>

										<input type="hidden" id="auth" value="${sessionScope.SessionInfo.authCmmncd }">

										<!-- Pagination START -->
										<div class="col-12" id="interviewPagingArea">
											${interviewPagingVO.pagingHTML }</div>
										<div class="d-sm-flex justify-content-end">
											<form action="/ent/entInterviewForm.do" method="post" id="interviewForm">
												<input type="hidden" name="entNo" value="${entVO.entNo }">
												<button type="submit" class="btn btn-primary-soft mb-0" style="background-color: #dcd8fc; color: black;" data-session="${SessionInfo}" id="interviewBtn">후기 등록</button>
												<sec:csrfInput />
											</form>
										</div>
										<!-- Pagination END -->
									</div>
									<!-- Review END -->
								</div>
							</div>
							<!-- Card body -->
						</div>
					</div>
					<!-- Content END -->
				</div>
			</div>
			<!-- Tab contents END -->
		</div>
		<!-- Main content END -->
		<!-- Row END -->
	</section>
	<!-- =======================Page content END -->

</main>
<!-- **************** MAIN CONTENT END **************** -->

<script type="text/javascript">
	$(function() {

		
		$(document).ready(function() {
		    filterRecruits(); // 페이지 로드 시 실행되어 진행 중인 공고만 표시

		    function filterRecruits() {
		        var checkBox = $('#endRecruit');
		        var recruitCards = $('.recruitCard');
		        recruitCards.each(function() {
		            var card = $(this);
		            var cardBackground = card.find('.card').css('background-color');
		            if (!checkBox.is(':checked') && cardBackground === 'rgb(214, 214, 214)') { // #d6d6d6를 rgb로 변환
		                card.hide(); // 마감된 공고 숨김
		            } else {
		                card.show(); // 마감된 공고도 보여줌
		            }
		        });
		    }

		    // 체크박스 상태 변경 감지
		    $('#endRecruit').change(filterRecruits);
		});
		
		
		
		
	$(document).ready(function() {
		    
		    $('.recruitCardBody').click(function(e) {
		        
		        if (!$(event.target).closest('.likeRecruit, .disLikeRecruit').length) {

		    	var strtDt = $(this).data("strtdt");
		    	var recruitNo = $(this).data("recruitno");
		    	var pstnNm = $(this).data("pstncmmncdnm");
		    	
		        if (strtDt == '공고예정') {
		            
		        	Swal.fire({
		        		icon : 'info',
		        		text : "아직 공고가 시작되지 않았습니다"
		        	})
		        	
		        } else {
		            
		        	window.location.href = '/main/recruitDetail.do?recruitNo=' + recruitNo + '&pstnCmmncdNm=' + pstnNm;
		        }
		    }
	    });
	});
		
		
		var reviewBtn = $("#reviewBtn");
		var reviewForm =$("#reviewForm");
		
		var interviewBtn = $("#interviewBtn");
		var interviewForm = $("#interviewForm");
		

		reviewBtn.on("click",function(e){
			e.preventDefault();
			
			var session = $(this).data("session");
			
			 if(session == null || session == "") {
			        Swal.fire({
			            title: "리뷰 등록은 로그인 후<br> 이용 가능합니다",
			            text: "로그인 페이지로 이동 하시겠습니까?",
			            icon: "info",
			            showCancelButton: true, // cancel버튼 보이기. 기본은 원래 없음
			            confirmButtonColor: '#3085d6', // confrim 버튼 색깔 지정
			            cancelButtonColor: '#d33', // cancel 버튼 색깔 지정
			            confirmButtonText: '확인', // confirm 버튼 텍스트 지정
			            cancelButtonText: '취소', // cancel 버튼 텍스트 지정
				        reverseButtons: false
				        
			        }).then((result) => {
			            if(result.value) {
			            	reviewForm.submit();
			            }
			        });
			    }else{
			    	
			    	reviewForm.submit();
			    }
		});
		
		interviewBtn.on("click",function(e){
			e.preventDefault();
			
			var session = $(this).data("session");
			
			 if(session == null || session == "") {
			        Swal.fire({
			            title: "후기 등록은 로그인 후<br> 이용 가능합니다",
			            text: "로그인 페이지로 이동 하시겠습니까?",
			            icon: "info",
			            showCancelButton: true, // cancel버튼 보이기. 기본은 원래 없음
			            confirmButtonColor: '#3085d6', // confrim 버튼 색깔 지정
			            cancelButtonColor: '#d33', // cancel 버튼 색깔 지정
			            confirmButtonText: '확인', // confirm 버튼 텍스트 지정
			            cancelButtonText: '취소', // cancel 버튼 텍스트 지정
				        reverseButtons: false
				        
			        }).then((result) => {
			            if(result.value) {
			                location.href="/main/loginForm.do";
			            }
			        });
			    }else{
			    	
			    	interviewForm.submit();
			    }
		});
		
		
		
		// 일반게시판 페이징
		var BBS201searchForm = $("#BBS201searchForm");
		var BBS201pagingArea = $("#BBS201pagingArea");

		BBS201pagingArea.on("click", "a", function(e) {
			e.preventDefault();
			var BBS201pagingNo = $(this).data("page");
			BBS201searchForm.find("#BBS201page").val(BBS201pagingNo);
			BBS201searchForm.submit();

		});

		// 리뷰 후기 페이징
		var reviewPagingArea = $("#reviewPagingArea");
		var reviewSearchForm = $("#reviewSearchForm");

		reviewPagingArea.on("click", "a", function(e) {
			e.preventDefault();
			var reviewPagingNo = $(this).data("reviewpage");

			reviewSearchForm.find("#entReviewPage").val(reviewPagingNo);
			reviewSearchForm.submit();
		});

		
		$(".entScrLike").on("click",function(e){
			e.preventDefault();
			
			var entScrNo = $(this).data("entscrno");
			
			var session = $("#sessionInfo").val();
			console.log(entScrNo);
			console.log(session);
			
			
			 if (session == null || session == "") {
			        Swal.fire({
			            title: "리뷰 추천은 로그인 후 <br> 이용 가능합니다",
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
			        })
			    }else{
					$.ajax({
						url : "/ent/entScrLike.do",
						type : "post",
						data : {
							entScrNo : entScrNo
						},
						beforeSend: function(xhr) {
		                    xhr.setRequestHeader(header, token);
		                },
		                success: function(res) {
		                	var likeCountElement = $("#scr-like-"+entScrNo);  // 고유 ID를 사용해 해당 요소를 선택
		                    var currentCount = parseInt(likeCountElement.text());  // 현재 카운트 값을 정수로 파싱
		                    likeCountElement.text(currentCount + 1);  // 카운트를 1 증가시켜 다시 설정
		                }
					})
			    } 
			

		});
			
		
		
		
		// 면접후기 페이징
		var interviewPagingArea = $("#interviewPagingArea");
		var interviewSearchForm = $("#interviewSearchForm");

		interviewPagingArea.on("click", "a", function(e) {
			e.preventDefault();
			var interviewPagingNo = $(this).data("interviewpage");
			interviewSearchForm.find("#entInterviewPage").val(interviewPagingNo);
			interviewSearchForm.submit();

		});

		
		$(".entLikeInterview").on("click",function(e){
			e.preventDefault();
			
			var entRvwNo = $(this).data("entrvwno");
			
			var session = $("#sessionInfo").val();
			console.log(entRvwNo);
			console.log(session);
			
			
			 if (session == null || session == "") {
			        Swal.fire({
			            title: "후기 추천은 로그인 후 <br> 이용 가능합니다",
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
			        })
			    }else{
					$.ajax({
						url : "/ent/entRvwLike.do",
						type : "post",
						data : {
							entRvwNo : entRvwNo
						},
						beforeSend: function(xhr) {
		                    xhr.setRequestHeader(header, token);
		                },
		                success: function(res) {
		                	var likeCountElement = $("#rvw-like-"+entRvwNo);  // 고유 ID를 사용해 해당 요소를 선택
		                    var currentCount = parseInt(likeCountElement.text());  // 현재 카운트 값을 정수로 파싱
		                    likeCountElement.text(currentCount + 1);  // 카운트를 1 증가시켜 다시 설정
		                }
					})
			    } 
			

		});
		
		
		
		
		
		var recruitMiniListPagingArea = $("#recruitMiniListPagingArea");
		var recruitMiniListForm = $("#recruitMiniListForm");
		
		recruitMiniListPagingArea.on("click", "a" ,function(e){
			e.preventDefault();
			var recruitMiniListPagingNo = $(this).data("recruitminipage");
			recruitMiniListForm.find("#recruitMiniListPage").val(recruitMiniListPagingNo);
			recruitMiniListForm.submit();
		})

		// 관심공고 클릭시 해제 
		 $(document).on("click", ".likeRecruit", function(e) {
	        e.preventDefault();
	        e.stopPropagation();
	        var $this = $(this);
	
	        Swal.fire({
	            title: "관심 공고를 해지하시겠습니까?",
	            icon: "warning",
	            showCancelButton: true,
	            confirmButtonColor: '#3085d6',
	            cancelButtonColor: '#d33',
	            confirmButtonText: '확인',
	            cancelButtonText: '취소',
	            reverseButtons: false
	        }).then((result) => {
	            if (result.value) {
	                var recruitNo = $this.data("recruitno");
	                var pstnNm = $this.data("pstnnm");
	                var data = {
	                    recruitNo: recruitNo,
	                    pstnNm: pstnNm
	                };
	
	                $.ajax({
	                    type: "post",
	                    url: "/ent/likeRecruit.do",
	                    contentType: "application/json; charset=utf-8",
	                    data: JSON.stringify(data),
	                    beforeSend: function(xhr) {
	                        xhr.setRequestHeader(header, token);
	                    },
	                    success: function(res) {
	                        console.log("res >>>>>" + res);
	                        $this.removeClass("likeRecruit").addClass("disLikeRecruit");
	                        $this.find('.like').removeClass("text-danger fas fa-heart like").addClass("far fa-heart dislike");
	                    }
	                });
	            }
	        });
	    });
		
		
		// 관심 공고 클릭시 등록 
		$(document).on("click", ".disLikeRecruit", function(e) {
			e.preventDefault();
			e.stopPropagation();  
		    
		    var $this = $(this);
		    var session = $this.data("session");
		
		    var authCode = $("#auth").val();
		    
		    if(authCode == 'AUTH101' || authCode == 'AUTH103'){
		    	Swal.fire({
		    		icon : "info",
		    		text : "관심 공고는 일반회원만 등록이 가능합니다"
		    	});
		    	return;
		    }		    
		    if (session == null || session == "") {
		        Swal.fire({
		            title: "관심 공고 등록은 로그인 후 <br> 이용 가능합니다",
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
		        var recruitNo = $this.data("recruitno");
		        var pstnNm = $this.data("pstnnm");
		        var data = {
		            recruitNo: recruitNo,
		            pstnNm: pstnNm
		        };
		
		        $.ajax({
		            type: "post",
		            url: "/ent/disLikeRecruit.do",
		            contentType: "application/json; charset=utf-8",
		            data: JSON.stringify(data),
		            beforeSend: function(xhr) {
		                xhr.setRequestHeader(header, token);
		            },
		            success: function(res) {
		                console.log("res >>>>>" + res);
		                $this.removeClass("disLikeRecruit").addClass("likeRecruit");
		                $this.find('i').removeClass("far fa-heart disLike").addClass("text-danger fas fa-heart like");
		            }
		        });
		    }
		});
		
		
// 		// 로컬스토리지에 선택한 탭의 아이디를 담아놓은다음 새로고침시 선택한 탭이 활성화 되게 한다.
// 		$(document).ready(function() {
// 			// 탭 클릭 이벤트
// 			$('.nav-link').on('click', function() {
// 				var selectedTabId = $(this).attr('id');
// 				localStorage.setItem('activeTab', selectedTabId);
// 			});

// 			// 페이지 로드 시 로컬 스토리지에서 탭 ID 읽기
// 			var activeTabId = localStorage.getItem('activeTab');
// 			if (activeTabId) {
// 				$('#' + activeTabId).trigger('click'); // 해당 탭을 프로그래매틱하게 클릭하여 활성화
// 			}
// 		});

		$(document).ready(function() {
		    // 탭 클릭 이벤트
		    $('.nav-link').on('click', function() {
		        var selectedTabId = $(this).attr('id');
		        sessionStorage.setItem('activeTab', selectedTabId);
		    });

		    // 페이지 로드 시 세션 스토리지에서 탭 ID 읽기
		    var activeTabId = sessionStorage.getItem('activeTab');
		    if (activeTabId) {
		        $('#' + activeTabId).trigger('click'); // 해당 탭을 프로그래매틱하게 클릭하여 활성화
		    }
		});

	////// 면접 경험 차트
		var posCount = document.getElementById('positiveCount');
		var positiveCount = 0;
		var normalCount = 0;
		var negativeCount = 0;
		if (posCount != null) {
			positiveCount = parseInt(document.getElementById('positiveCount').value, 10);
			normalCount = parseInt(document.getElementById('normalCount').value, 10);
			negativeCount = parseInt(document.getElementById('negativeCount').value, 10);

			// 전체 합계 계산
			var total = positiveCount + normalCount + negativeCount;

			// 백분율 계산
			var positivePercentage = (positiveCount / total) * 100;
			var normalPercentage = (normalCount / total) * 100;
			var negativePercentage = (negativeCount / total) * 100;

			// 결과를 소수점 첫 번째 자리에서 반올림
			positivePercentage = Math.round(positivePercentage * 10) / 10;
			normalPercentage = Math.round(normalPercentage * 10) / 10;
			negativePercentage = Math.round(negativePercentage * 10) / 10;

			console.log(positivePercentage);

			new Chart(document.getElementById("rvwExperience-chart"), {
				type : 'pie',
				data : {
					labels : [ "긍정적", "보통", "부정적" ],
					datasets : [ {
						label : "Interview Experience",
						backgroundColor : [ "#00bfd9", "#78c700", "#ff3600" ],
						data : [ positiveCount, normalCount, negativeCount ]
					} ]
				},
				options : {
					title : {
						display : true,
						text : '면접 경험',
						fontSize : 15
					}
				}
			});

			// 백분율을 텍스트 요소로 표시
			var posPercent = document.getElementById('positivePercentage');
			if (posPercent != null) {
				document.getElementById('positivePercentage').textContent = "긍정    "	+ positivePercentage + '%';
				document.getElementById('normalPercentage').textContent = "보통    " + normalPercentage + '%';
				document.getElementById('negativePercentage').textContent = "부정 " + negativePercentage + '%';
			}
		}

		////////////////////////////// 합격자수 차트
		
		var sttsCount =  $("#passCount");
		
		var passCount = 0;
		var waitingCount = 0;
		var notPassCount= 0;
		if(sttsCount != null){
			
			var passCount = parseInt($("#passCount").val());
			var waitingCount = parseInt($("#waitingCount").val());
			var notPassCount = parseInt($("#notPassCount").val());
	
			var totalStts = passCount + waitingCount + notPassCount;
	
			var passPercentage = (passCount / totalStts) * 100;
			var waitingPercentage = (waitingCount / totalStts) * 100;
			var notPassPercentage = (notPassCount / totalStts) * 100;
	
			passPercentage = Math.round(passPercentage * 10) / 10;
			waitingPercentage = Math.round(waitingPercentage * 10) / 10;
			notPassPercentage = Math.round(notPassPercentage * 10) / 10;
	
			console.log("합격자 수" + passCount);
	
			new Chart($("#rvwStts-chart"), {
				type : 'pie',
				data : {
					labels : [ "합격", "대기", "불합격" ],
					datasets : [ {
						label : "Interview Stts",
						backgroundColor : [ "#00bfd9", "#78c700", "#ff3600" ],
						data : [ passCount, waitingCount, notPassCount ]
					} ]
				},
				options : {
					title : {
						display : true,
						text : '면접 결과',
						fontSize : 15
					}
				}
			});
	
			$("#passPercentage").text("합격  " + passPercentage + " %");
			$("#waitingPercentage").text("대기중    " + waitingPercentage + " %");
			$("#notPassPercentage").text("불합격    " + notPassPercentage + " %");
		}

		
		
		var onlineCount = parseInt($("#onlineCount").val());
		var friendCount = parseInt($("#friendCount").val());
		var headHunterCount = parseInt($("#headHunterCount").val());
		var publicCount = parseInt($("#publicCount").val());
		var schoolCount = parseInt($("#schoolCount").val());
		var etcCount = parseInt($("#etcCount").val());

		console.log(onlineCount + "onlineCount")

		var totalCourse = onlineCount + friendCount + headHunterCount
				+ publicCount + schoolCount + etcCount;

		var onlinePercentage = (onlineCount / totalCourse) * 100;
		var friendPercentage = (friendCount / totalCourse) * 100;
		var headHunterPercentage = (headHunterCount / totalCourse) * 100;
		var publicPercentage = (publicCount / totalCourse) * 100;
		var schoolPercentage = (schoolCount / totalCourse) * 100;
		var etcPercentage = (etcCount / totalCourse) * 100;

		onlinePercentage = Math.round(onlinePercentage * 10) / 10;
		friendPercentage = Math.round(friendPercentage * 10) / 10;
		headHunterPercentage = Math.round(headHunterPercentage * 10) / 10;
		publicPercentage = Math.round(publicPercentage * 10) / 10;
		schoolPercentage = Math.round(schoolPercentage * 10) / 10;
		etcPercentage = Math.round(etcPercentage * 10) / 10;

		$("#onlinePercentage").text(onlinePercentage + " %")
		$("#friendPercentage").text(friendPercentage + " %")
		$("#headHunterPercentage").text(headHunterPercentage + " %")
		$("#publicPercentage").text(publicPercentage + " %")
		$("#schoolPercentage").text(schoolPercentage + " %")
		$("#etcPercentage").text(etcPercentage + " %")

		/* ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ */
		var rcmdYCount = parseInt($("#entScrRcmdY").val());
		var rcmdNCount = parseInt($("#entScrRcmdN").val());
		var ceoGoodYCount = parseInt($("#entScrCeoGood").val());
		var ceoBadCount = parseInt($("#entScrCeoBad").val());
		var futureYCount = parseInt($("#entScrFutureY").val());
		var futureNCount = parseInt($("#entScrFutureN").val());

		var rcmdTotal = rcmdYCount + rcmdNCount;
		var ceoTotal = ceoGoodYCount + ceoBadCount;
		var futureTotal = futureYCount + futureNCount;

		console.log(rcmdTotal + "<<<<<< 기업추천율");

		var rcmdPercentage = (rcmdYCount / rcmdTotal) * 100;
		var ceoPercentage = (ceoGoodYCount / ceoTotal) * 100;
		var futurePercentage = (futureYCount / futureTotal) * 100;

		console.log(rcmdPercentage + "<<<<<<<<<<<<<<<<<< ㄴㄴㄴ기업추천율");

		rcmdPercentage = Math.round(rcmdPercentage * 10) / 10;
		ceoPercentage = Math.round(ceoPercentage * 10) / 10;
		futurePercentage = Math.round(futurePercentage * 10) / 10;

		$("#rcmdPercentage").text(rcmdPercentage + " %")
		$("#ceoPercentage").text(ceoPercentage + " %")
		$("#futurePercentage").text(futurePercentage + " %")
});	

	
	//////////////////////////////////////////////////////////////////////
		// 채용 히스토리 차트
	$(document).ready(function() {	
		var careerCount = document.getElementById("careerCount").value;
		var newCareerCount = document.getElementById("newCareerCount").value;
		var nothingCount = document.getElementById("nothingCount").value;
		
		
		
		
	new Chart(document.getElementById("recruitCount-chart"), {
	    type: 'doughnut',
	    data: {
	      labels: ["경력", "경력무관", "신입"],
	      datasets: [
	        {
	          label: "Recruit",
	          backgroundColor: ["#78c1ff", "#ff6d6d","#fbb63f"],
	          data: [careerCount,nothingCount,newCareerCount]
	        }
	      ]
	    },
	    options: {
	      title: {
	        display: false,
	      }
	    }
	});

});	
		/////////////////////////////////////////////////////////
		
	$(document).ready(function() {	
	var empCount = document.getElementById("empCount").value;
		
	 new Chart(document.getElementById("empCount-chart"), {
         type: 'bar',
         data: {
             labels: ['2024'],
             datasets: [
                 {
                     label: '사원수',
                     fill: false,
                     data: [empCount, 100],
                     backgroundColor: '#3399ff',
                     borderColor: '#3399ff',
                     borderWidth: 1
                 }
             ]
         },
         options: {
             maintainAspectRatio: false,
             scales: {
                 yAxes: [
                     {
                         ticks: {
                             beginAtZero: true
                         }
                     }
                 ],
                 xAxes: [
                     {
                         categoryPercentage: 0.2, // 여기 값을 조절하여 막대의 카테고리 폭을 설정
                         barPercentage: 0.2 // 여기 값을 조절하여 막대의 넓이를 설정
                     }
                 ]
             },
         }
     });
		
		
});

	
	
	// 별점 출력 자바스크립트
	document.addEventListener("DOMContentLoaded",function() {
		function safeParseFloat(value) {
			var num = parseFloat(value);
			return isNaN(num) ? 0 : num; // 유효하지 않은 값이면 0 반환, 그렇지 않으면 파싱된 값 반환
		}
	
		function updateStars(category, value) {
			var avgScore = safeParseFloat(value); // 안전한 파싱 함수 사용
			console.log("Updating stars for:", category,"with score:", avgScore);
	
	
	
			var stars = document.querySelector("[data-starcategory='"+ category + "']");							
			if (stars != null) {
				var fullStars = Math.floor(avgScore);
				
				var halfStar = (avgScore % 1) >= 0.1 ? 1 : 0;
				var emptyStars = 5 - fullStars - halfStar;
	
				stars.innerHTML = ""; // 별 초기화
				for (var i = 0; i < fullStars; i++) {
					stars.innerHTML += "<li class='list-inline-item me-0'><i class='fas fa-star text-warning' style='font-size: 20px;'></i></li>";
				}
				if (halfStar === 1) {
					stars.innerHTML += "<li class='list-inline-item me-0'><i class='fas fa-star-half-alt text-warning' style='font-size: 20px;'></i></li>";
				}
				for (var j = 0; j < emptyStars; j++) {
					stars.innerHTML += "<li class='list-inline-item me-0'><i class='far fa-star text-warning' style='font-size: 20px;'></i></li>";
				}
			}
			        if (!stars) {
			            console.error('Stars element not found for category:', category);
			            return;  // 요소가 없으면 함수 종료
			        }
					console.log(stars);
		}
	
		function updateCategory(category, value) {
			updateStars(category, value);
			updateProgress(category, value);
		}
	
		function updateProgress(category, value) {
			var avgScore = safeParseFloat(value);
			console.log("Updating progress for:", category,
					"with score:", avgScore);
	
			var progressBar = document
					.querySelector("[data-progresscategory='"
							+ category + "']");
			if (!progressBar) {
				console.error('Progress bar element not found for category:',category);
				return;
			}
	
			var percentage = Math.round((avgScore / 5) * 100);
			progressBar.style.width = percentage + "%";
		}
	
		// 카테고리별 별점과 진행 상태 업데이트
		updateStars("totalScore", document.getElementById("avgtscr").value);
		updateStars("totalLevel", document.getElementById("avgLevel").value);
	
		updateCategory("welfare", document.getElementById("avgwelfare").value);
		updateCategory("wnl",document.getElementById("avgwnl").value);
		updateCategory("promotion", document.getElementById("avgpromotion").value);
		updateCategory("culture", document.getElementById("avgculture").value);
		updateCategory("management", document.getElementById("avgmanagement").value);
	});
</script>









