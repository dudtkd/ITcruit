<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
 <%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!-- **************** MAIN CONTENT START **************** -->
<main>
    <!-- =======================
Main part START -->
   <section>
<c:set value="등록하기" var="name"/>
	<c:if test="${status eq 'u' }">
		<c:set value="수정하기" var="name"/>
	</c:if>
       <div class="container">
           <div class="row g-5 justify-content-between">
               <!-- Admission form START -->
               <div class="col-md-8 mx-auto">
                   <!-- Title -->
                   <span style="color: blueviolet; font-size: 20px; font-weight: bolder;">IT
                           CRUIT</span> <span style="color: black; font-weight: bolder;">기업 리뷰 작성</span>
                   <br><br>
                   <div style="text-align: center;">
                       <img src="/main/logodisplay?entNo=${entVO.entNo}" alt="기업 로고"
												        style="width: 85%; height: 150px; object-fit: contain;">
                   </div>
                   <br>
                   <h2 class="mb-3" style="text-align: center;">${entVO.entNm }</h2>
                   <br>
                   <!-- Form START -->
                   <form class="row g-3" action="/ent/entReviewInsert.do" name="reviewForm" method="post">
                       <input type="hidden" name="entNo" value="${entVO.entNo }">
                       <!-- Basic information START -->
                       <div class="row g-4">
                           <!-- Course title -->
                           <div class="col-12">
                               <label class="form-label h5" style="color: black;">근무상태</label>
                               <select class="form-select js-choice border-0 z-index-9 bg-transparent"
                                   aria-label=".form-select-sm" data-search-enabled="false"
                                   data-remove-item-button="true" name="workStts" id="workStts">
                                   <option value="">전직자/현직자</option>
                                   <option value="현직자">현직자</option>
                                   <option value="전직자/2023년 퇴사">전직자/2023년 퇴사</option>
                                   <option value="전직자/2022년 퇴사">전직자/2022년 퇴사</option>
                                   <option value="전직자/2021년 퇴사">전직자/2021년 퇴사</option>
                                   <option value="전직자/2020년전 퇴사">전직자/2020년전 퇴사</option>
                               </select>
                           </div>

                           <div class="col-12">
                               <label class="form-label h5" style="color: black;">고용형태</label>
                               <select class="form-select js-choice border-0 z-index-9 bg-transparent"
                                   aria-label=".form-select-sm" data-search-enabled="false"
                                   data-remove-item-button="true" name="hireCmmncd" id="hireCmmncd">
                                   <option value="">선택해 주세요</option>
                                   <option value="정규직">정규직</option>
                                   <option value="계약직">계약직</option>
                                   <option value="인턴직">인턴직</option>
                                   <option value="아르바이트">아르바이트</option>
                                   <option value="프리랜서">프리랜서</option>
                               </select>
                           </div>

                           <!-- Course category -->
                           <div class="col-md-6">
                               <label class="form-label h5" style="color: black;">직종</label>
                               <select class="form-select js-choice border-0 z-index-9 bg-transparent"
                                   aria-label=".form-select-sm" data-search-enabled="true" name="pstnCmmncd" id="pstnCmmncd">
                                   <option value="">직무</option>
									<option value="서버">서버</option>
									<option value="프론트엔드">프론트엔드</option>
									<option value="백엔드">백엔드</option>
									<option value="응용소프트웨어 ">응용소프트웨어</option>
									<option value="시스템소프트웨어">시스템소프트웨어</option>
									<option value="앱개발자">앱개발자</option>
									<option value="크로스플랫폼 앱개발자">크로스플랫폼 앱개발자</option>
									<option value="게임 개발자">게임 개발자</option>
									<option value="DBA">DBA</option>
									<option value="빅데이터 엔지니어">빅데이터 엔지니어</option>
									<option value="인공지능/머신러닝">인공지능/머신러닝</option>
									<option value="devops/시스템	엔지니어">devops/시스템	엔지니어</option>
									<option value="HW/임베디드">HW/임베디드</option>
									<option value="블록체인">블록체인</option>
									<option value="PM">PM</option>
                               </select>
                           </div>

                           <div class="col-12">
                               <label class="form-label h5" style="color: black;">기업 총 평점</label>
                               <!-- Rating star -->
                               <ul class="list-inline mb-0 ratingStars" data-id="tscr">
                                   <li class="list-inline-item me-0 small"><i class="far fa-star text-warning" style="font-size: 30px;"></i></li>
                                   <li class="list-inline-item me-0 small"><i class="far fa-star text-warning" style="font-size: 30px;"></i></li>
                                   <li class="list-inline-item me-0 small"><i class="far fa-star text-warning" style="font-size: 30px;"></i></li>
                                   <li class="list-inline-item me-0 small"><i class="far fa-star text-warning" style="font-size: 30px;"></i></li>
                                   <li class="list-inline-item me-0 small"><i class="far fa-star text-warning" style="font-size: 30px;"></i></li>
                               </ul>
                                   <input type="hidden" name="entScrTscr" id="tscr" value="0"/>
                           </div>
                           <!-- Short description -->
                           <div class="col-12">
                               <h5>기업 한 줄 평</h5>
                               <label class="form-label">근무 환경에 대한 총평을 한 줄로 남겨주세요</label> 
                               <span style="margin-left: 300px;" id="entScrEvlLength">0자</span><span>/100자</span>
                               
                               <input type="text" class="form-control" rows="2"
                                   placeholder="기업에 대해 작성해 주세요" name="entScrEvl" id="entScrEvl" maxlength="100"/>
                           </div>

                           <!-- Short description -->
                           <div class="col-12">
                               <h5>기업의 장점</h5>
                               <label class="form-label">이 기업을 다니며 좋았던 점을 남겨주세요</label>
                               <textarea class="form-control" rows="5" style="resize: none;"
                                   placeholder="만족스러운 점을 작성해 주세요" name="entScrAdvantage" id="entScrAdvantage"></textarea>
                           </div>

                           <!-- Short description -->
                           <div class="col-12">
                               <h5>기업의 단점</h5>
                               <label class="form-label">기업의 단점을 객관적인 시각에서 적어주세요</label>
                               <textarea class="form-control" rows="5" style="resize: none;"
                                   placeholder="아쉬운 점을 작성해 주세요" name="entScrWeakness" id="entScrWeakness"></textarea>
                           </div>

                           <!-- Short description -->
                           <div class="col-12">
                               <h5>경영진에 바라는 점</h5>
                               <label class="form-label">더 나은 기업이 될 수 있도록 조언해 주세요</label>
                               <textarea class="form-control" rows="5" style="resize: none;"
                                   placeholder="바라는 점을 작성해 주세요" name="entScrWish" id="entScrWish"></textarea>
                           </div>

                           <div class="col-12">
                               <label class="form-label h5" style="color: black;">승진 기회 및 가능성&emsp;&emsp;</label>
                               <!-- Rating star -->
                               <ul class="list-inline mb-0 ratingStars" data-id="promotion">
                                   <li class="list-inline-item me-0 small"><i class="far fa-star text-warning" style="font-size: 30px;"></i></li>
                                   <li class="list-inline-item me-0 small"><i class="far fa-star text-warning" style="font-size: 30px;"></i></li>
                                   <li class="list-inline-item me-0 small"><i class="far fa-star text-warning" style="font-size: 30px;"></i></li>
                                   <li class="list-inline-item me-0 small"><i class="far fa-star text-warning" style="font-size: 30px;"></i></li>
                                   <li class="list-inline-item me-0 small"><i class="far fa-star text-warning" style="font-size: 30px;"></i></li>
                               </ul>
                                   <input type="hidden" name="entScrPromotion" id="promotion" value="0">
                           </div>
                           
                           <div class="col-12">
                               <label class="form-label h5" style="color: black;">복지 및 급여&nbsp;&emsp;&emsp;&emsp;&emsp;&emsp;</label>
                               <!-- Rating star -->
                               <ul class="list-inline mb-0 ratingStars" data-id="welfare">
                                   <li class="list-inline-item me-0 small"><i class="far fa-star text-warning" style="font-size: 30px;"></i></li>
                                   <li class="list-inline-item me-0 small"><i class="far fa-star text-warning" style="font-size: 30px;"></i></li>
                                   <li class="list-inline-item me-0 small"><i class="far fa-star text-warning" style="font-size: 30px;"></i></li>
                                   <li class="list-inline-item me-0 small"><i class="far fa-star text-warning" style="font-size: 30px;"></i></li>
                                   <li class="list-inline-item me-0 small"><i class="far fa-star text-warning" style="font-size: 30px;"></i></li>
                               </ul>
                                   <input type="hidden" name="entScrWelfare" id="welfare" value="0">
                           </div>
                           
                           <div class="col-12">
                               <label class="form-label h5" style="color: black;">업무와 삶의 균형&emsp;&nbsp;&emsp;&emsp;</label>
                               <!-- Rating star -->
                               <ul class="list-inline mb-0 ratingStars" data-id="wnl">
                                   <li class="list-inline-item me-0 small"><i class="far fa-star text-warning" style="font-size: 30px;"></i></li>
                                   <li class="list-inline-item me-0 small"><i class="far fa-star text-warning" style="font-size: 30px;"></i></li>
                                   <li class="list-inline-item me-0 small"><i class="far fa-star text-warning" style="font-size: 30px;"></i></li>
                                   <li class="list-inline-item me-0 small"><i class="far fa-star text-warning" style="font-size: 30px;"></i></li>
                                   <li class="list-inline-item me-0 small"><i class="far fa-star text-warning" style="font-size: 30px;"></i></li>
                               </ul>
                                   <input type="hidden" name="entScrWnl" id="wnl" value="0">
                           </div>
                           
                           <div class="col-12">
                               <label class="form-label h5" style="color: black;">사내문화&emsp;&emsp;&emsp;&emsp;&nbsp;&nbsp;&nbsp;&emsp;&emsp;</label>
                               <!-- Rating star -->
                               <ul class="list-inline mb-0 ratingStars" data-id="culture">
                                   <li class="list-inline-item me-0 small"><i class="far fa-star text-warning" style="font-size: 30px;"></i></li>
                                   <li class="list-inline-item me-0 small"><i class="far fa-star text-warning" style="font-size: 30px;"></i></li>
                                   <li class="list-inline-item me-0 small"><i class="far fa-star text-warning" style="font-size: 30px;"></i></li>
                                   <li class="list-inline-item me-0 small"><i class="far fa-star text-warning" style="font-size: 30px;"></i></li>
                                   <li class="list-inline-item me-0 small"><i class="far fa-star text-warning" style="font-size: 30px;"></i></li>
                               </ul>
                                   <input type="hidden" name="entScrCulture" id="culture" value="0">
                           </div>
                           
                           <div class="col-12">
                               <label class="form-label h5" style="color: black;">경영진&emsp;&emsp;&emsp;&emsp;&emsp;&nbsp;&nbsp;&nbsp;&emsp;&emsp;</label>
                               <!-- Rating star -->
                               <ul class="list-inline mb-0 ratingStars" data-id="management">
                                   <li class="list-inline-item me-0 small"><i class="far fa-star text-warning" style="font-size: 30px;"></i></li>
                                   <li class="list-inline-item me-0 small"><i class="far fa-star text-warning" style="font-size: 30px;"></i></li>
                                   <li class="list-inline-item me-0 small"><i class="far fa-star text-warning" style="font-size: 30px;"></i></li>
                                   <li class="list-inline-item me-0 small"><i class="far fa-star text-warning" style="font-size: 30px;"></i></li>
                                   <li class="list-inline-item me-0 small"><i class="far fa-star text-warning" style="font-size: 30px;"></i></li>
                               </ul>
                                   <input type="hidden" name="entScrManagement" id="management" value="0">
                           </div>

                           <!-- Short description -->
                           <div class="col-12">
                               <br>
                               <h5>CEO에 대한 견해</h5>
                               <input type="radio" name="entScrCeoevl" id="yes" value="지지해요">
                               <label for=""
                                   style="font-size: 18px; font-weight: bold; margin-right: 100px; ">&nbsp;지지해요</label>
                               <input type="radio" name="entScrCeoevl" id="no" value="지지하지 않아요">
                               <label for="" style="font-size: 18px; font-weight: bold;">&nbsp;지지하지 않아요</label>
                           </div>

                           <div class="col-12">
                               <br>
                               <h5>이 기업은 1년 후 어떻게 될까요?</h5>
                               <input type="radio" name="entScrFutureCmmncd" id="up" value="성장">
                               <label for=""
                                   style="font-size: 18px; font-weight: bold; margin-right: 70px; ">&nbsp;성장</label>
                               <input type="radio" name="entScrFutureCmmncd" id="stop" value="비슷">
                               <label for=""
                                   style="font-size: 18px; font-weight: bold; margin-right: 70px; ">&nbsp;비슷</label>
                               <input type="radio" name="entScrFutureCmmncd" id="down" value="하락">
                               <label for="" style="font-size: 18px; font-weight: bold;">&nbsp;하락</label>
                           </div>

                           <div class="col-12">
                               <br>
                               <h5>이 기업을 구직자에게 추천하나요?</h5>
                               <input type="radio" name="entScrRcmdYn" id="good" value="네, 추천해요">
                               <label for="" style="font-size: 18px; font-weight: bold; margin-right: 100px; ">&nbsp;네, 추천해요</label>
                               <input type="radio" name="entScrRcmdYn" id="bad" value="아니요, 추천하지 않습니다">
                               <label for="" style="font-size: 18px; font-weight: bold;">&nbsp;아니요</label>
                               <br>
                           </div>
                           <div class="mt-5"></div>
                           <div class="d-flex justify-content-center mt-3">
                           	   <div style="margin-right: 150px;">
                           	   <button class="btn btn-danger btn-lg me-2 mb-2 mb-md-0" type="button" name="writeBtn" id="writeBtn">즉시작성</button>
                           	   </div>
                               <button class="btn btn-light btn-lg me-2 mb-2 mb-md-0" type="button" name="cancelBtn" id="cancelBtn" >이전으로</button>
                               <button class="btn btn-success btn-lg ms-2 mb-2 mb-sm-0" name="addBtn" id="addBtn" >${name }</button>
                           </div>
                       </div>
                       <sec:csrfInput/>
                   </form>
               </div>
               <!-- Form END -->
           </div>
           <!-- Admission form END -->
       </div>
   </section>
   <!-- =======================Main part END -->
