<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<main>

<!-- =======================Page content START -->
<section class="pt-0">
	<div class="container">
		<div class="row">

<!-- 			<!-- Left sidebar START --> 
<!-- 			<div class="col-xl-3" style="max-width: 300px;"> -->

<!-- 				Responsive offcanvas body START -->
<!-- 				<div class="offcanvas-xl offcanvas-end" tabindex="-1" id="offcanvasSidebar"> -->
<!-- 					Offcanvas header -->
<!-- 					<div class="offcanvas-header bg-light"> -->
<!-- 						<h5 class="offcanvas-title" id="offcanvasNavbarLabel">My profile</h5> -->
<!-- 						<button  type="button" class="btn-close" data-bs-dismiss="offcanvas" data-bs-target="#offcanvasSidebar" aria-label="Close"></button> -->
<!-- 					</div> -->
<!-- 					Offcanvas body -->
<!-- 					<div class="offcanvas-body p-3 p-xl-0"> -->
<!-- 						<div class="borde rounded-3 pb-2 p-3 w-100" style="background-color: white; margin-left: 30px; margin-top: -15px;"> -->
<!-- 							Dashboard menu -->
<!-- 							<div class="list-group list-group-dark list-group-borderless"> -->
<!-- 								<a href="/freeBoard/insert" class="write-post-Btn"> -->
<!-- 									<button type="button"><i class="bi bi-pencil"></i> 글 작성하기</button> -->
<!-- 								</a> -->
<!-- 								인기글 -->
<!-- 								<div class="popular-list"> -->
<!-- 									<div class="popular-list-title"> -->
<!-- 										<i class="bi bi-fire"></i> 인기글 -->
<!-- 									</div> -->
<!-- 									<div class="popular-list-list"> -->
<!-- 										<a href="">Lorem Ipsum is sim...</a>     -->
<!-- 										<a href="">Lorem Ipsum is sim...</a>     -->
<!-- 										<a href="">Lorem Ipsum is sim...</a>     -->
<!-- 										<a href="">Lorem Ipsum is sim...</a>     -->
<!-- 										<a href="">Lorem Ipsum is sim...</a>     -->
<!-- 									</div> -->
<!-- 								</div> -->
<!-- 								인기글 -->
<!-- 								<div class="popular-list"> -->
<!-- 									<div class="popular-list-title"> -->
<!-- 										<i class="bi bi-eye"></i> 최근 본 글 -->
<!-- 									</div> -->
<!-- 									<div class="popular-list-list"> -->
<!-- 										<a href="">Lorem Ipsum is sim...</a>     -->
<!-- 										<a href="">Lorem Ipsum is sim...</a>     -->
<!-- 										<a href="">Lorem Ipsum is sim...</a>     -->
<!-- 										<a href="">Lorem Ipsum is sim...</a>     -->
<!-- 										<a href="">Lorem Ipsum is sim...</a>  -->
<!-- 									</div> -->
<!-- 								</div> -->
<!-- 							</div> -->
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 				</div> -->
<!-- 				Responsive offcanvas body END -->
<!-- 			</div> -->
			<!-- Left sidebar END -->
			
			<!-- Main content START -->
			<div class="col-12">
		
				<!-- Card START -->
				<div class="card border bg-transparent rounded-3">
					<!-- Card header START -->
					<form id="insertForm" method="post" action="/freeBoard/insert.do" enctype="multipart/form-data">
						<c:if test="${status eq 'update' }">
							<input type="hidden" name="bbsNo" value="${boardVO.bbsNo }"/>
						</c:if>
						<input type="text" id="title" class="postForm-title" name="bbsTtl" value="${boardVO.bbsTtl }" placeholder="제목을 입력해주세요" required><br><br>
						<textarea class="content" id="content" name="bbsCn" required>${boardVO.bbsCn }</textarea><br><br>
						
						<c:if test="${status eq 'update' }">
							<c:if test="${not empty boardVO.atchFileList }">
								<div class="card-footer bg-white">
									<ul class="mailbox-attachments d-flex align-items-stretch clearfix">
										<c:forEach items="${boardVO.atchFileList }" var="atchFile">
											<li>
												<div class="mailbox-attachment-info">
													<a href="#" class="mailbox-attachment-name">
														<i class="fas fa-paperclip"></i> ${atchFile.fileName }
													</a> 
													<span class="mailbox-attachment-size clearfix mt-1"> 
														<span>${atchFile.fileFancysize }</span> 
														<span class="btn btn-default btn-sm float-right attachmentFileDel"
															id="span_${atchFile.fileNo }">
															<i class="fas fa-times"></i>
														</span>
													</span>
												</div>
											</li>
										</c:forEach>
									</ul>
								</div>
							</c:if>
						</c:if>
						
						<div class="form-group" style="border: 1px solid lightgray; margin:30px; margin-top:-10px;">
							<div class="custom-file" >
								<input type="file" class="custom-file-input" id="boFile" name="boFile" multiple="multiple" style="height:50px; padding:12px"> 
									<label class="custom-file-label" for="customFile">파일을 선택해주세요</label>
							</div>
						</div>
						
						 <div class="button-container">
						 <c:set value="등록" var="Btn"/>
						 <c:if test="${status eq 'update' }">
						 	<c:set value="수정" var="Btn"/>
						 </c:if>
					        <button class="cancelBtn" type="button">취소</button>
					        <button class="submitBtn" type="submit">${Btn }</button>
					    </div>
					    <sec:csrfInput/>
					</form>

					
				</div>
			</div>
			<!-- Main content END -->
		</div><!-- Row END -->
	</div>
