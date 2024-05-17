<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
<script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<style>
    .autocomplete-items {
        position: absolute; /* 위치를 입력 필드 바로 아래로 설정 */
        border: 1px solid #d4d4d4; /* 경계선 설정 */
        border-top: none; /* 위쪽 경계선 제거 */
        z-index: 1000; /* 다른 요소들 위에 표시되도록 z-index 설정 */
        width: 23%; /* 부모 요소의 전체 너비를 사용 */
        box-sizing: border-box; /* 너비 계산 시 padding과 border를 포함 */
        background-color: white; /* 배경색 */
        max-height: 200px; /* 최대 높이 설정 */
        overflow-y: auto; /* 내용이 넘칠 경우 스크롤바 표시 */
        overflow-x: hidden; /* 가로 스크롤바 비활성화 */
        margin-left: 1px;
    }

    .autocomplete-items div {
        padding: 8px 10px; /* 상하 8px, 좌우 10px의 패딩으로 조금 더 좁게 설정 */
        cursor: pointer;
        background-color: #fff; /* 배경색 */
        border-bottom: 1px solid #d4d4d4; /* 아래쪽 테두리 */
    }

    .autocomplete-items div:hover {
        background-color: #f1f1f1; /* 마우스 오버 시 배경색 변경 */
    }

    .autocomplete-active {
        background-color: DodgerBlue !important; /* 활성화된 항목의 배경색 */
        color: white; /* 활성화된 항목의 텍스트 색상 */
    }
    
	input[id^="list"] {
	  display: none;
	}
	
	.checkbox_img {
	  display: inline-block;
	  width: 20px;
	  height: 20px;
	  background: url('https://s.wemep.co.kr/ui/v2.8.307/dist/pc/css/spr/common.png') 0 -438px no-repeat;
	  vertical-align: top;
	  margin-right: 10px;
	}
	
	input[id^="list"]:checked + label span {
	  background-position: -75px -438px;
	}
	
	.languages-container {
        border: 1px solid #ced4da; /* 테두리 색상 적용 */
    }
    /* 기본 모달 스타일링 */
.modal-content {
    background: #ffffff; /* 밝은 배경 */
    border-radius: 8px;  /* 모서리 둥글게 */
    border: none;        /* 테두리 제거 */
    box-shadow: 0 5px 15px rgba(0,0,0,0.5); /* 그림자 효과 */
}

/* 모달 헤더 스타일링 */
.modal-header {
    border: none; /* 하단 경계선 제거 */
    padding: 20px;       /* 패딩 조정 */
    background-color: #AC58FA;
     /* 헤더 배경색 */
}

/* 제목 스타일링 */
.modal-title {
    font-size: 1.25rem; /* 글자 크기 조정 */
    color: white;        /* 글자색 */
}

/* 닫기 버튼 스타일 */
.btn-close {
    background: none;  /* 기본 배경 제거 */
    border: none;      /* 테두리 제거 */
}

/* 모달 바디 스타일링 */
.modal-body {
    padding: 20px; /* 패딩 조정 */
}

/* 버튼 스타일링 */
.btn {
    border-radius: 50px; /* 버튼 모서리 둥글게 */
    padding: 10px 20px;  /* 패딩 조정 */
}

/* 초기화 버튼 디자인 */
#initBtn {
    border: none;                      /* 테두리 제거 */
    background-color: #6c757d;        /* 배경색 변경 */
    color: white;                      /* 글자색 변경 */
}

/* 결제 버튼 활성화 스타일 */
#pay-button:enabled {
    background-color: #007bff;        /* 활성화 시 배경색 */
    color: white;  
    border: none;                    /* 활성화 시 글자색 */
}

#pay-button {
    border: none;                    /* 활성화 시 글자색 */
}

/* 총 금액 스타일링 */
.total-price h4 {
    color: #007bff; /* 글자색 */
    font-weight: bold; /* 글자 굵기 */
}
    

</style>


