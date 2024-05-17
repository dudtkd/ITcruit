<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
    
<%-- <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/jobzillaassets/css/bootstrap.min.css"><!-- BOOTSTRAP STYLE SHEET --> --%>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/jobzillaassets/css/font-awesome.min.css"><!-- FONTAWESOME STYLE SHEET -->
<%-- <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/jobzillaassets/css/feather.css"><!-- FEATHER ICON SHEET --> --%>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/jobzillaassets/css/owl.carousel.min.css"><!-- OWL CAROUSEL STYLE SHEET -->
<%-- <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/jobzillaassets/css/magnific-popup.min.css"><!-- MAGNIFIC POPUP STYLE SHEET --> --%>
<%-- <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/jobzillaassets/css/lc_lightbox.css"><!-- Lc light box popup -->      --%>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/jobzillaassets/css/bootstrap-select.min.css"><!-- BOOTSTRAP SLECT BOX STYLE SHEET  -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/jobzillaassets/css/dataTables.bootstrap5.min.css"><!-- DATA table STYLE SHEET  -->
<%-- <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/jobzillaassets/css/select.bootstrap5.min.css"><!-- DASHBOARD select bootstrap  STYLE SHEET  -->      --%>
<%-- <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/jobzillaassets/css/dropzone.css"><!-- DROPZONE STYLE SHEET --> --%>
<%-- <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/jobzillaassets/css/scrollbar.css"><!-- CUSTOM SCROLL BAR STYLE SHEET --> --%>
<%-- <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/jobzillaassets/css/datepicker.css"><!-- DATEPICKER STYLE SHEET --> --%>
<%-- <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/jobzillaassets/css/flaticon.css"> <!-- Flaticon --> --%>
<%-- <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/jobzillaassets/css/swiper-bundle.min.css"><!-- Swiper Slider --> --%>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/jobzillaassets/css/style.css"><!-- MAIN STYLE SHEET -->

<%-- <link rel="stylesheet" class="skin" type="text/css" href="${pageContext.request.contextPath }/resources/jobzillaassets/css/skins-type/skin-6.css"> --%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<style>
/* 헤더,푸더랑 좌우간격 맞춤 */
.page-content {
  margin-left: 0rem;
}
.twm-log-reg-form-wrap {
    width: 1300px; /* 너비 설정 */
    margin: 0 auto; /* 좌우 여백을 auto로 설정하여 요소를 가운데 정렬 */
    padding: 30px 0; /* 위아래 여백 설정 */
    border-radius: 10px;
    background-color: #fff;
}
.twm-log-reg-form-wrap .twm-log-reg-inner .twm-tabs-style-2 {
    text-align: center;
    border: 1px #786be4 solid;
}
.form-control {
    height: 50px;
    padding: 5px;
    background-color: #e4e1fc;
}
.twm-tabs-style-2 {
    border: 1px black solid;
    width: 600px;
    margin: 0 auto;
}
.twm-tabs-style-2 .nav-tabs .nav-item .nav-link {
	padding: 0px;
	margin: 0px;
	border-radius: 0px;
	border: 1px #786be4 solid;
	color: #8d7ffc;
}
.filebox .upload-name {
    display: inline-block;
    height: 40px;
    padding: 0 10px;
    vertical-align: middle;
    border: 1px solid #dddddd;
    width: 77%;
    color: #999999;
}
.filebox label {
    display: inline-block;
    padding: 10px 20px;
    color: #fff;
    vertical-align: middle;
    background-color: #999999;
    cursor: pointer;
    height: 40px;
    margin-left: 10px;
}
.filebox input[type="file"] {
    position: absolute;
    width: 0;
    height: 0;
    padding: 0;
    overflow: hidden;
    border: 0;
}

.container-fluid {
	padding-top: 40px;
	padding-bottom: 10px;
}
.nameList {
    height: auto;
    position: relative;
    top: 10px;
    left: 5px;
    border-radius: 3px;
}
#entNm {
	width: 400px;
}
.nameUl {
	list-style-type:none;
}
.names{
	text-align: left;
	height: 40px;
	width: 318px;
	background-color: #f0f6fe;
	border: 1px solid lightgray;
	margin-left: 120px;
}
.companyName {
	position: relative;
    top: 7px;
    left: 3px;
}
.companyName:hover {
	text-decoration: underline;
	cursor: pointer;
}
.twm-tabs-style-2 .nav-tabs .nav-item .nav-link.active {
    background-color: #786be4 !important;
    color: #fff;
}
.site-button, #sendTell, .btn-primary, #checkTell{
    background-color: #8d7ffc;
    border: #8d7ffc;
}
.site-button:hover, #sendTell:hover, .btn-primary:hover, #checkTell:hover{
    background-color: #7065c9;
    border: #7065c9;
}
.form-check-input:checked {
    background-color: #7065c9;
    border-color: #7065c9;
}
.site-text-primary {
    color: #8d7ffc;
}

</style>
<c:if test="${act eq 'act' }">
	<script>
        $(function() {
        	$('#member').removeClass('active');
            $('#enterprise').addClass('active');
            $('#twm-Employer-Signup').addClass('active show');
        	$("#memSignupForm").css("display","none");
    	    $("#entSignupForm").css("display","block");
        });
    </script>
</c:if>
<c:if test="${act ne 'act' }">
	<script>
        $(function() {
        	$('#enterprise').removeClass('active');
            $('#member').addClass('active');
            $('#twm-candidate-Signup').addClass('active show');
        	$("#entSignupForm").css("display","none");
    	    $("#memSignupForm").css("display","block");
        });
    </script>
</c:if>
<body>

	<div class="page-wraper">
	
	
        <!-- CONTENT START -->
        <div class="page-content">
        
        
            <!-- Register Section Start -->
            <div class="section-full site-bg-white">
            
                <div class="container-fluid">
                    <div class="row">
                    
                            <div class="twm-log-reg-form-wrap">
