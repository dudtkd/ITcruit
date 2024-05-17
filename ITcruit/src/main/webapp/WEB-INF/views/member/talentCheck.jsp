<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>


<style>
.btn-success {
  background-color: gray;
  color: white;
  border : none;
}
.btn-success:hover {
  color: white !important;
  background-color: black !important;
  border-color: black !important;
  border : none;
}
.table.table-dark-gray thead th {
  color: black !important;
}

</style>

<!-- Page main content START -->
	<div class="page-content-wrapper border">

		<!-- Title -->
		<div class="row mb-3">
			<div class="col-12 d-sm-flex justify-content-between align-items-center">
				<h1 class="h5 mb-2 mb-sm-0">요청된 인재 제안 <span class="badge bg-secondary bg-opacity-10 text-black">${fn:length(talentAlarmList)}</span></h1>
			</div>
		</div>

		<!-- Card START -->
		<div class="card bg-transparent border">

			<!-- Card body START -->
			<div class="card-body">
				<!-- Course table START -->
				<div class="table-responsive border-0 rounded-3">
					<!-- Table START -->
					<table class="table table-dark-gray align-middle p-4 mb-0 table-hover">
						<!-- Table head -->
						<thead style="background-color: black;">
							<tr>
								<th scope="col" class="border-0 text-center rounded-start" style="text-align: center; color: white !important;">기업명</th>
								<th scope="col" class="border-0 text-center" style="color: white !important;">담당자 이름</th>
								<th scope="col" class="border-0 text-center" style="color: white !important;">담당자 연락처</th>
								<th scope="col" class="border-0 text-center" style="color: white !important;">직무</th>
								<th scope="col" class="border-0 text-center rounded-end" style="color: white !important;">확인여부</th>
							</tr>
						</thead>

						<!-- Table body START -->
						<tbody id="tbody">
							
							<c:choose>
								<c:when test="${empty talentAlarmList}">
									<tr>
										<td colspan="5">
											<div style="text-align: center;">요청받은 인재 제안 목록이 없습니다</div>
										</td>
									</tr>
								</c:when>
								<c:otherwise>
								
								<c:forEach items="${talentAlarmList}" var="list">
								
								
									<!-- Table row -->
									<tr>
										<!-- Table data -->
										<td class="text-center">
												<!-- Title -->
												<h6 class="table-responsive-title mb-0 ms-2">	
													<a href="#">${list.alarmSndr }</a>
												</h6>
										</td>
		
										<!-- Table data -->
										<td class="text-center">
												<!-- Info -->
												<div class="ms-2">
													<h6 class="mb-0 fw-light">${list.alarmSndr}_채용팀</h6>
												</div>
										</td>
		
										<!-- Table data -->
										<td class="text-center">
											${list.rprsTelno}
										</td>
		
										<!-- Table data -->
										<td class="text-center">${list.alarmTtl}</td>
		
										<!-- Table data -->
										<td class="text-center">
											<a href="#" class="btn btn-sm btn-success me-1 mb-1 mb-md-0 talentCheckFunction" style="margin-left: 4px;">확인</a>
<!-- 											<button class="btn btn-sm btn-danger mb-0">거절</button> -->
										</td>
									</tr>
									</c:forEach>
								</c:otherwise>
							</c:choose>

						</tbody>
						<!-- Table body END -->
					</table>
					<!-- Table END -->
				</div>
				<!-- Course table END -->
			</div>
			<!-- Card body END -->

			<!-- Card footer START -->
			<div class="card-footer bg-transparent pt-0">
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
			<!-- Card footer END -->
		</div>
		<!-- Card END -->
	</div>
	<!-- Page main content END -->
	
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
$(function(){
	
	$('#tbody').on('click', '.talentCheckFunction', function(event){
		event.preventDefault();
		console.log("확인");
		
		console.log($(this));
		$(this).text("확인완료");
	});
	
	
});
</script>