<div class="page-content-wrapper border">
	<c:set value="제출" var="name" />
	<c:if test="${status eq 'edit' }">
		<c:set value="수정" var="name" />
	</c:if>

	<form class="row g-3" id="recruitRegiForm" action="/myPage/enterprise/recruitInsertProcess" method="post" enctype="multipart/form-data">
		<div style="display: flex; justify-content: space-between;">
			<span>
				<h4 class="h5 mb-0" style="margin-top: 3px;">채용 등록</h4>
			</span>
			<span>
				<button type="button" class="btn btn-primary autoComplete" style="padding: 6px; font-size: 12px;" onclick="addBtn()">자동완성</button>
			</span>
		</div>
		<hr>
		
		<div class="col-md-7"> 
		<div class="input-group mb-3">
			<span class="input-group-text text-black">공고제목</span> 
			<input type="text" class="form-control" placeholder="공고제목을 입력하세요." name="recruitTtl" id="recruitTtl" value="${recruitVO[0].recruitTtl}">
		</div>
		</div>
		
		<div class="col-md-5 offset-md-0"> 
		<div class="input-group mb-3">
			<input type="file" class="form-control" id="recruitFile" name="recruitFile">
			<input type="button" class="input-group-text" id="checkImage" value="공고 파일 보기"/>
		</div>
		</div>
		
		<div class="col-md-7"> 
		<div class="input-group mb-3">
			<span class="input-group-text text-black">공고날짜</span> 
			<input type="text" id="startAndEnd" placeholder="공고날짜를 선택해주세요." data-input class="form-control" value="">
			<span class="input-group-text d-flex justify-content-center" title="toggle" id="calendarToggle" data-toggle>
			<i class="fas fa-calendar-alt"></i>
			</span>
			<span class="input-group-text rounded-end d-flex justify-content-center" title="clear" id="clearDates" data-clear>
			<i class="fas fa-times"></i>
			</span>
			<input type="hidden" id="startDate" name="recruitStrtDt" value="${recruitVO[0].recruitStrtDt}">
			<input type="hidden" id="endDate" name="recruitEndDt" value="${recruitVO[0].recruitEndDt}">
		</div>
		</div>
		
		<div class="col-md-5 offset-md-0">
			<div class="input-group mb-3">
			<span class="input-group-text text-black rounded-end">수시채용여부</span>
			<div class="d-flex justify-content-evenly" style="width: 65%;">
				<div class="form-check m-2">
					<input class="form-check-input" type="radio" name="recruitYn" value="Y" id="checkbox1" <c:if test="${recruitVO[0].recruitYn eq 'Y'}">checked</c:if>>
					<label class="form-check-label" for="checkbox1">
						예
					</label>
				</div>
				<div class="form-check m-2">
					<input class="form-check-input" type="radio" name="recruitYn" value="N" id="checkbox2" <c:if test="${recruitVO[0].recruitYn eq 'N'}">checked</c:if>>
					<label class="form-check-label" for="checkbox2">
						아니오
					</label>
				</div>
			</div>
			
			</div>
		</div> 
		
		
		
		
		<div class="col-md-7"> 
		<div class="input-group mb-3">
			<span class="input-group-text text-black rounded-end">고용형태</span>
		    <div class="form-check m-2">
		        <input class="form-check-input" type="checkbox" value="정규직" name="hireCmmncdNms" id="flexCheckDefault1" <c:if test="${fn:contains(hireMap, '정규직')}">checked</c:if>>
		        <label class="form-check-label" for="flexCheckDefault1">
		           	 정규직
		        </label>
		    </div>
		    <div class="form-check m-2">
		        <input class="form-check-input" type="checkbox" value="계약직" name="hireCmmncdNms" id="flexCheckDefault2" <c:if test="${hireMap['계약직'] == '계약직'}">checked</c:if>>
		        <label class="form-check-label" for="flexCheckDefault2">
	            	계약직
		        </label>
		    </div>
		    <div class="form-check m-2">
		        <input class="form-check-input" type="checkbox" value="무기계약직" name="hireCmmncdNms" id="flexCheckDefault3" <c:if test="${hireMap['무기계약직'] == '무기계약직'}">checked</c:if>>
		        <label class="form-check-label" for="flexCheckDefault3">
	            	무기 계약직
		        </label>
		    </div>
		    <div class="form-check m-2">
		        <input class="form-check-input" type="checkbox" value="인턴" name="hireCmmncdNms" id="flexCheckDefault4" <c:if test="${fn:contains(hireMap, '인턴')}">checked</c:if>>
		        <label class="form-check-label" for="flexCheckDefault4">
	            	인턴
		        </label>
		    </div>
		</div>
		</div>
		
		<div class="col-md-5 offset-md-0">
		<div class="input-group mb-3">	
			<span class="input-group-text text-black">모집인원</span>
			<input type="text" class="form-control" id="recruitCnt" name="recruitCnt" placeholder="숫자를 적어주세요." value="${recruitVO[0].recruitCnt }">
		    <span class="input-group-text">명</span>
		</div>
		</div>
		
	    <div class="col-md-5"> 
	      <div class="input-group mb-3">
	        <span class="input-group-text text-black">연봉</span> 
	        <input type="text" class="form-control" id="hireSal" name="recruitPay" value="${recruitVO[0].recruitPay}" placeholder="연봉을 입력해주세요.">
	      </div>
	    </div>
	    
	    <div class="col-md-7 offset-md-0">
	      <div class="input-group mb-3">
	        <span class="input-group-text text-black">채용URL</span> 
	        <input type="text" class="form-control" id="entUrl" name="entUrl" value="${recruitVO[0].entUrl}" placeholder="http://"> 
	      </div>
	    </div>
	    
	    <div class="col-md-5"> 
	    <div class="input-group mb-3 careerlist">
	    	<span class="input-group-text text-black">지원자격</span>
		    	<div class="form-check m-2">
				<input class="form-check-input" type="radio" name="recruitCareerCodeNm" value="신입" id="checkbox3"  <c:if test="${recruitVO[0].recruitCareerCodeNm eq '신입'}">checked</c:if>>
				<label class="form-check-label" for="checkbox1">
					신입
				</label>
				</div>
				<div class="form-check-box m-2">
					<input class="form-check-input" type="radio" name="recruitCareerCodeNm" value="경력무관" id="checkbox4" <c:if test="${recruitVO[0].recruitCareerCodeNm eq '경력무관'}">checked</c:if>>
					<label class="form-check-label" for="checkbox2">
						경력무관
					</label>
				</div>
				<div class="form-check-box m-2">
					<input class="form-check-input" type="radio" name="recruitCareerCodeNm" value="경력" id="checkbox5" <c:if test="${recruitVO[0].recruitCareerCodeNm eq '경력'}">checked</c:if>/>
					<label class="form-check-label" for="checkbox3">
						경력
					</label>
				</div>
		</div>
		</div>
		
		<div class="col-md-7 offset-md-0">
		<div class="input-group mb-3">
			<span class="input-group-text text-black">경력기간선택</span> 
			<div class="form-check-box m-2 careerYn">
			</div>
		</div>
		</div>
		
		<div class="col-md-5"> 
		<div class="input-group mb-3">
			<span class="input-group-text text-black">우편번호</span> 
			<input type="text" class="form-control" id="memPostCode" name="entPostcode" value="${recruitVO[0].entPostcode}" readonly> 
			<button type="button" class="input-group-text" onclick="DaumPostcode()">우편번호 찾기</button>
		</div>
		</div>
		
		<div class="col-md-7 offset-md-0">
		<div class="input-group mb-3">
			<span class="input-group-text text-black">근무지 주소</span> 
			<input type="text" class="form-control rounded-end" id="memAddress1" placeholder="주소를 입력해주세요" value="${recruitVO[0].cmmncdGrpCd} ${recruitVO[0].cmmncdNm1}" readonly> 
			<input type="hidden" id="cmmncdGrpCd" name="cmmncdGrpCd" value="${recruitVO[0].cmmncdGrpCd}"/>
			<input type="hidden" id="cmmncdNm1" name="cmmncdNm1" value="${recruitVO[0].cmmncdNm1}"/>
		</div>
		</div>
		
		<div class="container mt-3">
		    <div class="row" style="width: 58.6rem;">
		        <div class="col-md-4 col-12">
		            <div class="input-group mb-3">
		                <span class="input-group-text text-black">모집분야</span>
		            </div>
		            
		            <div class="input-group mb-3">
		            <c:if test="${status eq 'edit' }">
		                <input type="text" class="form-control" name="pstnCmmncdNm" id="field" placeholder="모집분야를 입력하세요." value="${recruitVO[0].pstnCmmncdNm}" autocomplete="off" disabled>
		            </c:if>
		            <c:if test="${status ne 'edit' }">
		                <input type="text" class="form-control" name="pstnCmmncdNm" id="field" placeholder="모집분야를 입력하세요." autocomplete="off">
		            </c:if>
		                <span class="input-group-text d-flex justify-content-center" title="toggle" id="calendarToggle" data-toggle>
						<i class="fas fa-search"></i>
						</span>
					</div>
		            <div id="autocomplete-list" class="mb-2"></div> <!-- 여기에 공간 추가 -->
		        </div>
		        <div class="col-md-4 col-12">
		            <div class="input-group mb-3">
		                <span class="input-group-text text-black mb-3 rounded-end">필수언어</span>
			                <div class="languages-container rounded-start rounded-end" style="overflow-y: auto; height: 180px; width: 86.5%; overflow-x: hidden; border: 0; background-color: transparent;"> <!-- 오른쪽 패딩 추가 -->
			                
			                <div class="input-group mb-3">
			                    <div id="languages-list"> <!-- 각 체크박스 아이템 간격 조정 -->
			                     <input type="text" class="form-control" id="initial-input" placeholder="모집분야에서 먼저 조회해주세요." style="width: 115%;" disabled/>   <!-- 체크박스들이 여기에 동적으로 추가됩니다. -->
				                </div>
		                    </div>
		                </div>
		            </div>
		        </div>
		        <div class="col-md-4 col-12">
		            <div class="input-group mb-3">
		            
		                <span class="input-group-text text-black mb-3 rounded-end">우대언어</span>
		                	<div class="languages-container rounded-start rounded-end p-2" style="overflow-y: auto; height: 180px; width: 86.5%; overflow-x: hidden; background-color: #e9ecef;"> 
		                
		                <div class="input-group mb-3">
		                    <div id="languages-list">
		                    <div id="checkboxContainer">
							<c:forEach items="${preferCmmncdNms}" var="prefer">
							    <div class="form-check" style="padding-left: 0rem;">
							        <input type="checkbox" id="list${prefer.CMMNCD_NM1}" class="form-check-input" 
							               name="preferLangCmmncdNms" value="${prefer.CMMNCD_NM1}"
							               ${fn:contains(preferMap, prefer.CMMNCD_NM1) ? 'checked' : ''}>
							        <label class="form-check-label" for="list${prefer.CMMNCD_NM1}">
							            <span class="checkbox_img"></span>${prefer.CMMNCD_NM1}</label>
							    </div>
							</c:forEach>
		                    </div>
			                </div>
	                   </div>
		            </div>
		        </div>
		    </div>
		</div>
		</div>
			

	<c:if test="${status eq 'edit' }">
		<input type="hidden" name="recruitNo" value="${recruitVO[0].recruitNo }">
		<input type="hidden" name="entNo" value="${recruitVO[0].entNo }">
		<input type="hidden" name="entNm" value="${recruitVO[0].entNm }">
		<input type="hidden" name="pstnCmmncdNm" value="${recruitVO[0].pstnCmmncdNm }">
		<input type="hidden" name="recruitFile" value="${recruitVO[0].recruitFile}">
		<input type="hidden" name="processYn" value="${recruitVO[0].processYn}">
	</c:if>
	
	
	<c:if test="${status ne 'edit' }">
		<h6 class="text-center mt-5" style="margin-left: -40px;">채용프로세스 사용여부</h6>
		<div class="row justify-content-center mt-3">
			<div class="col-lg-2">
				<div class="form-check me-4">
					<input class="form-check-input" type="radio" name="processYn" id="radioYes" value="Y">
					<label class="form-check-label" for="radioYes">네</label>
				</div>
			</div>
			<div class="col-lg-2">
				<div class="form-check me-4">
					<input class="form-check-input" type="radio" name="processYn" id="radioNo" value="N">
					<label class="form-check-label" for="radioNo">아니오</label>
				</div>
			</div>
		</div>
	</c:if>

		<input type="hidden" name="processAmt" id="processAmt" value="1000"/>
		<div class="col-12">
			<div class="d-flex justify-content-end">
			<button class="btn btn-primary me-2" type="button" id="submitBtn">${name}</button>
			<button class="btn btn-warning me-2" type="button" id="cancelBtn">취소</button>
					
			<c:if test="${status eq 'edit' }">
					<button class="btn btn-danger me-2" type="button" id="delBtn">삭제</button>
			</c:if>
			</div>
		</div>  
		<sec:csrfInput />
	</form>