<!--                                 <div class="twm-log-reg-logo-head"> -->
<!--                                     <a href="/main/index"> -->
<%--                                         <img src="${pageContext.request.contextPath }/resources/assets/images/logo1(배경0).png" alt="" class="logo"> --%>
<!--                                     </a>  -->
<!--                                 </div> -->
                                <div class="twm-log-reg-inner">
                                    <div class="twm-log-reg-head">
                                        <div class="twm-log-reg-logo">
                                            <span class="log-reg-form-title"></span>
                                        </div>
                                    </div>
                                    
                                    <div class="twm-tabs-style-2">
                                        <ul class="nav nav-tabs" id="myTab" role="tablist">
        
                                            <!--Signup Candidate-->  
                                            <li class="nav-item" role="presentation">
                                                <button style="width: 299px; height: 60px;" class="nav-link"  
                                                	data-bs-toggle="tab" data-bs-target="#twm-candidate-Signup" 
                                                	type="button" id="member"><i class="fas fa-user-tie"></i>개인회원</button>
                                            </li>
                                            <!--Signup Employer-->
                                            <li class="nav-item" role="presentation">
                                                <button style="width: 299px; height: 60px;" class="nav-link" 
                                                data-bs-toggle="tab" data-bs-target="#twm-Employer-Signup" 
                                                type="button" id="enterprise"><i class="fas fa-building"></i>기업회원</button>
                                            </li>
                                        
                                        </ul>
                                        
                                        <div class="tab-content" id="myTabContent">
                                        
                                        	<!-- 개인회원 회원가입 -->
                                       		<form action="/account/member/signup.do" method="post" id="memSignupForm">
	                                            <!--Candidate Signup Content-->  
	                                            <div class="tab-pane fade" id="twm-candidate-Signup">
	                                                <div class="row justify-content-center">
	        
	                                                    <div class="col-md-10">
	                                                        <div class="form-group mb-3 d-flex align-items-center">
	                                                        	<label for="accountNm" class="mr-5" style="white-space: nowrap; display: inline-block; width: 120px; text-align: left;">이름</label>
	                                                        	<input name="accountNm" id="accountNm" type="text" class="form-control" placeholder="실명 입력">
	                                                        </div>
	                                                    </div>
	
	                                                    <div class="col-md-10">
	                                                        <div class="form-group mb-3 d-flex align-items-center">
	                                                        	<label for="accountId" class="mr-5" style="white-space: nowrap; display: inline-block; width: 120px; text-align: left;">아이디</label>
	                                                            <input name="accountId" id="accountId" type="text" class="form-control" maxlength="20" placeholder="영어대소문자+숫자 조합 최대20자리">
	                                                        </div>
	                                                        <div id="accountIdMessage" style="display: none; text-align: left;"></div>
	                                                    </div>
	
	                                                    <div class="col-md-10">
	                                                        <div class="form-group mb-3 d-flex align-items-center">
	                                                        	<label for="accountPswd" class="mr-5" style="white-space: nowrap; display: inline-block; width: 120px; text-align: left;">비밀번호</label>
	                                                            <input name="accountPswd" id="accountPswd" type="password" class="form-control" maxlength="20" placeholder="영어대소문자+숫자+특수문자 조합 10~20자리" required>
	                                                        </div>
	                                                    </div>
	
	                                                    <div class="col-md-10">
	                                                        <div class="form-group mb-3 d-flex align-items-center">
	                                                        	<label for="reaccountPswd" class="mr-5" style="white-space: nowrap; display: inline-block; width: 120px; text-align: left;">비밀번호 확인</label>
	                                                            <input name="reaccountPswd" id="reaccountPswd" type="password" class="form-control" maxlength="20" placeholder="영어대소문자+숫자+특수문자 조합 10~20자리">
	                                                        </div>
	                                                    </div>
	                                                    
	                                                    <div class="col-md-10">
	                                                    	<div class="row align-items-center">
	                                                            <div class="col-md-7">
			                                                        <div class="form-group mb-3 d-flex align-items-center">
			                                                        	<label for="birthYmd" class="mr-5" style="white-space: nowrap; display: inline-block; width: 120px; text-align: left;">생년월일</label>
			                                                            <input name="birthYmd" id="birthYmd" type="text" class="form-control" maxlength="8" style="position: relative; left: 12px;" placeholder="ex) 19940101">
			                                                        </div>
			                                                    </div>
			                                                    <div class="col-md-5">
			                                                    	<div class="form-group mb-3 d-flex align-items-center justify-content-center">
				                                                    	<div class="icheck-primary d-inline">
																			<input type="radio" id="memGenderM" name="gender" value="M" checked="checked">
																			<label for="memGenderM">남자&nbsp;&nbsp;&nbsp;</label>
																		</div>
																		<div class="icheck-primary d-inline">
																			<input type="radio" id="memGenderF" name="gender" value="F">
																			<label for="memGenderF">여자 </label>
																		</div>
																	</div>
																</div>
															</div>
	                                                    </div>
	                                                    
	                                                    <div class="col-md-10">
	                                                        <div class="row align-items-center">
	                                                            <div class="col-md-7">
	                                                                <div class="form-group mb-3 d-flex align-items-center">
	                                                                	<label for="accountMail" class="mr-5" style="white-space: nowrap; display: inline-block; width: 120px; text-align: left;">이메일</label>
	                                                                    <input name="accountMail" id="accountMail" type="text" class="form-control" placeholder="" style="display: none;">
	                                                                    <input name="email1" id="email1" type="text" style="position: relative; left: 12px;" class="form-control" placeholder="">
	                                                                </div>
	                                                            </div>
	                                                            <div class="col-md-5">
	                                                                <div class="form-group mb-3 d-flex align-items-center">
	                                                                    <div class="input-group" id="emailBox">
	                                                                        <span class="input-group-text">@</span>
	                                                                        <select name="site" id="site" class="form-select">
	                                                                            <option value="none">선택</option>
	                                                                            <option value="naver.com">naver.com</option>
	                                                                            <option value="hanmail.net">hanmail.net</option>
	                                                                            <option value="daum.net">daum.net</option>
	                                                                            <option value="nate.com">nate.com</option>
	                                                                            <option value="gmail.com">gmail.com</option>
	                                                                            <option value="hotmail.com">hotmail.com</option>
	                                                                            <option value="self">직접입력</option>
	                                                                        </select>
	                                                                    </div>
	                                                                </div>
	                                                            </div>
	                                                        </div>
	                                                    </div>
	                                                    
	                                                    <div class="col-md-10">
	                                                        <div class="form-group mb-3 d-flex align-items-center">
	                                                            <div class="input-group align-items-center">
	                                                            	<label for="accountTell" class="mr-5" style="white-space: nowrap; display: inline-block; width: 120px; text-align: left; margin: 0px 0px 0px 0px;">휴대폰번호</label>
	                                                                <input name="accountTell" id="accountTell" type="text" class="form-control" style="position: relative; right: 20px; border-radius: 10px;" maxlength="11" placeholder="숫자입력 ( - 제외)">
	                                                                <button type="button" id="sendTell" class="btn btn-primary" style="border-radius: .25rem; height: 50px">인증번호 전송</button>
	                                                            </div>
	                                                        </div>
	                                                    </div>
	                                                
	                                                    <div class="col-md-10">
	                                                        <div class="form-group mb-3 d-flex align-items-center">
	                                                            <div class="input-group align-items-center">
	                                                            	<label for="checkNumber" class="mr-5" style="white-space: nowrap; display: inline-block; width: 120px; text-align: left;">인증번호</label>
	                                                                <input name="checkNumber" id="checkNumber" type="text" class="form-control" style="position: relative; right: 20px; border-radius: 10px;" placeholder="인증번호 입력">
	                                                                <div class="input-group-append">
	                                                                    <button type="button" id="checkTell" class="btn btn-success" style="height: 50px; width: ">확인</button>
	                                                                    <button type="button" id="reSend" class="btn btn-secondary" style="height: 50px;">재전송</button>
	                                                                </div>
	                                                            </div>
	                                                        </div>
	                                                    </div>
	
	                                                    <div class="col-md-10">
	                                                        <div class="form-group mb-3 d-flex align-items-center">
	                                                            <div class="input-group align-items-center">
	                                                            	<label for="accountZip" class="mr-5" style="white-space: nowrap; display: inline-block; width: 120px; text-align: left;">우편번호</label>
	                                                                <input name="accountZip" id="accountZip" type="text" class="form-control" style="position: relative; right: 20px; border-radius: 10px;" placeholder="">
	                                                                <button type="button" onclick="DaumPostcode()" class="btn btn-primary" style="height: 50px; border-radius: .25rem;">주소 찾기</button>
	                                                            </div>
	                                                        </div>
	                                                    </div>
	
	                                                    <div class="col-md-10">
	                                                        <div class="form-group mb-3 d-flex align-items-center">
	                                                      		<label for="accountAddr1" class="mr-5" style="white-space: nowrap; display: inline-block; width: 120px; text-align: left;">주소</label>
	                                                            <input name="accountAddr1" id="accountAddr1" type="text" class="form-control" placeholder="">
	                                                        </div>
	                                                    </div>
	
	                                                    <div class="col-md-10">
	                                                        <div class="form-group mb-3 d-flex align-items-center">
	                                                        	<label for="accountAddr2" class="mr-5" style="white-space: nowrap; display: inline-block; width: 120px; text-align: left;">상세주소</label>
	                                                            <input name="accountAddr2" id="accountAddr2" type="text" class="form-control" placeholder="">
	                                                        </div>
	                                                    </div>
	
	                                                    <div class="col-md-10">
	                                                        <div class="form-group mb-3">
	                                                            <div class="form-check">
	                                                                <input type="checkbox" class="form-check-input" id="agree1">
	                                                                <label class="form-check-label" for="agree1"><i>[전체동의]  </i>필수동의 항목에 모두 동의합니다</label>
	                                                            </div>
	                                                            <hr>
	                                                        </div>
	                                                    </div>
	                                                    
	                                                    <div class="col-md-10">
	                                                        <div class="form-group mb-3">
	                                                            <div class="form-check">
	                                                                <input type="checkbox" class="form-check-input" id="agree2">
	                                                                <label class="form-check-label" for="agree2">
	                                                                    <span><i style="color: red;">[필수]  </i>만 15세 이상입니다</span>
	                                                                </label>
	                                                            </div>
	                                                            <div class="form-check">
	                                                                <input type="checkbox" class="form-check-input" id="agree3">
	                                                                <label class="form-check-label" for="agree3">
	                                                                    <span><i style="color: red;">[필수]  </i>이용약관 동의</span>
	                                                                </label>
	                                                            </div>
	                                                            <div class="form-check">
	                                                                <input type="checkbox" class="form-check-input" id="agree4">
	                                                                <label class="form-check-label" for="agree4">
	                                                                    <span><i style="color: red;">[필수]  </i>개인정보 수집 및 이용 동의</span>
	                                                                    <button type="button" id="testBtn" style="background-color: white; float: right; border: 0px; position: relative; left: 220px;">TEST</button>
	                                                                </label>
	                                                            </div>
	                                                        </div>
	                                                    </div>
	                                                    
	                                                    <div class="col-md-10">
	                                                        <div class="form-group">
	                                                            <button type="button" class="site-button" id="memSignupBtn">가입하기</button>
	                                                        </div>
	                                                    </div>
	        
	                                                </div>
	                                            </div>
	                                            <sec:csrfInput/>
                                            </form>
                                            
                                            
                                            <!-- 기업회원 회원가입 -->
                                       		<form action="/account/enterprise/signup.do" method="post" id="entSignupForm" style="display: none" enctype="multipart/form-data">
                                            <!--Employer Signup Content--> 
                                            <div class="tab-pane fade" id="twm-Employer-Signup">
                                                <div class="row justify-content-center">
        
                                                    <div class="col-md-10">
                                                        <div class="form-group mb-3 d-flex align-items-center">
                                                       		<div class="input-group d-flex align-items-center">
                                                       			<label for="entNm" class="mr-5" style="white-space: nowrap; display: inline-block; width: 120px; text-align: left;">회사명</label>
                                                            	<input name="entNm" id="entNm" type="text" required class="form-control" style="width: 310px; border-radius: 10px;" placeholder="회사명 입력 후 검색을 눌러주세요">
                                                            	<button type="button" class="btn btn-secondary" id="entBtn" style="height: 50px; border-radius: .25rem;">검색</button>
                                                            	<div id="nameList" class="" style="position: relative; display: none;">
                                                            		<ul class="nameUl">
																		<li class="names"><span class="companyName">삼성물산</span></li>                                                            		
																		<li class="names"><span class="companyName">삼성전자</span></li>                                                            		
																		<li class="names"><span class="companyName">삼성화재</span></li>                                                            		
                                                            		</ul>
                                                            	</div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    
                                                    
                                                    <div class="col-md-10">
                                                        <div class="form-group mb-3 d-flex align-items-center">
                                                            <div class="input-group d-flex align-items-center">
                                                            	<label for="brno" class="mr-5" style="white-space: nowrap; display: inline-block; width: 120px; text-align: left;">사업자등록번호</label>
                                                                <input name="brno" id="brno" type="text" class="form-control" style="border-radius: 10px;" placeholder="숫자입력 ( - 제외)">
                                                                <button type="button" class="btn btn-secondary" id="brnoBtn" style="height: 50px; border-radius: .25rem;">인증</button>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    
                                                    <div class="col-md-10">
                                                        <div class="form-group mb-3 d-flex align-items-center">
                                                        	<label for="rprsvNm" class="mr-5" style="white-space: nowrap; display: inline-block; width: 120px; text-align: left;">대표자명</label>
                                                            <input name="rprsvNm" id="rprsvNm" class="form-control" style="position: relative; width: 375px;" required placeholder="실명 입력">
                                                        </div>
                                                    </div>
                                                    
                                                    <div class="col-md-10">
                                                        <div class="form-group mb-3 d-flex align-items-center">
                                                        	<label for="rprsTelno" class="mr-5" style="white-space: nowrap; display: inline-block; width: 120px; text-align: left;">대표번호</label>
                                                            <input name="rprsTelno" id="rprsTelno" type="text" class="form-control" style="position: relative; width: 375px;" required placeholder="숫자입력 ( - 제외)">
                                                        </div>
                                                    </div>

													<div class="col-md-10">
                                                        <div class="form-group mb-3 d-flex align-items-center">
                                                            <div class="input-group d-flex align-items-center">
                                                            	<label for="AccountZip" class="mr-5" style="white-space: nowrap; display: inline-block; width: 120px; text-align: left;">우편번호</label>
                                                                <input name="accountZip" id="AccountZip" type="text" class="form-control" style="border-radius: 10px;" placeholder="">
                                                                <button type="button" onclick="DaumPostcode1()" class="btn btn-primary" style="height: 50px; border-radius: .25rem;">주소 찾기</button>
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <div class="col-md-10">
                                                        <div class="form-group mb-3 d-flex align-items-center">
                                                        	<label for="AccountAddr1" class="mr-5" style="white-space: nowrap; display: inline-block; width: 120px; text-align: left;">주소</label>
                                                            <input name="accountAddr1" id="AccountAddr1" type="text" class="form-control" style="position: relative; width: 375px;" placeholder="">
                                                        </div>
                                                    </div>

                                                    <div class="col-md-10">
                                                        <div class="form-group mb-3 d-flex align-items-center">
                                                        	<label for="AccountAddr2" class="mr-5" style="white-space: nowrap; display: inline-block; width: 120px; text-align: left;">상세주소</label>
                                                            <input name="accountAddr2" id="AccountAddr2" type="text" class="form-control" style="position: relative; width: 375px;" placeholder="">
                                                        </div>
                                                    </div>
                                                    
                                                    <div class="col-md-10">
                                                        <div class="form-group mb-3 d-flex align-items-center">
		                                                    <div class="filebox d-flex align-items-center justify-content-end">
		                                                    	<span style="white-space: nowrap; display: inline-block; width: 120px; text-align: left;">사업자등록증</span>
															    <input class="upload-name" id="upload-file" style="width: 260px; font-size: 12px;" value="첨부파일의 최대 용량은 10MB 이하로 첨부" placeholder="첨부파일의 최대 용량은 10MB 이하로 첨부">
															    <label for="brnoFile" style="width: 100px;">파일선택</label> 
															    <input type="file" id="brnoFile" name="brnoFile">
															</div>
                                                    	</div>
                                                    </div>
                                                    
                                                    <div class="col-md-10">
                                                        <div class="form-group mb-3 d-flex align-items-center">
		                                                    <div class="filebox d-flex align-items-center justify-content-end">
		                                                    	<span style="white-space: nowrap; display: inline-block; width: 120px; text-align: left;">로고</span>
															    <input class="upload-name" id="upload-logo" style="width: 260px; font-size: 12px;" value="로고" placeholder="로고">
															    <label for="entImg" style="width: 100px;">파일선택</label> 
															    <input type="file" id="entImg" name="entLogoImg">
															</div>
                                                    	</div>
                                                    </div>
                                                    
													<div class="col-md-10">
                                                        <div class="form-group mb-3 d-flex align-items-center">
                                                        	<label for="bizTypeNm" class="mr-5" style="white-space: nowrap; display: inline-block; width: 120px; text-align: left;">기업형태</label>
                                                            <input name="bizTypeNm" id="bizTypeNm" type="text" required class="form-control" style="position: relative; width: 375px;" placeholder="ex) 대기업">
                                                        </div>
                                                    </div>
													<div class="col-md-10">
                                                        <div class="form-group mb-3 d-flex align-items-center">
                                                        	<label for="ksicNm" class="mr-5" style="white-space: nowrap; display: inline-block; width: 120px; text-align: left;">산업</label>
                                                            <input name="ksicNm" id="ksicNm" type="text" required class="form-control" style="position: relative; width: 375px;" placeholder="ex) 정보서비스업">
                                                        </div>
                                                    </div>
													<div class="col-md-10">
                                                        <div class="form-group mb-3 d-flex align-items-center">
                                                        	<label for="fndnYr" class="mr-5" style="white-space: nowrap; display: inline-block; width: 120px; text-align: left;">설립일</label>
                                                            <input name="fndnYr" id="fndnYr" type="text" required class="form-control" style="position: relative; width: 375px;" placeholder="ex) 19800309">
