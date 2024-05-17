<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<!-- **************** MAIN CONTENT START **************** -->
<style>
/* 상세보기 css */

.mailbox-attachment-name,
.mailbox-attachment-size {
    text-decoration: underline;
}

.fa-download {
    color: gray;
    font-size: 20px; /* 아이콘의 크기를 원하는 픽셀로 조정합니다 */
    margin: 12px;
}

.mailbox-attachment-name {
    padding-left: 20px;
}

.count-date {
	padding-left: 30px;
}

.edit-del-Btn {
	text-align: right;
	margin-top: -20px;
}

.editBtn, .delBtn {
	color: black;
	background-color: #DCD8FC;
	border: none;
	width: 80px;
	height: 40px;
	border-radius: 5px;
	padding: 10px 5px 10px 5px;
}

/* 신고 */
.report-container {
	display: flex;
	flex-direction: column;
	align-items: flex-end;
	margin-top: -30px;
	padding-right: 10px;
}

.report-button {
	display: none;
	border: 1px solid rgb(194, 194, 194);
	padding: 5px 15px 5px 15px;
	background-color: white;
}

.content {
	padding: 50px;
	height: auto;
	font-size: 24px;
}

/* 댓글 */

  ul,
  li {
    list-style: none;
  }
  
  .comment {
    display: flex;
    flex-direction: column;
    flex-wrap: nowrap;
    padding: 30px;
    width: 800px;
    margin: 0 auto;
  }

  .comment-id {
    font-weight: bold;
  }
  
  .comment > li {
    margin-top: 20px;
  }
  .comment > li:nth-child(1) {
    margin: 0px;
  }
  
  .comment-row {
    display: flex;
    justify-content: space-between;
    flex-direction: row;
  }
  
  .comment-row {
    margin-top: 20px;
    width: 100%;
  }
  
  .comment-row > li:nth-child(2) {
    flex-shrink: 0;
    flex-grow: 1;
    padding-left: 25px;
    z-index: 1;
    width: 100%;
  }
  
  .comment-row > li:nth-child(2) {
    width: 85px;
  }
  
  .comment-form > form {
    display: flex;
    flex-direction: row;
    flex-wrap: wrap;
    justify-content: space-between;
  }
  
  .comment-form > form > h5 {
    width: 100%;
    margin: 14px 0 14px 0;
  }
  
  .comment-content {
    cursor: pointer;
    word-break: break-all;
    padding-right: 25px;
  }
  
  .ps_box {
    display: block;
    position: relative;
    width: 80%;
    height: 51px;
    border: solid 1px #dadada;
    padding: 10px 14px 10px 14px;
    background: #fff;
    box-sizing: border-box;
  }
  
  .ps_box > input {
    outline: none;
  }
  
  .int {
    display: block;
    position: relative;
    width: 100%;
    height: 29px;
    padding-right: 25px;
    line-height: 29px;
    border: none;
    background: #fff;
    font-size: 15px;
    box-sizing: border-box;
    z-index: 10;
  }
  
  .subBtn {
    width: 18%;
    height: 50px;
    /* padding: 18px 0 16px; */
    text-align: center;
    box-sizing: border-box;
    text-decoration: none;
    border: none;
    background: #FFE8FF;
    color: black;
    font-size: 14px;
  }
  
  .comment-delete-btn {
    display: inline-block;
    margin-left: 7px;
    cursor: pointer;
  }
  
  .comment-update-input {
    border: none;
    border-bottom: 1px solid #333;
    font-size: 16px;
    color: #666;
    outline: none;
  }
  
  .listBtn{
	float: right;
	color: black;
	background-color: #DCD8FC;
	border: none;
	width: 80px;
	height: 40px;
	border-radius: 5px;
	padding: 10px 5px 10px 5px;
	margin-right: 15px;
}

/* 댓글 */
.commentFrm{
	width: 100%;
	margin: 30px 200px 50px;
}

.commentContent{
  font-size: 15px;
  width: 700px;
  height: 40px;
  border: 1px solid lightgray;
}

.commentSubBtn{
  border: 1px solid lightgray;
  padding: 8px 13px 8px 13px;
}

.commentList{
  /* border: 1px solid lightgray; */
  margin: 10px 110px 50px 150px;
}

.commentContentA{
  padding: 0px 0px 20px 20px;
}

.declarationBtn{
  border: none;
  background-color: white;
  color: gray;
  margin-bottom: 20px;
  font-size: 13px;
}

.commentEditDelBtn{
  float: right;
}

.commtentEditBtn,
.commtentDelBtn{
  border: none;
  padding: 3px 7px 3px 7px;
  background-color: white;
  color: gray;
}

.commentEditContainer {
    display: flex;
    align-items: center;
}

.commentEditForm {
    flex: 1;
    margin-right: 10px;
}