</div>

<!-- Modal Script-->




<!-- ***** MODAL *******-->
<div class="modal fade" id="paymentModal" tabindex="-1" aria-labelledby="paymentModalModalLabel" aria-hidden="true">
<!-- 	<div class="modal-dialog modal-dialog-scrollable"> -->
	<div class="modal-dialog modal-xl">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLabel">결제</h5>

				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close" id="payCloseBtn"></button>

			</div>
			<div class="modal-body">
				<div class="d-flex justify-content-between">
					<legend>결제 상품</legend>
					<button type="button" class="btn btn-primary rounded-2" id="initBtn" style="width: 100px;">초기화</button>
				</div>

				<div class="justify-content-center" id="payment-products">
					<a class="btn btn-primary-soft" value="10000">서류 전형</a> <a class="btn btn-primary-soft" value="20000">Coding test</a> <a class="btn btn-primary-soft" value="30000">화상 면접</a>
				</div>


				<div class="recruitment-process d-flex flex-row gap-2"></div>

				<legend>이용 약관</legend>
				<div id="terms-and-conditions" style="height: 350px; overflow-y: scroll; overflow-x: 10px;">

					<pre>
본 이용 약관(이하 "약관")은 사용자(이하 "회원")가 [서비스명] (이하 "서비스")를 이용함에 있어 
회원과 [회사명] (이하 "회사") 사이의 권리, 의무 및 책임사항, 이용 조건 및 절차, 기타 필요한 사항을 규정함을 목적으로 합니다.