<%--                                                             <fmt:formatNumber pattern="#,###"></fmt:formatNumber> --%>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-10">
                                                        <div class="form-group mb-3 d-flex align-items-center">
                                                        	<label for="empCnt" class="mr-5" style="white-space: nowrap; display: inline-block; width: 120px; text-align: left;">사원수</label>
                                                            <input name="empCnt" id="empCnt" type="text" required class="form-control" style="position: relative; width: 375px;" placeholder="ex) 230000">
                                                        </div>
                                                    </div>
                                                    <div class="col-md-10">
                                                        <div class="form-group mb-3 d-flex align-items-center">
                                                        	<label for="cptl" class="mr-5" style="white-space: nowrap; display: inline-block; width: 120px; text-align: left;">자본금</label>
                                                            <input name="cptl" id="cptl" type="text" required class="form-control" style="position: relative; width: 375px;" placeholder="ex) 54000000">
                                                        </div>
                                                    </div>
                                                    <div class="col-md-10">
                                                        <div class="form-group mb-3 d-flex align-items-center">
                                                        	<label for="entSlsAmt" class="mr-5" style="white-space: nowrap; display: inline-block; width: 120px; text-align: left;">전년매출</label>
                                                            <input name="entSlsAmt" id="entSlsAmt" type="text" required class="form-control" style="position: relative; width: 375px;" placeholder="ex) 453000000">
                                                        </div>
                                                    </div>
                                                    <div class="col-md-10">
                                                        <div class="form-group mb-3 d-flex align-items-center">
                                                        	<label for="entEbit" class="mr-5" style="white-space: nowrap; display: inline-block; width: 120px; text-align: left;">영업이익</label>
                                                            <input name="entEbit" id="entEbit" type="text" required class="form-control" style="position: relative; width: 375px;" placeholder="ex) 30000000">
                                                        </div>
                                                    </div>
                                                    <div class="col-md-10">
                                                        <div class="form-group mb-3 d-flex align-items-center">
                                                        	<label for="entUrl" class="mr-5" style="white-space: nowrap; display: inline-block; width: 120px; text-align: left;">URL</label>
                                                            <input name="entUrl" id="entUrl" type="text" required class="form-control" style="position: relative; width: 375px;" placeholder="ex) www.naver.com">
                                                        </div>
                                                    </div>
													
                                                    <div class="col-md-10">
                                                        <div class="form-group mb-3 d-flex align-items-center">
                                                        	<label for="entAccountId" class="mr-5" style="white-space: nowrap; display: inline-block; width: 120px; text-align: left;">아이디</label>
                                                            <input name="loginId" id="entAccountId" type="text" required class="form-control" maxlength="20" style="position: relative; width: 375px;" placeholder="영어대소문자+숫자 조합 최대20자리">
                                                        </div>
                                                        <div id="entAccountIdMessage" style="display: none; text-align: left;"></div>
                                                    </div>

                                                    <div class="col-md-10">
                                                        <div class="form-group mb-3 d-flex align-items-center">
                                                        	<label for="entAccountPswd" class="mr-5" style="white-space: nowrap; display: inline-block; width: 120px; text-align: left;">비밀번호</label>
                                                            <input name="accountPswd" id="entAccountPswd" type="password" required class="form-control" maxlength="20" style="position: relative; width: 375px;" placeholder="영어대소문자+숫자+특수문자 조합 10~20자리">
                                                        </div>
                                                    </div>

                                                    <div class="col-md-10">
                                                        <div class="form-group mb-3 d-flex align-items-center">
                                                        	<label for="entReaccountPswd" class="mr-5" style="white-space: nowrap; display: inline-block; width: 120px; text-align: left;">비밀번호 확인</label>
                                                            <input name="reaccountPswd" id="entReaccountPswd" type="password" required class="form-control" maxlength="20" style="position: relative; width: 375px;" placeholder="영어대소문자+숫자+특수문자 조합 10~20자리">
                                                        </div>
                                                    </div>
        
                                                    <div class="col-md-10">
                                                        <div class="form-group mb-3 d-flex align-items-center">
                                                        	<label for="entAccountNm" class="mr-5" style="white-space: nowrap; display: inline-block; width: 120px; text-align: left;">가입자명</label>
                                                            <input name="accountNm" id="entAccountNm" type="text" class="form-control" required style="position: relative; width: 375px;" placeholder="ex) 회사명_인사과">
                                                        </div>
                                                    </div>

                                                    <div class="col-md-10">
                                                        <div class="form-group mb-3 d-flex align-items-center">
                                                        	<label for="accountEntTell" class="mr-5" style="white-space: nowrap; display: inline-block; width: 120px; text-align: left;">전화번호</label>
                                                            <input name="accountTell" id="accountEntTell" type="text" class="form-control" required maxlength="11" style="position: relative; width: 375px;" placeholder="인사관리과 전화번호(숫자입력 ( - 제외))">
                                                        </div>
                                                    </div>

                                                    <div class="col-md-10">
                                                        <div class="form-group mb-3 d-flex align-items-center">
                                                            <div class="input-group  d-flex align-items-center">
                                                            	<label for="entAccountMail" class="mr-5" style="white-space: nowrap; display: inline-block; width: 120px; text-align: left;">이메일</label>
                                                                <input name="accountMail" id="entAccountMail" type="text" class="form-control" style="border-radius: 10px;" required placeholder="이메일">
                                                                <span class="input-group-text" style="border: none; background-color: #e4e1fc; height: 50px; margin: -7px;">@</span>
                                                                <input name="entSite" id="entSite" type="text" class="form-control" required placeholder="회사 이메일 주소만 입력">
                                                            </div>
                                                        </div>
                                                    </div>

													
	                                                    
	                                                    
                                                    <div class="col-md-10">
                                                        <div class="form-group mb-3">
                                                            <div class=" form-check">
                                                                <label class="form-check-label" for="agree5"><i>[전체동의]  </i>필수동의 항목에 모두 동의합니다</label>
                                                                <input type="checkbox" class="form-check-input" id="agree5">
                                                            </div>
                                                            <hr>
                                                        </div>
                                                    </div>
                                                    
                                                    <div class="col-md-10">
                                                        <div class="form-group mb-3">
                                                            <div class=" form-check">
                                                               	<input type="checkbox" class="form-check-input" id="agree6">
                                                       			<label class="form-check-label" for="agree6">
                                                       				<span><i style="color: red;">[필수]  </i>이용약관 동의</span>
                                                       			</label>
                                                            </div>
                                                            <div class="form-check">
                                                               	<input type="checkbox" class="form-check-input" id="agree7">
                                                               	<label class="form-check-label" for="agree7">
                                                               		<span><i style="color: red;">[필수]  </i>개인정보 수집 및 이용 동의</span>
                                                               	</label>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    
	                                                            
                                                    <div class="col-md-10">
                                                        <div class="form-group">
                                                            <button type="button" class="site-button" id="entSignupBtn">가입하기</button>
                                                        </div>
                                                    </div>
                                                    
                                                </div>
                                            </div>
                                            <sec:csrfInput/>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                    </div>
                </div>
            </div>   
            <!-- Register Section End -->
        </div>
        <!-- CONTENT END -->
 	</div>