</main>

<script type="text/javascript">
$(function(){
	var reviewForm = $("#reviewForm");
	var addBtn = $("#addBtn");
	var cancelBtn = $("#cancelBtn");
	
	addBtn.on("click",function(){
		var workStts = $("#workStts").val();
		var hireCmmncd = $("#hireCmmncd").val();
		var pstnCmmncd = $("#pstnCmmncd").val();
		var entScrTscr = $("#tscr").val();
		var entScrEvl = $("#entScrEvl").val();
		var entScrAdvantage = $("#entScrAdvantage").val();
		var entScrWeakness = $("#entScrWeakness").val();
		var entScrWish = $("#entScrWish").val();
		var entScrPromotion = $("#promotion").val();
		var entScrWelfare = $("#welfare").val();
		var entScrWnl = $("#wnl").val();
		var entScrCulture = $("#culture").val();
		var entScrManagement = $("#management").val();
		var entScrCeoevl = $("input[name='entScrCeoevl']:checked").val();
		var entScrFutureCmmncd = $("input[name='entScrFutureCmmncd']:checked").val();	
		var entScrRcmdYn = $("input[name='entScrRcmdYn']:checked").val();
		
		if(workStts == null || workStts == ""){
		    Swal.fire({
		        text: "근무상태를 입력해주세요",
		        icon: "warning"
		    }).then((result) => {
		        if(result.isConfirmed){
		            $("#workStts").focus();
		        }
		    });            
		    return false;
		}
		if(hireCmmncd == null || hireCmmncd == ""){
			Swal.fire({
				text: "고용형태를 입력해주세요",
				icon: "warning"
			});				
			$("#hireCmmncd").focus();
			return false;
		}
		if(pstnCmmncd == null || pstnCmmncd == ""){
			Swal.fire({
				text: "직무를 입력해주세요",
				icon: "warning"
			});	
			$("#pstnCmmncd").focus();
			return false;
		}
		if(entScrTscr == 0){
			Swal.fire({
				text: "평점을 입력해주세요",
				icon: "warning"
			});				
			$("#tscr").focus();
			return false;
		}
		if(entScrEvl == null || entScrEvl == ""){
			Swal.fire({
				text: "한줄평을 입력해주세요",
				icon: "warning"
			});				
			$("#entScrEvl").focus();
			return false;
		}
		if(entScrAdvantage == null || entScrAdvantage == ""){
			Swal.fire({
				text: "장점을 입력해주세요",
				icon: "warning"
			});				
			$("#entScrAdvantage").focus();
			return false;
		}
		if(entScrWeakness == null || entScrWeakness == ""){
			Swal.fire({
				text: "단점을 입력해주세요",
				icon: "warning"
			});	
			$("#entScrWeakness").focus();
			return false;
		}
		if(entScrWish == null || entScrWish == ""){
			Swal.fire({
				text: "바라는점을 입력해주세요",
				icon: "warning"
			});	
			$("#entScrWish").focus();
			return false;
		}
		if(entScrPromotion == 0){
			Swal.fire({
				text: "별점을 입력해주세요",
				icon: "warning"
			});	
			$("#promotion").focus();
			return false;
		}
		if(entScrWelfare == 0){
			Swal.fire({
				text: "별점을 입력해주세요",
				icon: "warning"
			});	
			$("#welfare").focus();
			return false;
		}
		if(entScrWnl == 0){
			Swal.fire({
				text: "별점을 입력해주세요",
				icon: "warning"
			});	
			$("#wnl").focus();
			return false;
		}
		if(entScrCulture == 0){
			Swal.fire({
				text: "별점을 입력해주세요",
				icon: "warning"
			});	
			$("#culture").focus();
			return false;
		}
		if(entScrManagement == 0){
			Swal.fire({
				text: "별점을 입력해주세요",
				icon: "warning"
			});			
			$("#management").focus();
			return false;
		}
		if(entScrCeoevl == null || entScrCeoevl == ""){
			Swal.fire({
				text: "CEO에 대한 견해를 체크해주세요",
				icon: "warning"
			});
			$("input[name='entScrCeoevl']").focus();
			return false;
		}
		if(entScrFutureCmmncd == null || entScrFutureCmmncd == ""){
			alert("1년 후 기업에 대해 체크해주세요")
			Swal.fire({
				text: "1년 후 기업에 대해 체크해주세요",
				icon: "warning"
			});
			$("input[name='entScrFutureCmmncd']").focus();
			return false;
		}
		if(entScrRcmdYn == null || entScrRcmdYn == ""){
			Swal.fire({
				text: "추천을 체크해주세요",
				icon: "warning"
			});
			$("input[name='entScrRcmd_Yn']").focus();
			return false;
		}
		
		if($(this).val() == "수정하기"){
			reviewForm.attr("action", "/ent/entReviewUpdate.do")
		}
		

		reviewForm.submit();
		
		
	});
	
	
	cancelBtn.on("click",function(e){
		e.preventDefault();
		
		Swal.fire({
			title : "이전페이지로 돌아가시겠습니가?",
			text : "입력된 정보는 저장 되지않습니다",
			icon : "warning",
			
			showCancelButton: true, // cancel버튼 보이기. 기본은 원래 없음
		    confirmButtonColor: '#3085d6', // confrim 버튼 색깔 지정
	 	    cancelButtonColor: '#d33', // cancel 버튼 색깔 지정
		    confirmButtonText: '확인', // confirm 버튼 텍스트 지정
	 	    cancelButtonText: '취소', // cancel 버튼 텍스트 지정
			   
			   reverseButtons: true, // 버튼 순서 거꾸로
			
		}).then((result) => {
			if(result.value){
				location.href="/ent/detail.do?entNo=${entVO.entNo}";
			}
		});
		
	});
	
	$("#entScrEvl").keyup(function(e){
		var entScrEvl= $(this).val();
		
		if(entScrEvl == 0 || entScrEvl == ''){
			$("#entScrEvlLength").text("0자");
		}else{
			$("#entScrEvlLength").text(entScrEvl.length +"자");
		}
		
		if(entScrEvl.length >= 100){
			$(this).val($(this).val().substring(0,99));
			Swal.fire({
				text: "글자수는 100자까지 입력 가능합니다",
				icon: "info"
			});
		}
		
	});
	
});