1. 약관의 동의
1.1 회원가입 시 본 약관의 내용에 대해 "동의합니다" 버튼을 클릭할 경우, 본 약관의 내용에 동의한 것으로 간주합니다.

1.2 회사는 필요한 경우 약관을 수정할 수 있으며, 약관이 변경될 경우 최소 7일 전에 서비스 내에 공지합니다. 변경된 약관은 공지된 날로부터 효력이 발생합니다.

2. 회원 가입 및 관리
2.1 회원 가입은 서비스의 회원가입 양식에 따라 회원 정보를 정확하게 입력하고, 본 약관에 동의함으로써 가입이 완료됩니다.

2.2 회원은 가입 시 등록한 정보에 변경이 있는 경우, 즉시 해당 정보를 수정해야 합니다.

2.3 회사는 회원이 약관에 위배되는 행위를 할 경우, 회원에 대해 서비스 이용 제한, 계약 해지 등의 조치를 취할 수 있습니다.

3. 서비스 이용
3.1 회사는 회원에게 아래와 같은 서비스를 제공합니다.

서류 전형 서비스
코딩 테스트 서비스
화상 면접 서비스
3.2 서비스 이용 시간은 회사의 업무 상황 또는 기술적 문제에 따라 달라질 수 있으며, 이로 인해 서비스 제공에 차질이 생길 경우 사전에 공지합니다.

4. 개인정보 보호
4.1 회사는 회원의 개인정보를 보호하기 위해 최선을 다합니다. 회원의 개인정보 처리 및 보호에 관한 사항은 관련 법령 및 회사의 개인정보처리방침에 따릅니다.

5. 면책사항
5.1 회사는 천재지변, 전쟁, 테러 공격 등 불가항력적인 사유로 인한 서비스의 중단에 대하여 책임을 지지 않습니다.

5.2 회사는 회원이 서비스를 이용하여 기대하는 수익을 얻지 못하거나 서비스 자료에 대한 손실이 발생하였을 경우, 그 책임을 지지 않습니다.

6. 약관의 적용
6.1 본 약관에 명시되지 않은 사항에 대해서는 관련 법령 또는 상관례에 따릅니다.
</pre>

				</div>
			</div>

			<div class="modal-footer d-flex justify-content-between">
					<div>
							<span> <span style="color: red"> * </span> 이용약관을 확인하셔야 결제가 진행됩니다</span>
					</div>
					<div class="total-price d-flex justify-content-between">
						<h4>
							총 금액:<span id="payTotalPrice">0</span>
						</h4>
						<button type="button" class="btn btn-primary" id="pay-button" disabled>결제</button>
					</div>
			</div>
		</div>
	</div>
</div>


<div class="modal fade" id="confirmModal" tabindex="-1" aria-labelledby="confirmModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="confirmModalLabel">진행 확인</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-body">진행하시겠습니까?</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
				<button type="button" class="btn btn-primary">진행</button>
			</div>
		</div>
	</div>
</div>

<div class="modal fade" id="checkImageModal" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="modalLabel">이미지 미리보기</h5>
			</div>
			<div class="modal-body">
				<img id="previewImage" src="" alt="Image preview" class="img-fluid">
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
			</div>
		</div>
	</div>
</div>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="http://code.jquery.com/jquery-latest.min.js" type="text/javascript"></script>
<script src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script src="https://cdn.portone.io/v2/browser-sdk.js"></script>
<script type="text/javascript">

function addBtn(){
	
	$("#recruitTtl").val("당근 상반기 서버 개발자 모집");
	$("#checkbox1").prop("checked",true);
	$("#flexCheckDefault1").prop("checked",true);
	$("#recruitCnt").val("0");
	$("#hireSal").val("협의 후 결정");
	$("#entUrl").val("www.daangn.com");
// 	$("input[name='recruitCareerCodeNm']").prop("checked", true);
	$("#checkbox4").prop("checked",true);
// 	$("#memPostCode").val("05544");
// 	$("#memAddress1").val("서울시 송파구 위례성대로 2 장은빌딩 2층 (주)우아한형제들");
	$("#radioYes").prop("checked",true);
}