</body>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">
$(function(){
	var testBtn = $("#testBtn");
	testBtn.on("click", function(){
// 		console.log("!@#");
		var accountNm = "김현태";
		var accountId = "gusxo123";
		var accountPswd = "123qwe!@#QWE";
		var reaccountPswd = "123qwe!@#QWE";
		var birthYmd = "19930711";
		var email1 = "gusxo123";
		var accountTell = "01033913947";
		var accountZip = "34908";
		var accountAddr1 = "대전 중구 계룡로 846";
		var accountAddr2 = "3층";
		$("#accountNm").val(accountNm);
		$("#accountId").val(accountId);
		$("#accountPswd").val(accountPswd);
		$("#reaccountPswd").val(reaccountPswd);
		$("#birthYmd").val(birthYmd);
		$("#email1").val(email1);
		$("#accountTell").val(accountTell);
		$("#accountZip").val(accountZip);
		$("#accountAddr1").val(accountAddr1);
		$("#accountAddr2").val(accountAddr2);
	});
});

// 아이디 비교
$("#accountId").focusout(function() {
	var accountId = $("#accountId").val();

	if (!accountId) {
        return;
    }
    
	var data = {
		accountId : accountId
	}
	console.log(accountId);
	$.ajax({
		type : "post",
		url : "/account/member/checkId.do",
		contentType : "application/json; charset=utf-8",
		data : JSON.stringify(data),
		beforeSend: function(xhr) {
            xhr.setRequestHeader(header, token);
        },
		cache : false,
		success : function(data){
			console.log(data);
			if (data) {
                // 데이터베이스에 해당 accountId가 이미 존재하는 경우
                $("#accountIdMessage").css("color", "red");
                $("#accountIdMessage").css("font-size", "smaller");
                $("#accountIdMessage").css("text-align", "left");
                $("#accountIdMessage").css("margin-top", "-12px");
                $("#accountIdMessage").text("*이미 사용 중인 아이디입니다.");
            } else {
                // 데이터베이스에 해당 accountId가 존재하지 않는 경우
            	$("#accountIdMessage").css("color", "green");
            	$("#accountIdMessage").css("font-size", "smaller");
                $("#accountIdMessage").css("text-align", "left");
                $("#accountIdMessage").css("margin-top", "-12px");
                $("#accountIdMessage").text("*사용가능한 아이디입니다.");
            }
			$("#accountIdMessage").show();
		}
	});

});
// 비밀번호 비교
$("#accountPswd, #reaccountPswd").keyup(function() {
    var password = $("#accountPswd").val();
    var confirmPassword = $("#reaccountPswd").val();
//     console.log(" password  "+password);
//     console.log(" confirmPassword  "+confirmPassword);

    // 비밀번호와 재입력 비밀번호가 모두 입력되었는지 확인
    if (password !== '' && confirmPassword !== '') {
        // 비밀번호와 재입력 비밀번호가 일치하는지 확인
        if (password === confirmPassword) {
            // 일치할 경우
            $("#accountPswd, #reaccountPswd").css("color", "green"); // 입력 필드의 텍스트 색상을 초록색으로 변경
        } else {
            // 일치하지 않을 경우
            $("#accountPswd, #reaccountPswd").css("color", "red"); // 입력 필드의 텍스트 색상을 빨간색으로 변경
        }
    } else {
        // 비밀번호나 재입력 비밀번호가 아직 입력되지 않은 경우
        $("#accountPswd, #reaccountPswd").css("color", ""); // 입력 필드의 텍스트 색상 초기화
    }
});
// 이메일 뒷부분
$(document).ready(function() {
    var enteredSiteValue = ""; // 입력된 사이트 값 저장 변수 추가

    $("#site").change(function() {
//     	$("#site option[value='self']").text("직접입력"); // 직접입력 옵션의 텍스트 변경
        var selectedValue = $(this).val(); // 선택된 사이트의 값 가져오기
        if (selectedValue == "self") {
            $(this).hide();
            $("#emailBox").append('<div><input type="text" id="customEmailInput" class="form-select" style="width: 196px" name="site"></div>');
            $("#customEmailInput").focus(); // 입력 필드에 포커스 주기
            console.log("self   " + selectedValue);
        } else {
            enteredSiteValue = selectedValue; // 선택된 옵션 값을 입력된 사이트 값으로 설정
            console.log("click   " + selectedValue);
            updateAccountMail(); // 이메일 주소 업데이트
        }
    });

    $(document).on("focusout", "#customEmailInput", function() {
        var enteredValue = $(this).val().trim(); // 입력 필드의 값 가져오기
        if (enteredValue !== '') {
            enteredSiteValue = enteredValue; // 입력된 값이 비어 있지 않을 때만 저장
            $("#site").show(); // 셀렉트 박스를 다시 보이게 함
            
         // 새로운 값을 선택한 후, 직접입력 옵션의 텍스트를 변경하고 다시 기본 "직접입력" 옵션으로 되돌림
            $("#site").append('<option value="' + enteredValue + '">' + enteredValue + '</option>');
            $("#site").val(enteredValue); // 새로운 값으로 셀렉트 박스 선택
            $("#site option[value='self']").text("직접입력");
            
            $(this).remove(); // 입력 필드 제거
            updateAccountMail(); // 이메일 주소 업데이트
        }
    });
    
    $("#site").click(function() {
        // 셀렉트 박스의 모든 옵션을 보이게 함
        $("#site option").show();
        
        // 추가된 옵션 중 첫 5개만 보이도록 함
        $("#site option:gt(7)").hide();
    });

//     $("#site").change(function() {
//         updateAccountMail(); // 이메일 주소 업데이트
//     });



    function updateAccountMail() {
        var email = $("#email1").val(); // 이메일 값 가져오기
        var site = enteredSiteValue; // 입력된 사이트 값 가져오기
        console.log("emailemailemail   " + email);
        console.log("sitesitesite   " + site);
        var accountMail = email + "@" + site; // 이메일과 사이트 조합
        console.log("accountMailaccountMailaccountMail   " + accountMail);
        
        
        $("#accountMail").val(accountMail);
        
    }
});