.commentEditButton {
    flex-shrink: 0; /* 버튼이 필요한 공간 이상으로 크기를 줄이지 않도록 함 */
}

.commentEditInput {
    width: 550px; 
}

.updateCommentBtn{
	float: right;
	border: none;
}
  
</style>

<main>

<!-- =======================Page content START -->
<section class="pt-0">
	
	<div class="container">
		<div class="row">
			<!-- Main content START -->
			<div class="col-sm">
				<div class="card bg-transparent border rounded-3">
					
				<!-- Main content START -->

					<!-- Card START -->
					<div class="card border bg-transparent rounded-3">
						<!-- Card header START -->
						<div class="card-header bg-transparent border-bottom">
							<h3 class="mb-0" style="padding:30px;">${boardVO.bbsTtl }</h3>
							<div class="count-date">
								<span style="font-weight: bold;">${boardVO.bbsWriter }</span> &nbsp; │ &nbsp; <i class="bi bi-eye"></i> ${boardVO.bbsInqCnt } &nbsp; │ &nbsp; <span><fmt:formatDate value="${boardVO.bbsRegDt }" pattern="yyyy-MM-dd" /></span>
							</div>
							
							<!-- 로그인 안했을 때 -->
							<c:if test="${empty SessionInfo }">
							<div></div>
							</c:if>

							<c:if test="${!empty SessionInfo }">
							    <c:if test="${sessionScope.SessionInfo.accountId eq boardVO.accountId }">
							        <!-- 신고 버튼(다른사람이 쓴 글) -->
							        <div class="edit-del-Btn">
							            <input type="button" class="editBtn" id="updateBtn" value="수정"> 
							            <input type="button" class="delBtn" id="deleteBtn" value="삭제">
							        </div>
							    </c:if>
							</c:if>


						</div>
						<!-- Card header END -->
						
						<div class="card-footer bg-white">
							<c:if test="${not empty boardVO.atchFileList }">
							
								<c:forEach items="${boardVO.atchFileList }" var="atchFile">
									<div class="mailbox-attachment-info">
										<a href="#" class="mailbox-attachment-name"> 
											<i class="fas fa-paperclip"></i> ${atchFile.fileName }
										</a> 
										<span class="mailbox-attachment-size clearfix mt-1"> 
											<span>${atchFile.fileFancysize }</span>
											<c:url value="/freeBoard/download.do?${_csrf.parameterName}=${_csrf.token}" var="downloadURL">
												<c:param name="fileNo" value="${atchFile.fileNo }"/>
												<c:param name="fileSrcNo" value="${atchFile.fileSrcNo }"/>
												<c:param name="orgnCmmncd" value="${atchFile.orgnCmmncd }"/>
											</c:url> 
											<a href="${downloadURL }"> 
												<span class="downloadIcon"> 
													<i class="fas fa-download"></i>
												</span>
											</a>
										</span>
									</div>
								</c:forEach>
							</c:if>
						</div>
						
						<div class="content">${boardVO.bbsCn }</div>
						
						<hr>
						<div>
							<input type="button" class="listBtn" id="listBtn" value="목록">
						</div>
						
						<!-- 댓글 시작 -->
					<div>
						<form class="commentFrm" action="/board/ent/comment/insert.do" method="post">
							<h5>댓글</h5>
							<input type="hidden" name="entNo" value="${entNo}" />
							<input type="hidden" name="bbsNo" id="bbsNo" value="${boardVO.bbsNo }"/>
							<input type="text" placeholder=" 댓글 내용을 입력해주세요." id="bssCmntCn" class="commentContent" name="bssCmntCn" />
							<input type="submit" class="commentSubBtn" id="commentSubBtn" value="등록" />
							<sec:csrfInput/>
						</form>
						
						<c:choose>
							<c:when test="${empty bcvo }">
								<div>
								</div>
							</c:when>
							<c:otherwise>
								<form action="/board/ent/comment/delete.do" id="editdelComment" method="post">
									<input type="hidden" name="entNo" id="entNo" value="${entNo}" />
									<input type="hidden" name="bbsNo" id="bbsNo"/>
									<input type="hidden" name="bssCmntNo" id="bssCmntNo"/>
									<sec:csrfInput/>
								</form>
								<c:forEach items="${bcvo }" var="comment">
									<div class="commentList">
										<div class="commentListA">
											<div class="commentEditDelBtn">
												<button class="commtentEditBtn" data-bbsno="${comment.bbsNo }" data-cmnno="${comment.bssCmntNo }">수정</button>
												<button class="commtentDelBtn" data-bbsno="${comment.bbsNo }" data-cmnno="${comment.bssCmntNo }">삭제</button>
											</div>
											<input type="hidden" name="bbsNo" value="${comment.bbsNo }"/>
											<input type="hidden" name="bssCmntNo" value="${comment.bssCmntNo }"/>
											<p style="font-size: 16px; font-weight: bolder;">${comment.bssCmntWriter }</p>
											<div class="commentContentA"> 
												${comment.bssCmntCn }
											</div>
											



											<span style="font-size: 13px;">${comment.bssCmntTm }</span> │ 
											<input type="button" class="declarationBtn" value="신고">
										</div>
										<hr>
									</div>
								</c:forEach>
								<sec:csrfInput/>
							</c:otherwise>
						</c:choose>
						
					</div>
					<!-- 댓글 끝 -->
					
					</div>
					
					<form action="/board/ent/delete.do" id="editdelForm" method="post">
					    <input type="hidden" name="entNo" value="${entNo}" />
					    <input type="hidden" name="bbsNo" value="${boardVO.bbsNo}" />
					    <sec:csrfInput/>
					</form>

					</div>
					<!-- Card body START -->
				</div>
			</div>
			<!-- Main content END -->
		</div> 
	</div>	