$(document).ready(function(){

	$("#writeBtn").on("click",function(){
		
		$("#entScrEvl").val("객관적으로 훌륭한 편이긴 함. 부바부는 있을 듯.");
		$("#entScrAdvantage").val("워라벨이 좋음. 동료들의 능력이 뛰어남. 대기업에서 이직했지만 훨씬 분위기는 자유롭고 좋음");
		$("#entScrWeakness").val("큰 프로젝트를 끌고 가는 C레벨이 없음. 부문간 사일로로 단편적으로 프로젝트가 진행");
		$("#entScrWish").val("더 좋은 기업으로 갈수있게 힘 써주세요");
		$("#yes").prop("checked",true);
		$("#stop").prop("checked",true);
		$("#good").prop("checked",true);
		$("#workStts").val("현직자");
		$("#entScrEvl").focus();
		
	});
		
		
	
		
		
		
});
	




$(document).ready(function() {
    // 별점을 클릭할 때마다 발생하는 이벤트
    $('.ratingStars').on('click', 'li', function() {
        // 선택한 별의 개수를 저장
        var selectedRating = $(this).index() + 1;

        // 선택한 별을 기준으로 이전 별들은 모두 채워짐, 이후 별들은 비워짐
        $(this).parent().find('li').each(function(index) {
            if (index < selectedRating) {
                $(this).html('<i class="fas fa-star text-warning" style="font-size: 30px;"></i>');
            } else {
                $(this).html('<i class="far fa-star text-warning" style="font-size: 30px;"></i>');
            }
        });

        // 숨은 입력 필드에 선택한 별의 개수를 설정
        var inputId = $(this).closest('.ratingStars').data('id');
        $("#"+inputId).val(selectedRating);
//         $('#'+inputId).val(selectedRating);
//         $('#'+inputId).val(selectedRating);
//         $('#'+inputId).val(selectedRating);
//         $('#'+inputId).val(selectedRating);
//         $('#'+inputId).val(selectedRating);
    });
});


</script>    