function addEmailToForm() {
    var entmail = $("#entAccountMail").val();
    var entsite = $("#entSite").val();

    // entAccountMail 값을 조합합니다.
    var entAccountMail = entmail + "@" + entsite;
	console.log("entAccountMailentAccountMailentAccountMail " + entAccountMail);
	
	$("#entSignupForm input[name='accountMail']").remove();
	
    // entAccountMail 값을 폼 데이터로 추가합니다.
    $("<input>").attr({
        type: "hidden",
        name: "accountMail",
        value: entAccountMail
    }).appendTo($("#entSignupForm"));
}

$(function(){
	
	// sms인증
	var code2 = "";
	$("#sendTell").click(function(){
		var accountTell = $("#accountTell").val();
		if(accountTell == null || accountTell == ""){
			alert("번호 입력");
			return false;
		}
		
		alert("인증번호 발송");
		
		var info = {
			accountTell : accountTell
		}
		
		$.ajax({
			type : "post",
			url : "/account/member/phoneCheck.do",
			contentType : "application/json; charset=utf-8",
			data : JSON.stringify(info),
			beforeSend: function(xhr) {
                xhr.setRequestHeader(header, token);
            },
			cache : false,
			success : function(data){
				if(data == "null" && data == ""){
					alert("번호가 올바르지 않습니다.");
// 					$("#accountTell").attr("autofocus", true);
				}else{
// 					$("#checkNumber").attr("disabled", true);
// 					$("#checkTell").css("display","inline-block");
// 					$(".successPhoneChk").text("인증번호를 입력한뒤 확인을 눌러주세요.");
// 					$(".successPhoneChk").css("color", "green");
					$("#accountTell").attr("readonly", true);
					code2 = data;
					console.log(code2);
					$("#sendTell").attr("disabled", true);
				}
			}
		});
	});
	
	// sms 확인 버튼
	$("#checkTell").click(function(){
		if($("#checkNumber").val() == code2){
// 			$(".successPhoneChk").text("인증번호가 일치합니다.");
// 			$(".successPhoneChk").css("color", "green");
			$("#checkNumber").attr("disabled", true);
			alert("인증번호 일치");
		}else{
			alert("인증번호 불일치, 다시 시도해주세요.");
		}
	});
	
	// sms 재전송 버튼
	$("#reSend").click(function(){
		console.log("123123123");
// 		$("#checkNumber").attr("disabled", false);
		$("#accountTell").attr("readonly", false);
		
		var code2 = "";
		var accountTell = $("#accountTell").val();
		if(accountTell == null || accountTell == ""){
			alert("번호 입력");
			return false;
		}
			
		alert("인증번호 발송");
		
		var info = {
			accountTell : accountTell
		}
		
		$.ajax({
			type : "post",
			url : "/account/member/phoneCheck.do",
			contentType : "application/json; charset=utf-8",
			data : JSON.stringify(info),
			beforeSend: function(xhr) {
                xhr.setRequestHeader(header, token);
            },
			cache : false,
			success : function(data){
				if(data == "null" && data == ""){
					alert("번호가 올바르지 않습니다.");
//	 					$("#accountTell").attr("autofocus", true);
				}else{
						$("#checkNumber").attr("disabled", true);
//	 					$("#checkTell").css("display","inline-block");
//	 					$(".successPhoneChk").text("인증번호를 입력한뒤 확인을 눌러주세요.");
//	 					$(".successPhoneChk").css("color", "green");
// 						$("#accountTell").attr("readonly", true);
					code2 = data;
					console.log(code2);
				}
			}
		});
	
	});
	
	
	var member = $("#member");
	var enterprise = $("#enterprise");
	
	
	 // 개인회원 버튼 클릭 시 실행되는 함수
	 member.on("click", function(){
        $("#memSignupForm").css("display","block");
//         $("#memSignupForm .col-md-10 input").val(""); //
        $("#entSignupForm").css("display","none");
	 });

    // 기업회원 버튼 클릭 시 실행되는 함수
    enterprise.on("click", function(){
	 	$("#memSignupForm").css("display","none");
// 	 	$("#entSignupForm .col-md-10 input").val("");
	    $("#entSignupForm").css("display","block");
    });
    
    // 동의항목 전체선택/해제
    $("input[id=agree1]").click(function(){
	  if ($(this).is(":checked") === true) {
	    $("#agree2, #agree3, #agree4").prop("checked", true);
	  } else {
	    $("#agree2, #agree3, #agree4").prop("checked", false);
	  }
	});
	
	$("input[id=agree2], input[id=agree3], input[id=agree4]").click(function(){
	  if ($("#agree2").is(":checked") && $("#agree3").is(":checked") && $("#agree4").is(":checked")) {
	    $("#agree1").prop("checked", true);
	  } else {
	    $("#agree1").prop("checked", false);
	  }
	});
    

	
	var memSignupBtn = $("#memSignupBtn");
	var memSignupForm = $("#memSignupForm");
	var checkNumber = $("#checkNumber");
	var checkTell = $("#checkTell");
	var sendTell = $("#sendTell");
	var reSend = $("#reSend");
	
	
	
	
	
    // 폼 유효성 검사 및 제출 로직
    const idPattern = /^[0-9a-zA-Z]{0,20}$/;
    const pwPattern = /^[^가-힣]{10,20}$/;
    const birthPattern = /^[0-9]{8}$/;
// 	        const namePattern = /^[가-힣]{2,5}$/;
    const telPattern = /^(011|016|017|019|070|010)\d{3,4}\d{4}$/;
//     const idPattern = /^[0-9a-zA-Z]{0,20}$/;
	// 맴버가입 버튼
	memSignupBtn.on("click", function(){
		
	    var agree2 = $("#agree2:checked").val();
	    var agree3 = $("#agree3:checked").val();
	    var agree4 = $("#agree4:checked").val();
	    
	    if(agree2 && agree3 && agree4){

	        var accountId = $("#accountId").val();
	        var accountPswd = $("#accountPswd").val();
	        var reaccountPswd = $("#reaccountPswd").val();
	        var birthYmd = $("#birthYmd").val();
	        var accountTell = $("#accountTell").val();

	        if (!idPattern.test(accountId)) {
	            alert("아이디는 영어대소문자+숫자 조합 20자리 이하로 설정해주세요.");
	            $("#accountId").focus();
	            return false;
	        }
	        if (!pwPattern.test(accountPswd)) {
	            alert("비밀번호는 영어대소문자+숫자+특수문자 조합 10~20자리로 설정해주세요.");
	            $("#accountPswd").focus();
	            return false;
	        }
	        
	        
	        if (!pwPattern.test(reaccountPswd)) {
	            alert("비밀번호는 영어대소문자+숫자+특수문자 조합 10~20자리로 설정해주세요.");
	            $("#reaccountPswd").focus();
	            return false;
	        }

	        if (!birthPattern.test(birthYmd)) {
	            alert("생년월일은 숫자 8글자로 설정해주세요.");
	            $("#birthYmd").focus();
	            return false;
	        }

	        if (!telPattern.test(accountTell)) {
	            alert("-는 제외하고 숫자 11자로만 입력해주세요");
	            $("#accountTell").focus();
	            return false;
	        }
	        
	        memSignupForm.submit();
	    } else {
	        alert("필수항목 동의체크");
	        return false;
	    }
	});
	
	
	
	
	$("input[id=agree5]").click(function(){
	   	  if ($(this).is(":checked") === true) {
	   	    $("#agree6, #agree7").prop("checked", true);
	   	  } else {
	   	    $("#agree6, #agree7").prop("checked", false);
	   	  }
	 });
	
	$("input[id=agree6], input[id=agree7]").click(function(){
		  if ($("#agree6").is(":checked") && $("#agree7").is(":checked")) {
		    $("#agree5").prop("checked", true);
		  } else {
		    $("#agree5").prop("checked", false);
		  }
	});
		
	
	
	// 기업명으로 사업자등록번호/법인등록번호 가져오기
	var entBtn = $("#entBtn");
	var brnoBtn = $("#brnoBtn");
	var entNm = $("#entNm");
	
	var entDropdown = $('#entDropdown'); 
    var entDropdownWrapper = $('#entDropdownWrapper');
    var selectedCompanyInfo;
    var companyList;
	
    $('#entBtn').click(function() {
        searchCompany(); // 클릭 이벤트가 발생하면 검색 기능 실행
    });
    
	var nameUl = $(".nameUl");
	function searchCompany() {
	    var entNmVal = encodeURIComponent($("#entNm").val());
	    if(entNmVal === null || entNmVal === ""){
	    	return;
	    }
	    var data = {
	        entNm: entNmVal
	    };
	   
	    $.ajax({
	        type: "post",
	        url: "/account/enterprise/entNmCheck.do",
	        contentType: "application/json; charset=utf-8",
	        data: JSON.stringify(data),
	        beforeSend: function(xhr) {
	            xhr.setRequestHeader(header, token);
	        },
	        success: function(res) {
				var companyList = "";
				
				for (var i = 0; i < res.length; i++) {
					console.log(res[i]);
				    companyList += '<li class="names"><span class="companyName"'; 
				    companyList += 'data-crno="' + res[i].crno + '" '; 
				    companyList += 'data-brno="' + res[i].brno + '" ';
				    companyList += 'data-enprprfnm="' + res[i].enpRprFnm + '" ';
				    companyList += 'data-enpozpno="' + res[i].enpOzpno + '" ';
				    companyList += 'data-enpbsadr="' + res[i].enpBsadr + '" '; 
				    companyList += 'data-enpdtadr="' + res[i].enpDtadr + '" '; 
				    companyList += 'data-enphmpgurl="' + res[i].enpHmpgUrl + '" ';
				    companyList += 'data-corpnm="' + res[i].corpNm + '" '; 
				    companyList += 'data-enptlno="' + res[i].enpTlno + '">';
				    companyList += res[i].corpNm + '</span></li>';
				}

// 				console.log("된거 맞아?", companyList);

				nameUl.html(companyList);
				$("#nameList").css("display", "block");

            }
        });
    }

    $(".nameUl").on("click", ".companyName", function(){
		console.log($(this).data());
		console.log($(this).data("brno"));
        $("#entNm").val($(this).text());
   

        $('#rprsvNm').val($(this).data("enprprfnm"));
		$('#brno').val($(this).data("brno"));
		$('#AccountZip').val($(this).data("enpozpno"));
		$('#AccountAddr1').val($(this).data("enpbsadr"));
		$('#AccountAddr2').val($(this).data("enpdtadr"));
		$('#entUrl').val($(this).data("enphmpgurl"));
		$('#rprsTelno').val($(this).data("enptlno").replaceAll("-","").trim());



		var crno = $(this).data("crno");
		var bzno = $(this).data("brno");
		console.log(crno, brno);

        var data = {
           	crno : crno.toString()
		}
          
        // 정보 조회
        $.ajax({
        	type : "post",
			url : "/account/enterprise/entInfo.do",
			contentType : "application/json; charset=utf-8",
			data : JSON.stringify(data),
			beforeSend: function(xhr) {
                xhr.setRequestHeader(header, token);
            },
            success : function(res){
            	var res = JSON.stringify(res);
            	var resObject = JSON.parse(res);
            	var fondDe = resObject.affiliationCompSttusList.affiliationCompSttus.fondDe;
            	var indutyNm = resObject.affiliationCompSttusList.affiliationCompSttus.indutyNm;
            	var ordtmEmplyCo = resObject.affiliationCompSttusList.affiliationCompSttus.ordtmEmplyCo;
            	var bizTypeNm = "대기업";
           	
//             	console.log("resObject = " + resObject.affiliationCompSttusList);
            	console.log("기업설립일 = " + fondDe);
            	console.log("업종명 = " + indutyNm);
            	console.log("상시종업원수 = " + ordtmEmplyCo);
            	
            	// !!!
            	var fd = (""+(fondDe)).trim();
            	var yy = fd.substr(0,4);
            	var mm = fd.substr(4,2);
            	var dd = fd.substr(6,2);
            	var fondDay = yy + "-" + mm + "-" + dd;
            	$('#fndnYr').val(fondDay);
            	
//             	$('#fndnYr').val(fondDe);
            	$('#ksicNm').val(indutyNm);
            	$('#empCnt').val(ordtmEmplyCo.toString()
                    	  .replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ","));
            	$('#bizTypeNm').val(bizTypeNm);
           	
           	
            },
            error: function(xhr, status, error) {
                console.error("An error occurred: " + error);
                alert("서버 요청 중 오류가 발생했습니다. 다시 시도해주세요.");
            }
       	
        });


     	// 재무 조회
        $.ajax({
        	type : "post",
			url : "/account/enterprise/entFinancial.do",
			contentType : "application/json; charset=utf-8",
			data : JSON.stringify(data),
			beforeSend: function(xhr) {
                xhr.setRequestHeader(header, token);
            },
            success : function(res){
            	var res = JSON.stringify(res);
            	var resObject = JSON.parse(res);
// 		                	var assetsTotamt = resObject.financeCompSttusList.financeCompSttus.assetsTotamt;
            	var caplAmount = resObject.financeCompSttusList.financeCompSttus.caplAmount;
// 		                	var caplTotamt = resObject.financeCompSttusList.financeCompSttus.caplTotamt;
// 		                	var debtTotamt = resObject.financeCompSttusList.financeCompSttus.debtTotamt;
            	var selngAmount = resObject.financeCompSttusList.financeCompSttus.selngAmount;
            	var thstrmNtpfAmount = resObject.financeCompSttusList.financeCompSttus.thstrmNtpfAmount;
            	
            	console.log("resObject = " + resObject.financeCompSttusList);
// 		                	console.log("자산총액 = " + assetsTotamt);
            	console.log("자본금 = " + caplAmount);
// 		                	console.log("자본총액 = " + caplTotamt);
// 		                	console.log("부채총액 = " + debtTotamt);
            	console.log("매출액 = " + selngAmount);
            	console.log("이익 = " + thstrmNtpfAmount);
//             	n1.toString()
//             	  .replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
            	$('#cptl').val((parseInt(caplAmount)).toString()
                  	  .replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ","));
            	$('#entSlsAmt').val((parseInt(selngAmount)).toString()
                    	  .replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ","));
            	$('#entEbit').val((parseInt(thstrmNtpfAmount)).toString()
                    	  .replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ","));
            	
            	
            },
            error: function(xhr, status, error) {
                console.error("An error occurred: " + error);
                alert("서버 요청 중 오류가 발생했습니다. 다시 시도해주세요.");
            }
        	
        });

        
	    $("#nameList").css("display", "none");     
    });
    


	
	brnoFlag = false;
	
	brnoBtn.on("click", function(){
		var b_no = []; // 무조건 배열로 보내야한다
		b_no[0] = $("#brno").val();
		
		var data = {
				"b_no": b_no // 사업자번호 "xxxxxxx" 로 조회 시,
			   }; 
			   
		$.ajax({
		    url: "https://api.odcloud.kr/api/nts-businessman/v1/status?serviceKey=pDeipzjZdVRVsAKgrMXHajaGmUyR8zssMRCTd2%2BbvDrEkA7pzVBNtDMfV34QdrPU6rWjoOKAzBGkXw6MVf81Og%3D%3D",  // serviceKey 값을 xxxxxx에 입력
			type: "POST",
			data: JSON.stringify(data), // json 을 string으로 변환하여 전송
			dataType: "JSON",
			contentType: "application/json",
			accept: "application/json",
			success: function(result) {
				var b_stt = result.data[0].b_stt;	    
				var b_stt_cd = result.data[0].b_stt_cd;	    
			    
				// 회원가입된 사업자등록번호랑 비교
				var brno = $("#brno").val();
				
				data = {
					brno : brno
				}
					
				$.ajax({
					type : "post",
					url : "/account/enterprise/entBrnoCheck.do",
					contentType : "application/json; charset=utf-8",
					data : JSON.stringify(data),
					beforeSend: function(xhr) {
		                xhr.setRequestHeader(header, token);
		            },
		            success: function(res){
		            	console.log(res);
		            	if(b_stt == '계속사업자' && b_stt_cd == '01' && res == 'Y'){
		            		Swal.fire(
		            				 '사용 가능한 정보입니다.'
					      			)
					      	brnoFlag = true;
		            	}else{
		            		Swal.fire(
					      			  '이미 가입된 정보입니다.'
					      			)
					      	
					    }
		            },
					error: function(result) {
					    console.log(result.responseText); //responseText의 에러메세지 확인
					}
				});
			},
			error: function(result) {
			    console.log(result.responseText); //responseText의 에러메세지 확인
			}
		});

		
		
	});
	
	
	// 기업
	var entSignupForm = $("#entSignupForm");
	var entSignupBtn = $("#entSignupBtn");
	
	entSignupBtn.on("click", function(){
		
		console.log("ententtt");
		var entNm = $("#entNm").val();
		var brno = $("#brno").val();
		var rprsvNm = $("#rprsvNm").val();
		var entAccountId = $("#entAccountId").val();
		var entAccountPswd = $("#entAccountPswd").val();
		var entReaccountPswd = $("#entReaccountPswd").val();
		var entAccountNm = $("#entAccountNm").val();
		var accountEntTell = $("#accountEntTell").val();
		var AccountZip = $("#AccountZip").val();
		var entAccountMail = $("#entAccountMail").val();
		var AccountAddr1 = $("#AccountAddr1").val();
		var AccountAddr2 = $("#AccountAddr2").val();

	    var agree6 = $("#agree6:checked").val();
	    var agree7 = $("#agree7:checked").val();
	    
	    
	   	
	   	
	    if(agree6 && agree7){
	    	
	    	if(entNm == null || entNm == ""){
	    		$("#entNm").focus();
	    		alert("대표명 입력");
	    		return false;
	    	}
	    	if(brno == null || brno == ""){
	    		$("#brno").focus();
	    		alert("사업자등록번호 입력");
	    		return false;
	    	}
	    	if(rprsvNm == null || rprsvNm == ""){
	    		$("#rprsvNm").focus();
	    		alert("대표자 입력");
	    		return false;
	    	}
	    	if(entAccountId == null || entAccountId == ""){
	    		$("#entAccountId").focus();
	    		alert("아이디 입력");
	    		return false;
	    	}
	    	if (!pwPattern.test(entAccountPswd)) {
	            alert("비밀번호는 영어대소문자+숫자+특수문자 조합 10~20자리로 설정해주세요.");
	            $("#entAccountPswd").focus();
	            return false;
	        }
	        
	        if (!pwPattern.test(entReaccountPswd)) {
	            alert("비밀번호는 영어대소문자+숫자+특수문자 조합 10~20자리로 설정해주세요.");
	            $("#entReaccountPswd").focus();
	            return false;
	        }
	        if(entAccountNm == null || entAccountNm == ""){
	    		$("#entAccountNm").focus();
	    		alert("가입자 입력");
	    		return false;
	    	}
	        if(accountEntTell == null || accountEntTell == ""){
	    		$("#rprsTelno").focus();
	    		alert("전화번호 입력");
	    		return false;
	    	}
	        if(entAccountMail == null || entAccountMail == ""){
	    		$("#entAccountMail").focus();
	    		alert("메일 입력");
	    		return false;
	        }
	        
	        if(brnoFlag){
	        	var fndnYrValue = $('input[id="fndnYr"]').val().replaceAll("-", "");
	            var empCntValue = $('input[id="empCnt"]').val().replaceAll(",", "");
	            var cptlValue = $('input[id="cptl"]').val().replaceAll(",", "");
	            var entSlsAmtValue = $('input[id="entSlsAmt"]').val().replaceAll(",", "");
	            var entEbitValue = $('input[id="entEbit"]').val().replaceAll(",", "");

	            // 수정된 값으로 다시 세팅
	            $('input[id="fndnYr"]').val(fndnYrValue);
	            $('input[id="empCnt"]').val(empCntValue);
	            $('input[id="cptl"]').val(cptlValue);
	            $('input[id="entSlsAmt"]').val(entSlsAmtValue);
	            $('input[id="entEbit"]').val(entEbitValue);
	            
		        addEmailToForm(); // 합친메일주소
				entSignupForm.submit();
	        }else{
	        	alert("사업자번호로 인증하기");
	        }
		}else {
	        alert("필수항목 동의체크");
	        return false;
	    }
	});
});


