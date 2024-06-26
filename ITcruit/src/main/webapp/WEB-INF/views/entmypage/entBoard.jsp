<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

    
<div class="page-content-wrapper border">

		<!-- Title -->
		<div class="row mb-3">
			<div class="col-12 d-sm-flex justify-content-between align-items-center">
				<h1 class="h5 mb-2 mb-sm-0">기업게시판 관리</h1>
				<a href="/myPage/enterprise/entNoticeForm.do" class="btn btn-sm btn-primary mb-0">공지작성</a>
			</div>
		</div>

		<div class="page-content-wrapper border">

			<div class="tab-pane show active" id="tab-23">
				<ul class="nav nav-tabs nav-tabs-line mb-3">
					<li class="nav-item"> <a class="nav-link active" data-bs-toggle="tab" href="#tab-3-1"> 공지 게시판</a> </li>
					<li class="nav-item"> <a class="nav-link" data-bs-toggle="tab" href="#tab-3-2"> 일반 게시판 </a> </li>
				</ul>
				<div class="tab-content">
					<div class="tab-pane show active" id="tab-3-1">
						<!-- All review table START -->
						<div class="card bg-transparent border">

							<!-- Card body START -->
							<div class="card-body pb-0">
								<!-- Table START -->
								<div class="table-responsive border-0">
									<table class="table table-dark-gray align-middle p-4 mb-0 table-hover" style="text-align: center;">
									<c:set value="${BBS202PagingVO.dataList }" var="BBS202List"/>
										<c:choose>
											<c:when test="${empty BBS202List }">
												<tr>
													<td>등록된 공지글이 없습니다</td>
												</tr>
											</c:when>
											<c:otherwise>
											<!-- Table head -->
										<thead>
											<tr>
												<th scope="col" class="col-1 rounded-start">번호</th> <!-- 폭 줄임 -->
												<th scope="col" class="col-3">제목</th> <!-- 폭 넓게 설정 -->
												<th scope="col" class="col-1">닉네임</th> <!-- 폭 줄임 -->
												<th scope="col" class="col-1">날짜</th> <!-- 폭 줄임 -->
												<th scope="col" class="col-1 rounded-end">조회수</th> <!-- 폭 줄임 -->
											</tr>
										</thead>
										
										<!-- Table body START -->
										<tbody>
											<c:forEach items="${BBS202List }" var="item" varStatus="status">
											<c:if test="${fn:length(BBS202List) - status.index >= 1 }"></c:if>
											<!-- Table row -->
											<tr>
												<!-- Table data -->
												<td style="width: 180px">${fn:length(BBS202List) - status.index }</td>
												<!-- Table data -->
								            <td style="width: 180px">
								                <h6 class="table-responsive-title mb-0" style="text-align: left;">
								                    <a style="margin-left: 45px;" href="/board/ent/detail.do?entNo=${item.entNo }&bbsNo=${item.bbsNo}">${item.bbsTtl}</a> 
								                </h6>
								            </td>
								            <td style="width: 180px">${item.bbsWriter}</td>
								            <td style="width: 180px"><fmt:formatDate value="${item.bbsRegDt}" pattern="yyyy-MM-dd"/></td>
								            <td style="width: 180px">${item.bbsInqCnt}</td>
											</tr>
											</c:forEach>
											</c:otherwise>
										</c:choose>
										</tbody>
										<!-- Table body END -->
									</table>
								</div>
								<!-- Table END -->
							</div>
							<!-- Card body END -->

							<!-- Card footer START -->
							<div class="card-footer bg-transparent">
								<form method="post" id="bbs202ListForm">
								<input type="hidden" id="bbs202ListPage" name="bbs202ListPage">
								<sec:csrfInput/>
								</form>
								<!-- Pagination START -->
								<div id="bbs202PagingArea" class="d-sm-flex justify-content-sm-between align-items-sm-center">
									<!-- Content -->
									<p class="mb-0 text-center text-sm-start"></p>
									<!-- Pagination -->
									${BBS202PagingVO.pagingHTML }
								</div>
								<!-- Pagination END -->
							</div>
							<!-- Card footer END -->
						</div>
						<!-- All review table END -->
					</div>
					
					<div class="tab-pane" id="tab-3-2">
						<!-- All review table START -->
						<div class="card bg-transparent border">

							<!-- Card body START -->
							<div class="card-body pb-0">
								<!-- Table START -->
								<div class="table-responsive border-0">
									<table class="table align-middle p-4 mb-0 table-hover" style="text-align: center;">
											<c:set value="${BBS201PagingVO.dataList }" var="BBS201List"/>
											<c:choose>
												<c:when test="${empty BBS201List }">
													<tr>
														<td>작성된 게시글이 없습니다 </td>
													</tr>
												</c:when>
											<c:otherwise>
										<!-- Table head -->
										<thead style="background-color: black; --bs-table-color: white;">
											<tr>
												<th scope="col" class="col-1 rounded-start">번호</th> <!-- 폭 줄임 -->
												<th scope="col" class="col-3">제목</th> <!-- 폭 넓게 설정 -->
												<th scope="col" class="col-1">닉네임</th> <!-- 폭 줄임 -->
												<th scope="col" class="col-1">날짜</th> <!-- 폭 줄임 -->
												<th scope="col" class="col-1 rounded-end">조회수</th> <!-- 폭 줄임 -->
											</tr>
										</thead>

										<!-- Table body START -->
										<tbody>
										<c:forEach items="${BBS201List}" var="item" varStatus="status">
										    <c:if test="${fn:length(BBS201List) - status.index >= 1}"> 
										        <tr>
										            <td>${fn:length(BBS201List) - status.index}</td> 
										            <td>
										                <h6 class="table-responsive-title mb-0" style="text-align: left;">
										                    <a style="margin-left: 45px;" href="/board/ent/detail.do?entNo=${item.entNo }&bbsNo=${item.bbsNo}">${item.bbsTtl}</a> 
										                </h6>
										            </td>
										            <td>${item.bbsWriter}</td>
										            <td><fmt:formatDate value="${item.bbsRegDt}" pattern="yyyy-MM-dd"/></td>
										            <td>${item.bbsInqCnt}</td>
										        </tr>
										    </c:if>
										</c:forEach>
											</c:otherwise>
										</c:choose>
										</tbody>
										<!-- Table body END -->
									</table>
								</div>
								<!-- Table END -->
							</div>
							<!-- Card body END -->

							<!-- Card footer START -->
							<div class="card-footer bg-transparent">
								<form method="post" id="bbs201ListForm">
								<input type="hidden" id="bbs201ListPage" name="bbs201ListPage">
								<sec:csrfInput/>
								</form>
								<!-- Pagination START -->
								<div id="bbs201PagingArea" class="d-sm-flex justify-content-sm-between align-items-sm-center">
									<!-- Content -->
									<p class="mb-0 text-center text-sm-start"></p>
									<!-- Pagination -->
									${BBS201PagingVO.pagingHTML }
								</div>
								<!-- Pagination END -->
							</div>
							<!-- Card footer END -->
						</div>
						<!-- All review table END -->
					</div>
				</div>
			</div>
		</div>
		
<script type="text/javascript">

$(function(){
	
	
	var bbs201PagingArea = $("#bbs201PagingArea");
	var bbs201ListForm = $("#bbs201ListForm");

	bbs201PagingArea.on("click", "a" , function(){
		e.preventDefault();
		var bbs201ListPagingNo = $(this).data("bbs201page");
		bbs201ListForm.find("#bbs201ListPage").val(bbs201ListPagingNo);
		bbs201ListForm.submit();
	});

	var bbs202PagingArea = $("#bbs202PagingArea");
	var bbs202ListForm = $("#bbs202ListForm");

	bbs202PagingArea.on("click", "a" , function(){
		e.preventDefault();
		var bbs202ListPagingNo = $(this).data("bbs202page");
		bbs202ListForm.find("#bbs202ListPage").val(bbs202ListPagingNo);
		bbs202ListForm.submit();
	});
	
	
});


</script>		