function DaumPostcode() {
		new daum.Postcode({
			oncomplete : function(data) {
			var addr = ''; // 주소 변수
			var extraAddr = ''; // 참고항목 변수

			if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
				addr = data.roadAddress;
			} else { // 사용자가 지번 주소를 선택했을 경우(J)
				addr = data.jibunAddress;
			}

			if (data.userSelectedType === 'R') {
				// 법정동명이 있을 경우 추가한다. (법정리는 제외)
				// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
				if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
					extraAddr += data.bname;
				}
				// 건물명이 있고, 공동주택일 경우 추가한다.
				if (data.buildingName !== '' && data.apartment === 'Y') {
					extraAddr += (extraAddr !== '' ? ', '
							+ data.buildingName : data.buildingName);
				}
			}

			document.getElementById('memPostCode').value = data.zonecode;
			document.getElementById("memAddress1").value = addr;
			document.getElementById("cmmncdGrpCd").value= addr.split(" ")[0].trim();
			document.getElementById("cmmncdNm1").value= addr.split(" ")[1].trim();
			
		}
	}).open();
}
var number = 1;
document.addEventListener("DOMContentLoaded", function(e){
	
	window.onload = function() {
	    var container = document.getElementById('checkboxContainer');
	    var checkboxes = Array.from(container.getElementsByClassName('form-check'));
	    
	    checkboxes.sort(function(a, b) {
	        return b.querySelector('input[type="checkbox"]').checked - a.querySelector('input[type="checkbox"]').checked;
	    });
	    checkboxes.forEach(function(checkbox) {
	        container.appendChild(checkbox);
	    });
	};
	
	var careerlist = document.querySelector(".careerlist");
	var careerYn = document.querySelector(".careerYn")
	var checkbox3 = document.getElementById("checkbox3");
	var recruitCareerDt = "${recruitVO[0].recruitCareerDt}";
	console.log(recruitCareerDt);
	
	function populateAndShowCareerSection() {
	    if (!document.getElementById("careerDt")) { // 경력 섹션이 이미 존재하지 않으면 추가
	        careerYn.insertAdjacentHTML('beforeend', `
	            <div class="form-group d-flex justify-content-between" id="careerDt">
	                <label for="careerDuration" style="width: 30px;"></label>
	                <select class="form-control" id="careerDuration" name="recruitCareerDt">
	                    <option value="1">1년 이상</option>
	                    <option value="2">2년 이상</option>
	                    <option value="3">3년 이상</option>
	                    <option value="4">4년 이상</option>
	                    <option value="5">5년 이상</option>
	                </select>
	            </div>
	        `);
	    }

	    var selectElement = document.getElementById('careerDuration');
	    if (selectElement && recruitCareerDt) {
	        selectElement.value = recruitCareerDt; // 해당 값이 있는 옵션을 자동으로 선택
	    }
	}
	
	careerlist.querySelectorAll("input").forEach(function(check){
		
		check.addEventListener("change", function(){

			console.log(this.checked);

			if(checkbox3.checked === true){

				careerYn.insertAdjacentHTML('beforeend', `
					<div class="form-group d-flex justify-content-between" id="careerDt">
						<label for="careerDuration" style="width: 30px;"></label>
						<select class="form-control" id="careerDuration" name="recruitCareerDt">
							<option value="1">1년 이상</option>
							<option value="2">2년 이상</option>
							<option value="3">3년 이상</option>
							<option value="4">4년 이상</option>
							<option value="5">5년 이상</option>
						</select>
					</div>
				`);
			}else{
					var careerRemove = document.getElementById("careerDt");
					careerRemove.remove();
			}
		});
		
		if(check.checked) {
			populateAndShowCareerSection();
		}
	});
	
	var checkImageBtn = document.getElementById("checkImage");
	var fileAttachment = document.getElementById("recruitFile");
	var modal = new bootstrap.Modal(document.getElementById('checkImageModal'));
	var hireMap = "${hireMap}";
//		console.log(hireMap);
	checkImageBtn.addEventListener("click", function(){

		var file = fileAttachment.files[0];

		if(file) {

			var reader = new FileReader();

			reader.onload = function(e) {

				var previewImage = document.getElementById("previewImage");
				previewImage.src = e.target.result;
				modal.show();

			}
			reader.readAsDataURL(file);
		}else{
			
			var xhr = new XMLHttpRequest();
			
			xhr.open("get", "/myPage/enterprise/getRecruitImage?recruitNo=${recruitVO[0].recruitNo}_${recruitVO[0].pstnCmmncdNm}", true);
			
			xhr.responseType = "blob";
			xhr.onload = function(e) {
				
				if(this.status == 200){
					
					var blob = this.response;
					
					var reader = new FileReader();
					
					reader.onload = function(e) {
						
						var previewImage = document.getElementById("previewImage");
						previewImage.src = e.target.result;
						modal.show();
					}
					reader.readAsDataURL(blob);
				}
			};
			xhr.send();
		}
	});
	
	////달력기능
	var calendarToggle = document.getElementById("calendarToggle");
	var clearDates = document.getElementById("clearDates");
	var startAndEndInput = document.getElementById("startAndEnd");
	var startDate = document.getElementById("startDate");
	var endDate = document.getElementById("endDate");
	var initStrtDate = "${fn:substringBefore(recruitVO[0].recruitStrtDt,'T')} ${fn:substringAfter(recruitVO[0].recruitStrtDt,'T')}";
	var initEndDate =  "${fn:substringBefore(recruitVO[0].recruitEndDt,'T')} ${fn:substringAfter(recruitVO[0].recruitEndDt,'T')}";

	//처음 에러나는거 값 잡기
	var defaultDates = [];
	if (initStrtDate.trim() && initEndDate.trim()) {
	    defaultDates = [initStrtDate, initEndDate];
	}

	calendarToggle.addEventListener('click', function() {

		startAndEndInput._flatpickr.toggle(); 
	});

	clearDates.addEventListener('click', function() {
		startAndEndInput._flatpickr.clear(); 
		startDate.value = "";
		endDate.value = "";
	});


	flatpickr("#startAndEnd", {

		mode: "range",
		minDate: "today",
		dateFormat: "Y-m-d H:i",
		enableTime: true,
		time_24hr: true,
		defaultDate: defaultDates,
		onClose: function(selectedDates, dateStr, instance) {
//			console.log(dateStr.split("to")[0].split(" ")[0] + "T" + dateStr.split("to")[0].split(" ")[1]);
//			console.log(dateStr.split("to")[1].split(" ")[1] + "T" + dateStr.split("to")[1].split(" ")[2]);

			startDateValue = dateStr.split("to")[0].split(" ")[0] + "T" + dateStr.split("to")[0].split(" ")[1].trim();
			endDateValue = dateStr.split("to")[1].split(" ")[1] + "T" + dateStr.split("to")[1].split(" ")[2].trim();

			startDate.value = startDateValue;
			endDate.value = endDateValue;
		}
		
	});
	
	
		

	
	//자동 완성 기능
	const fieldInput = document.getElementById('field');
	let currentFocus;

	fieldInput.addEventListener('input', function() {
	    autocomplete(this, 'autocomplete-list');
	});

	// 포커스 이벤트 리스너 추가
	fieldInput.addEventListener('focus', function() {
	    autocomplete(this, 'autocomplete-list', true); // true는 모든 항목을 보여주기 위해 추가한 인자
	});
	
	
    function closeAllLists(elmnt) {
        // 클릭된 요소가 입력 필드가 아닐 경우에만 리스트를 닫음
        var x = document.querySelectorAll(".autocomplete-items");
        for (var i = 0; i < x.length; i++) {
            if (elmnt != x[i] && elmnt != fieldInput) {
                x[i].parentNode.removeChild(x[i]);
            }
        }
    }
	

	function autocomplete(input, listID, showAll = false) {
	    let a, b, i, val = input.value;
	    closeAllLists(input);
	    if (!val && !showAll) { return false; }
	    currentFocus = -1;
	    a = document.createElement("DIV");
	    a.setAttribute("id", input.id + "autocomplete-list");
	    a.setAttribute("class", "autocomplete-items");
	    document.getElementById(listID).appendChild(a);
	    let fields = ${pstnCmmncdNms};

	    for (i = 0; i < fields.length; i++) {
	        if (showAll || fields[i].toUpperCase().includes(val.toUpperCase())) {
	            b = document.createElement("DIV");
	            b.innerHTML = "<strong>" + fields[i].substr(0, val.length) + "</strong>";
	            b.innerHTML += fields[i].substr(val.length);
	            b.innerHTML += "<input type='hidden' value='" + fields[i] + "'>";
	            b.addEventListener("click", function(e) {
	                input.value = this.getElementsByTagName("input")[0].value;
	                closeAllLists(input);
	                esntlAjax(input.value); // AJAX 호출을 여기에 추가
	            });
	            a.appendChild(b);
	        }
	    }
	}
    

    fieldInput.addEventListener("keydown", function(e) {
        let x = document.getElementById(this.id + "autocomplete-list");
        if (x) x = x.getElementsByTagName("DIV");
        if (e.keyCode == 40) {
            currentFocus++;
            addActive(x);
        } else if (e.keyCode == 38) {
            currentFocus--;
            addActive(x);
        } else if (e.keyCode == 13) {
            e.preventDefault();
            if (currentFocus > -1) {
                if (x) x[currentFocus].click();
            }
        }
    });

    function addActive(x) {
        if (!x) return false;
        for (let j = 0; j < x.length; j++) {
            x[j].classList.remove("autocomplete-active");
        }
        if (currentFocus >= x.length) currentFocus = 0;
        if (currentFocus < 0) currentFocus = x.length - 1;
        x[currentFocus].classList.add("autocomplete-active");
    }

    function closeAllLists(input) {
        var x = document.querySelectorAll(".autocomplete-items");
        for (var i = 0; i < x.length; i++) {
            if (x[i] !== input.nextSibling) {
                x[i].parentNode.removeChild(x[i]);
            }
        }
    }

    document.addEventListener("click", function (e) {
        closeAllLists(document.getElementById('field'));
    });
    
    function esntlAjax(pstnCmmncdNm){
    	
    	var xhr = new XMLHttpRequest();
		
    	xhr.open("GET", "/myPage/enterprise/esntLangList?pstnCmmncdNm=" + encodeURIComponent(pstnCmmncdNm), true);
    	
    	xhr.onreadystatechange = function() {
    		
    		if(xhr.readyState === XMLHttpRequest.DONE){
    			
    			if(xhr.status === 200){
//    				console.log("요청 성공");
    				var responseData = JSON.parse(xhr.responseText);
    				console.log(responseData);
    				esntlLangAjax(responseData);
    				
    			}else{
   					console.log("요청 실패");
    			}
    		}
    	}
    	xhr.send();
    }
    
	var cancelBtn = document.getElementById("cancelBtn");

	var products = document.querySelector("#payment-products");

	var recruitmentProcess = document.querySelector(".recruitment-process");

	var totalPrice = document.querySelector(".total-price span");


	products.querySelectorAll("a").forEach(function(product){

		product.addEventListener("click", function(){
			
			addProduct(this);

		});

	});

var editPstnCmmncdNm = "${recruitVO[0].pstnCmmncdNm}";

if(editPstnCmmncdNm != ""){
	
	esntlAjax(editPstnCmmncdNm);
	
}


function addProduct(product) {


	var isFirstProduct = recruitmentProcess.children.length === 0;

	// 첫 번째 상품이 아닐 경우, '>' 문자를 추가
	if (!isFirstProduct) {
		var separator = document.createElement("div");
		separator.classList.add("separator");
		separator.textContent = ">";
		recruitmentProcess.appendChild(separator);
	}


	var containerDiv = document.createElement("div");
	containerDiv.classList.add("d-flex", "flex-column", "align-items-center");
	containerDiv.setAttribute("data-order-number", number);

	var orderSpan = document.createElement("span");
	orderSpan.classList.add("order-number");
	orderSpan.style.marginRight = "65px";
	orderSpan.textContent = number + "차";
	

	containerDiv.append(orderSpan);


	var productClone = product.cloneNode(true);
	containerDiv.appendChild(productClone);


	recruitmentProcess.appendChild(containerDiv);
	
    var inputHiddenOrder = document.createElement("input");
    inputHiddenOrder.type = "hidden";
    inputHiddenOrder.name = "order";
    inputHiddenOrder.value = number;

    var inputHiddenPrice = document.createElement("input");
    inputHiddenPrice.type = "hidden";
    inputHiddenPrice.name = "price";
    inputHiddenPrice.value = product.getAttribute("value");

    var inputHiddenName = document.createElement("input");
    inputHiddenName.type = "hidden";
    inputHiddenName.name = "name";
    inputHiddenName.value = product.textContent.trim();

    recruitRegiForm.appendChild(inputHiddenOrder);
    recruitRegiForm.appendChild(inputHiddenPrice);
    recruitRegiForm.appendChild(inputHiddenName);


	number += 1;


	var productValue = parseInt(product.getAttribute("value"), 10);
	var currentValue = parseInt(totalPrice.textContent, 10);
	totalPrice.textContent = currentValue + productValue;



	containerDiv.addEventListener("click", function(){

		removeProduct(this);

	});

	

}

function updateOrderNumbers(){

	var currentOrder = 1;

	recruitmentProcess.querySelectorAll("div[data-order-number]").forEach(function(element){

		element.querySelector("span").textContent = currentOrder + "차";
		element.setAttribute("data-order-number", currentOrder);
		currentOrder += 1;


	});


	number = currentOrder;



};


var termsAndConditions = document.getElementById('terms-and-conditions');
var payButton = document.getElementById('pay-button');

termsAndConditions.addEventListener('scroll', function() {
	var element = this;

	//맨 아래까지 스크롤되었는지 확인
	if (element.scrollHeight - element.scrollTop === element.clientHeight) {
		payButton.disabled = false; //결제 버튼 활성화
	}
});


var radioYes = document.getElementById('radioYes');
var submitButton = document.getElementById('submitBtn');
var recruitRegiForm = document.getElementById("recruitRegiForm");
var payTotalPrice = document.getElementById("payTotalPrice");
var processAmt = document.getElementById("processAmt");
var payCloseBtn = document.getElementById("payCloseBtn");
var initBtn = document.getElementById("initBtn");

var confirmModal = new bootstrap.Modal(document.getElementById('confirmModal'));
var paymentModal = new bootstrap.Modal(document.getElementById('paymentModal'));
submitButton.addEventListener("click", function(){
	//날짜 입력값(startDate endDate의 값 체크) 체크 필요
    var fileAttachment = document.getElementById('recruitFile').files.length; // 파일이 첨부되었는지 길이로 확인
	var recruitCnt = document.getElementById("recruitCnt").value;
	var recruitTtl = document.getElementById("recruitTtl").value;
    
	var startDateInput = document.getElementById("startDate").value;
	var endDateInput = document.getElementById("endDate").value;
	
	if( (startDateInput == null || startDateInput=="") || endDateInput == null || endDateInput==""){
		Swal.fire({
            icon: 'error',
            title: '공고 시작일과 종료일은\n 필수입력값입니다.',
            confirmButtonText: '확인',
        });
		return;
		
	} 
// 	if( endDateInput == null || endDateInput==""){
// 		Swal.fire({
//             icon: 'error',
//             title: '공고 종료일은 필수입력값입니다.',
//             confirmButtonText: '확인',
//         });
// 		return;
// 	}
		
	
    var specialChars = /[^a-zA-Z0-9가-힣\s]/g; 
    if (specialChars.test(recruitTtl)) {
    	 Swal.fire({
             icon: 'error',
             title: '공고제목에 특수문자는 입력할 수 없습니다.',
             confirmButtonText: '확인',
         });
         recruitTtl = recruitTtl.replace(specialChars, ""); // 특수문자 제거
         return;
    }
    
    if (fileAttachment === 0) { // 파일이 첨부되지 않았을 경우
        Swal.fire({
            icon: 'error',  // 아이콘 타입 설정
            title: '파일이 첨부되지 않았습니다!',  // 제목
            text: '공고 등록을 위해서는 공고 첨부가 필요합니다.',  // 텍스트 내용
            confirmButtonText: '확인',  // 버튼 텍스트
        });
    	return;
    }
    
    if (!recruitCnt || isNaN(recruitCnt)) {
        Swal.fire({
            icon: 'error',
            title: '모집인원을 숫자로 입력해주세요.',
            confirmButtonText: '확인',
        });
        return;
    }
    

	
	
	
	
	
	
	if(this.innerText === "수정"){
		
		
		recruitRegiForm.action = "/myPage/enterprise/recruitEdit";
		console.log(recruitRegiForm);
		recruitRegiForm.submit();
		
	}else{
		
		if(radioYes.checked){

			paymentModal.show();


		}else if(radioNo.checked){

			confirmModal.show();

		}else{

	        Swal.fire({
	            icon: 'error',  // 아이콘 타입 설정
	            title: '프로세스 사용여부를 체크해주세요.',  // 제목
	            confirmButtonText: '확인',  // 버튼 텍스트
	        });
	    	return;
		}
		
	}

});

// //이전 주문번호를 로컬 스토리지에서 가져오는 함수
// function getPreviousOrderNumber() {
//     return localStorage.getItem('previousOrderNumber') || 1; // 저장된 값이 없을 경우 기본값으로 1을 반환
// }

// // 이전 주문번호를 로컬 스토리지에 저장하는 함수
// function setPreviousOrderNumber(previousOrderNumber) {
//     localStorage.setItem('previousOrderNumber', previousOrderNumber);
// }

// // 이전 주문번호 초기화
// let previousOrderNumber = getPreviousOrderNumber();

payButton.addEventListener("click", function(){
	
//		console.log(payTotalPrice.innerText);
	processAmt.value = payTotalPrice.innerText;
	
// 	console.log("createOrderNum");
	console.log(createOrderNum());
	IMP.init('imp24033840');
    IMP.request_pay({ // param
        pg: 'kakaopay',
        pay_method: "card",
        merchant_uid: createOrderNum(), //가맹점 주문번호 (아임포트를 사용하는 가맹점에서 중복되지 않은 임의의 문자열을 입력)
        name: "기업 프로세스이용금액", //결제창에 노출될 상품명
        amount: 1, //금액
        buyer_email : "samsung@ss.com", 
        buyer_name : "삼성_인사과",
        buyer_tel : "010-4444-8888",  // -있어야한다 
        buyer_addr: "서울특별시 강남구 삼성동",
        buyer_postcode: "123-456"
    }, function (rsp) {
    	console.log("카카오성공?");
		recruitRegiForm.submit();
    })
	
	
	
})

function shuffleNumber(num) {
    // 숫자를 문자열로 변환 후, 문자열을 배열로 변환하고 각 문자열을 숫자로 다시 변환합니다.
    const arr = String(num).split('').map(Number); 
    for (let i = arr.length - 1; i > 0; i--) {
        const j = Math.floor(Math.random() * (i + 1));
        [arr[i], arr[j]] = [arr[j], arr[i]]; // 요소를 섞습니다.
    }
    // 배열을 다시 문자열로 결합하여 숫자로 변환하여 반환합니다.
    return Number(arr.join('')); 
}

function createOrderNum() {
    const date = new Date();
    const year = date.getFullYear();
    const month = date.getMonth() + 1;
    const day = date.getDate();
    
    // 연도, 월, 일을 조합하여 8자리의 숫자로 만듭니다.
    const combinedNumber = parseInt(String(year) + String(month) + String(day));
    const shuffledNumber = shuffleNumber(combinedNumber);
//     console.log(shuffledNumber);
    return shuffledNumber;
}

cancelBtn.addEventListener("click", function(){
	
	window.history.back();
	
});



//모달 창 초기화.
payCloseBtn.addEventListener("click", function(){
	
    while (recruitmentProcess.firstChild) {
        recruitmentProcess.removeChild(recruitmentProcess.firstChild);
    }
    number = 1; 
    totalPrice.textContent = '0';
    
    ["order", "price", "name"].forEach(fieldName => {
        var elements = document.getElementsByName(fieldName);
        while(elements[0]) {
            elements[0].remove();
        }
    });
	
})


initBtn.addEventListener("click", function(){
	
	while (recruitmentProcess.firstChild) {
        recruitmentProcess.removeChild(recruitmentProcess.firstChild);
    }
    number = 1; 
    totalPrice.textContent = '0';
    
    ["order", "price", "name"].forEach(fieldName => {
        var elements = document.getElementsByName(fieldName);
        while(elements[0]) {
            elements[0].remove(); 
        }
    });
	
	
});
});