//아이디 비교
$("#entAccountId").focusout(function() {
	var entAccountId = $("#entAccountId").val();
	
	if (!entAccountId) {
        return;
    }
    
	var data = {
		accountId : entAccountId
	}
	
	$.ajax({
		type : "post",
		url : "/account/member/checkId.do",
		contentType : "application/json; charset=utf-8",
		data : JSON.stringify(data),
		beforeSend: function(xhr) {
            xhr.setRequestHeader(header, token);
        },
		cache : false,
		success : function(data){
// 			console.log(data);
			if (data) {
                // 데이터베이스에 해당 accountId가 이미 존재하는 경우
                $("#entAccountIdMessage").css("color", "red");
                $("#entAccountIdMessage").css("font-size", "smaller");
                $("#entAccountIdMessage").css("text-align", "left");
                $("#entAccountIdMessage").css("margin-top", "-12px");
                $("#entAccountIdMessage").text("*이미 사용 중인 아이디입니다.");
            } else {
                // 데이터베이스에 해당 accountId가 존재하지 않는 경우
            	$("#entAccountIdMessage").css("color", "green");
            	$("#entAccountIdMessage").css("font-size", "smaller");
                $("#entAccountIdMessage").css("text-align", "left");
                $("#entAccountIdMessage").css("margin-top", "-12px");
                $("#entAccountIdMessage").text("*사용가능한 아이디입니다.");
            }
			$("#entAccountIdMessage").show();
		}
	});

});