</section>
<!-- =======================Page content END -->

</main>

<script type="text/javascript">

	
$(function(){
	//CKEDITOR
	CKEDITOR.replace("content", {
		filebrowserUploadUrl: '/imageUpload.do?${_csrf.parameterName}=${_csrf.token}',
		height: "400px"
	});
	
	var insertForm = $("#insertForm");
	var cancelBtn = $(".cancelBtn");
	var submitBtn = $(".submitBtn");
	
	cancelBtn.on("click", function(){
		location.href = "/freeBoard/list.do"; 
	});
	
	submitBtn.on("click", function(){
		var title = $("#title").val();
		var content = CKEDITOR.instances.content.getData();
		
		if(title == null || title == ""){
			alert("제목을 입력해주세요!");
			$("#title").focus();
			return false;
		}
		
		if(content == null || content == ""){
			alert("내용을 입력해주세요!");
			$("#content").focus();
			return false;
		}
		
		//val() xx >> text();
		// val() input타입일때
		if($(this).text() == "수정"){
// 			alert($(this).text());
			insertForm.attr("action", "/freeBoard/update.do")
		}
		insertForm.submit();
	});
	
	$(".attachmentFileDel").on("click", function(){
		var id = $(this).prop("id");
		var idx = id.indexOf("_");
		var fileNo = id.substring(idx + 1);
		var ptrn = "<input type='hidden' name='delBoardNo' value='%V'/>";
		insertForm.append(ptrn.replace("%V", fileNo));
		$(this).parents("li:first").hide();
	});
	
	
});

</script>

<style>

/* 목록 */
.title-header {
  text-align: center;
}

.center-header {
  text-align: center;
}

.title-cell {
  width: 500px;
}

.center-cell {
  text-align: center;
}

/* 입력폼 */
.postForm{
    padding: 30px;
    text-align: right;
}

.postForm-title{
    border: none;
    width: 100%;
    height: 50px;
    font-size: 30px;
    margin-top: 30px;
    padding-left: 20px;
}

input[type="text"], textarea {
    outline: none; 클릭 시 테두리 제거
    border: 1px solid white; 기본적인 테두리 설정
    padding: 8px;
/*     margin-bottom: 10px; */
}

input[type="text"]:focus, textarea:focus {
    border-color: #ffffff; 클릭 시 테두리 색상 변경
}

.submitBtn, 
.cancelBtn{
    color: black;
    background-color: #DCD8FC;
    border: none;
    padding: 10px 20px 10px 20px;
    border-radius: 10px;
    margin-bottom: 30px; 
    
}
.button-container {
    text-align: right;
    margin-right: 20px;
}



</style>