function esntlLangAjax(ptsAjax) {
	
	var esntlValue = "${esntlMap}";
	var htmlContent = "";
	
    ptsAjax.forEach(function(item, idx) {
    	
        var isChecked = esntlValue.includes(item.cmmncdNm1) ? ' checked' : '';

        htmlContent += '<div class="form-check" style="padding-left: 0rem;">';
        htmlContent += '<input type="checkbox" id="list' + idx + '" class="form-check-input" style="display:none;" name="esntlLangCmmncdNms" value="' + item.cmmncdNm1 + '"' + isChecked + '>';
        htmlContent += '<label class="form-check-label" for="list' + idx + '"><span class="checkbox_img"></span>' + item.cmmncdNm1 + '</label>';
        htmlContent += '</div>';
        
    });
    
    var languagesContainer = document.querySelector(".languages-container");
    var languagesList = document.getElementById("languages-list");
    var initialInput = document.getElementById("initial-input");
    
    if (initialInput) {
        initialInput.style.display = "none";
    }

    languagesContainer.style.backgroundColor = "#e9ecef"; // 배경색 설정
    languagesContainer.style.border = "1px solid #ced4da"; // 테두리 설정
    languagesContainer.style.padding = "10px"; // 테두리 설정
    languagesList.innerHTML = htmlContent; // 체크박스 추가
}
</script>