//비밀번호 비교
$("#entAccountPswd, #entReaccountPswd").keyup(function() {
    var password = $("#entAccountPswd").val();
    var confirmPassword = $("#entReaccountPswd").val();

    // 비밀번호와 재입력 비밀번호가 모두 입력되었는지 확인
    if (password !== '' && confirmPassword !== '') {
        // 비밀번호와 재입력 비밀번호가 일치하는지 확인
        if (password === confirmPassword) {
            // 일치할 경우
            $("#entAccountPswd, #entReaccountPswd").css("color", "green"); // 입력 필드의 텍스트 색상을 초록색으로 변경
        } else {
            // 일치하지 않을 경우
            $("#entAccountPswd, #entReaccountPswd").css("color", "red"); // 입력 필드의 텍스트 색상을 빨간색으로 변경
        }
    } else {
        // 비밀번호나 재입력 비밀번호가 아직 입력되지 않은 경우
        $("#entAccountPswd, #entReaccountPswd").css("color", ""); // 입력 필드의 텍스트 색상 초기화
    }
});
//다음 주소 api 예제 가져옴
function DaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var addr = ''; // 주소 변수
            var extraAddr = ''; // 참고항목 변수

            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                addr = data.roadAddress;
            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                addr = data.jibunAddress;
            }

            // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
            if(data.userSelectedType === 'R'){
                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
            } 

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('accountZip').value = data.zonecode;
            document.getElementById("accountAddr1").value = addr;
            // 커서를 상세주소 필드로 이동한다.
            document.getElementById("accountAddr2").focus();
            
        }
    }).open();
}
function DaumPostcode1() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var addr = ''; // 주소 변수
            var extraAddr = ''; // 참고항목 변수

            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                addr = data.roadAddress;
            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                addr = data.jibunAddress;
            }

            // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
            if(data.userSelectedType === 'R'){
                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
            } 

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('AccountZip').value = data.zonecode;
            document.getElementById("AccountAddr1").value = addr;
            // 커서를 상세주소 필드로 이동한다.
            document.getElementById("AccountAddr2").focus();
            
        }
    }).open();
}
$("#brnoFile").on('change',function(){
// 	console.log("!!!!!파일");
	var fileName = $("#brnoFile").val().split('\\').pop();
	var fileExt = fileName.split('.').pop().toLowerCase(); // 파일 확장자를 소문자로 변환하여 가져옴
    if ($.inArray(fileExt, ['jpg', 'jpeg', 'png', 'gif']) == -1) {
        // 이미지 파일이 아닌 경우
        alert("이미지 파일만 업로드할 수 있습니다.");
        $(this).val(''); // 파일 입력 필드 비우기
    } else {
        // 이미지 파일인 경우
        $("#upload-file").val(fileName);
    }
});

$("#entImg").on('change',function(){
// 	console.log("!!!!!로고");
	var logoName = $("#entImg").val().split('\\').pop();
	var fileExt = logoName.split('.').pop().toLowerCase(); // 파일 확장자를 소문자로 변환하여 가져옴
    if ($.inArray(fileExt, ['jpg', 'jpeg', 'png', 'gif']) == -1) {
        // 이미지 파일이 아닌 경우
        alert("이미지 파일만 업로드할 수 있습니다.");
        $(this).val(''); // 파일 입력 필드 비우기
    } else {
        // 이미지 파일인 경우
    	$("#upload-logo").val(logoName);
    }
});
</script>