<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>

<style>
/* 목록 페이징 버튼 */

.pagination-primary-soft .page-link {
  font-size: 12px; /* 페이지네이션 링크의 폰트 크기 조절 */
  padding: 8px 10px; /* 페이지네이션 버튼의 패딩을 조절하여 크기 조절 */
  color: black; /* 페이지네이션 링크 텍스트 색상 */
  background-color: #DCD8FC; /* 페이지네이션 배경 색상 */
  border-color: #DCD8FC; /* 페이지네이션 테두리 색상 */
}

.pagination-primary-soft .page-item.active .page-link {
  color: black;
  background-color: #baabfc; /* 활성화된 페이지네이션 배경 색상 */
  border-color: #DCD8FC; /* 활성화된 페이지네이션 테두리 색상 */
}

.pagination-primary-soft .page-item.disabled .page-link {
  color: black; /* 비활성화된 페이지네이션 링크 텍스트 색상 */
  pointer-events: none; /* 비활성화된 페이지네이션 클릭 이벤트 방지 */
}

.pagination-primary-soft .page-item.disabled .page-link:hover {
  background-color: #fdfdfd; /* 비활성화된 페이지네이션 호버 배경 색상 */
  border-color: #ffffff; /* 비활성화된 페이지네이션 호버 테두리 색상 */
}

.pagination-primary-soft .page-item:hover .page-link {
  background-color: #DCD8FC; /* 호버시 배경색 없애기 */
  border-color: #DCD8FC; /* 호버시 테두리 색상 */
}

.btn-info-soft:active, .btn-info-soft:hover {
  color: white !important;
  background-color: black !important;
  border-color: black !important;
}
</style>

<!-- Page main content START -->
<div class="page-content-wrapper border">

<div class="row" style="display: flex; justify-content: space-between; align-items: center;">
    <div class="col">
        <h1 class="h5 mb-3">문의게시판</h1>
    </div>
    <div class="col-auto">
        <button type="button" class="btn btn-sm btn-info-soft" style="background-color: gray; color: white;" onclick="location.href='/inquiry/form'">문의 등록</button>
    </div>
</div>
		

	<!-- Card START -->
	<div class="card bg-transparent">

		<!-- Card header START -->
		<div class=" bg-transparent border-bottom px-0">
			<!-- Search and select START -->
			<div class="row g-3 align-items-center justify-content-between"></div>
			<!-- Search and select END -->
			<form method="post" id="searchForm">
				<input type="hidden" name="page" id="page"/>
			</form>
		</div>

		<div class="card-body px-0">
			<div class="table-responsive border-0">
				<table class="table align-middle p-4 mb-0 table-hover text-center">
					<thead>
						<tr style="background-color: black;">
							<th scope="col" class="border-0 rounded-start" style="color: white;">문의번호</th>
							<th scope="col" class="border-0" style="color: white;">제목</th>
							<th scope="col" class="border-0" style="color: white;">작성일</th>
							<th scope="col" class="border-0 rounded-end" style="color: white;">답변상태</th>
						</tr>

					</thead>

					<tbody>
						<c:set value="${pagingVO.dataList }" var="list" />
						<c:choose>
							<c:when test="${empty list}">
								<tr>
									<td colspan="6">문의글이 없습니다</td>
								</tr>
							</c:when>
							<c:otherwise>
								<c:set var="countNotReplied" value="0" />
								<c:forEach items="${list}" var="inquiryList" varStatus="status">
									<tr>
										<td>${status.index + 1}</td>
										<td> <a href="#" class="view-inquiry" data-bbsno="${inquiryList.bbsNo}" data-bs-toggle="modal" data-bs-target="#viewReview" style="color: gray; text-decoration: none;" onmouseover="this.style.color='#3399FF';" onmouseout="this.style.color='gray';"> ${inquiryList.bbsTtl} </a></td>
										<td><fmt:formatDate value="${inquiryList.bbsRegDt}" pattern="yyyy-MM-dd" /></td>
										<td>
											<c:choose>
												<c:when test="${inquiryList.replyYn eq '답변'}">
													<span style="color: green;">${inquiryList.replyYn}완료</span>
												</c:when>
												<c:otherwise>
													<span style="color: red;">${inquiryList.replyYn}</span>
												</c:otherwise>
											</c:choose>
										</td>
									</tr>
								</c:forEach>
							</c:otherwise>
						</c:choose>
					</tbody>
				</table>
			</div>
		</div>
	</div>

	<!-- Pagination START -->
	<div class="card-footer bg-transparent p-0">
		<!-- Pagination START -->
		<div class="d-sm-flex justify-content-sm-between align-items-sm-center">
			<!-- Content -->
			<p class="mb-0 text-center text-sm-start"></p>
			<!-- Pagination -->
			<div class="card-footer clearfix" id="pagingArea">
			${pagingVO.pagingHTML }
			</div>
		</div>
	</div>