</section>
<!-- =======================Page content END -->
</main>
<!-- **************** MAIN CONTENT END **************** -->

<script type="text/javascript">
$(function(){
	var editdelForm = $("#editdelForm");
	var updateBtn = $("#updateBtn");
	var deleteBtn = $("#deleteBtn");
	var listBtn = $("#listBtn");
	var commentSubBtn = $("#commentSubBtn");
	var editdelComment = $("#editdelComment");
	var commtentDelBtn = $(".commtentDelBtn");
	
	updateBtn.on("click", function(){
		console.log("버튼이 클릭되었습니다.");
		editdelForm.attr("method", "get");
		editdelForm.attr("action", "/board/ent/update");
		editdelForm.submit();
	});
	
	deleteBtn.on("click", function(){
		if(confirm("정말로 삭제하시겠습니까?")){
			editdelForm.submit();
		}
	});
	
	listBtn.on("click", function(){
		location.href="/board/ent/list.do?entNo=${entNo}";
	})
	
	commtentDelBtn.on("click", function(){
// 		var bssCmntNo = $(this).siblings("input[name='bssCmntNo']").val();
// 	    alert(bssCmntNo);
		var bbsnNo = $(this).data("bbsno");
		var cmnNo = $(this).data("cmnno");
		if(confirm("정말로 삭제하시겠습니까?")){
			editdelComment.find("#bbsNo").val(bbsnNo);
			editdelComment.find("#bssCmntNo").val(cmnNo);
			editdelComment.submit(); // 폼 제출
		}
	});
	$(document).on("click", ".commtentEditBtn", function() {
	    if ($(".commentEditInput").length > 0) {
	        // 이미 수정 중인 경우 다른 작업을 막음
	        alert("수정 중인 댓글이 있습니다. 수정을 완료하십시오.");
	        return;
	    }

	    var commentContainer = $(this).closest('.commentListA');
	    var commentContent = commentContainer.find('.commentContentA');
	    var commentText = commentContent.text().trim(); // 기존 댓글 내용 가져오기

	    var bbsNo = $(this).data("bbsno");
	    var cmnNo = $(this).data("cmnno");
	    
	  
	    // 댓글 내용을 수정할 수 있는 입력 필드로 변경
	    var commentInputField = $('<input type="text" name="bssCmntCn" class="commentEditInput" value="' + commentText + '">');
	    commentContent.html(commentInputField);

	    // 수정 완료 버튼 추가
// 	    var updateButton = $('<button class="updateCommentBtn" data-bbsno= bbsNo data-cmnno=cmnNo>완료</button>');
	    var updateButton = $('<button class="updateCommentBtn" data-bbsno="' + bbsNo + '" data-cmnno="' + cmnNo + '">완료</button>');

	    commentContainer.append(updateButton);
	});

	$(document).on("click", ".updateCommentBtn", function() {
	    var bbsNo = $(this).data("bbsno");
	    var cmnNo = $(this).data("cmnno");
	    var updatedCommentContent = $(this).closest('.commentListA').find('.commentEditInput').val().trim();

	    // AJAX를 사용하여 요청 보내기
	    $.ajax({
	        url: "/board/comment/update.do",
	        type: "POST",
	        data: {
	            bbsNo: bbsNo,
	            bssCmntNo: cmnNo,
	            bssCmntCn: updatedCommentContent
	        },
	        beforeSend: function(xhr) {
	            xhr.setRequestHeader('X-CSRF-TOKEN', $('meta[name="_csrf"]').attr('content'));
	        },
	        success: function(response) {
	            // 성공적으로 요청이 처리된 경우 처리할 내용
	            console.log(response);
	            window.location.href = "/board/ent/detail.do?entNo=${entNo}&bbsNo=${boardCommentVO.bbsNo}"; // 대상 페이지로 이동
	        },
	        error: function(xhr, status, error) {
	            // 요청이 실패한 경우 처리할 내용
	            console.error(xhr.responseText);
	        }
	    });
	});
});
</script>