</div>

<!-- **************** MAIN CONTENT END **************** -->

<!-- Back to top -->
<div class="back-top">
	<i class="bi bi-arrow-up-short position-absolute top-50 start-50 translate-middle"></i>
</div>

<!-- Popup modal for review START -->
<div class="modal fade" id="viewReview" tabindex="-1" aria-labelledby="viewReviewLabel" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered">
		<div class="modal-content">
			<!-- Modal header -->
			<div class="modal-header bg-purple">
				<h5 class="modal-title text-white" id="viewReviewLabel">문의글</h5>
				<button type="button" class="btn btn-sm btn-light mb-0" data-bs-dismiss="modal" aria-label="Close">
					<i class="bi bi-x-lg"></i>
				</button>
			</div>
			<!-- Modal body -->
				<div class="modal-body" style="width: 100%;">
					<div class="d-md-flex">
						<!-- Text -->
						<div>
							<h5 class="modal-title" id="modalTitle" style="width: 480px;"></h5>
							<input type="hidden" name="bbsNo" id="bbsNo"> <br>

							<p id="modalImg"></p>

							<p id="modalContent"></p>
							
							<hr>
							<div class="form-floating">
							<h5>답변 내용</h5>
							<p id="modalAnswer">답변내용 </p>
							</div>
						</div>
					</div>
				</div>
		</div>
	</div>
</div>
<!-- Popup modal for review END -->

<script type="text/javascript">

$(function(){
	
	var searchForm = $("#searchForm");
	var pagingArea = $("#pagingArea");
	
	pagingArea.on("click", "a", function(event){
		event.preventDefault();
		var pageNo = $(this).data("page");
		console.log(pageNo)
		searchForm.find("#page").val(pageNo);
		searchForm.submit();
	});
	
	
	
	
	
	
	
});

	$(document).on("click", ".view-inquiry", function() {
		var bbsNo = $(this).data("bbsno");
// 		var bbsTitle = $(this).data("bbstitle");
// 		var bbsContent = $(this).data("bbscontent");
	
		$.ajax({
			url: "/myPage/admin/inquiryDetail",
			type: "GET",
			contentType: "application/json; charset=utf-8",
			data: {
				bbsNo : bbsNo,
			},
			beforeSend: function(xhr) {
		        xhr.setRequestHeader('X-CSRF-TOKEN', $('meta[name="_csrf"]').attr('content'));
		    },
		    success : function(res){
		        $('#bbsNo').val(bbsNo); 
		        $('#modalTitle').text(res.bbsTtl); 
		        $('#modalContent').html(res.bbsCn); 
		        
		        if(res.bssCmntCn != null && res.bssCmntCn != ""){
		        	$('#modalAnswer').text(res.bssCmntCn);
		        }else{
		        	$('#modalAnswer').text("답변이 등록되지 않았습니다");
		        }
		        
		        var contentImg = "";
		        var contextPath = '<%= request.getContextPath() %>'; 

		        for (var i = 0; i < res.bbsAtchFileList.length; i++) {
		        	 var fileNo = res.bbsAtchFileList[i].fileNo;
// 		        	 var fileName = filePath.substring(filePath.indexOf("\\resources\\") + 1);
		        	 contentImg += '<img src="/freeBoard/download.do?fileNo=' + fileNo + '" />';
	            }
		       
		       $("#modalImg").html(contentImg);
		        console.log(res);
		        console.log(res.bssCmntCn);
		        console.log(fileName);
		        console.log(res.bbsAtchFileList);
		    },

			error: function(xhr, status, error) {
	            console.error("Error:", error);
	        }
		})
		
	})
</script>
