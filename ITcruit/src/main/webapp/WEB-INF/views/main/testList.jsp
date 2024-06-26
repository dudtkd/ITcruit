<%@ page language="java" contentType="text/html; UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ page import="org.springframework.security.core.context.SecurityContextHolder" %>
<%@ page import="org.springframework.security.core.userdetails.UserDetails" %>

<%
    Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();

    String username;

    if (principal instanceof UserDetails) {
        username = ((UserDetails)principal).getUsername();
    } else {
        username = principal.toString();
    }
%>

<style>
.btn-purple {
    background-color: #dcd8fc;
    color: black;
    border: none;
}
.btn-purple:hover {
    background-color: #8d7ffc;
    color: white;
}

/* .tooltip { */
/*   border-bottom: 1px dotted #000000;  */
/*   color: black;  */
/*   outline: none; */
/*   cursor: help;  */
/*   text-decoration: none; */
/*   position: relative; */
/* } */
/* .tooltip span { */
/*   margin-left: -999em; */
/*   position: absolute; */
/* } */
/* .tooltip:hover span { */
/*   border-radius: 5px 5px;  */
/*   -moz-border-radius: 5px;  */
/*   -webkit-border-radius: 5px;  */
/*   box-shadow: 5px 5px 5px rgba(0, 0, 0, 0.1);  */
/*   -webkit-box-shadow: 5px 5px rgba(0, 0, 0, 0.1);  */
/*   -moz-box-shadow: 5px 5px rgba(0, 0, 0, 0.1); */
/*   font-family: Calibri, Tahoma, Geneva, sans-serif; */
/*   position: absolute;  */
/*   left: 1em;  */
/*   top: 2em;  */
/*   z-index: 99; */
/*   margin-left: 0;  */
/*   width: 250px; */
/* } */
/* .tooltip:hover em { */
/*   font-family: Candara, Tahoma, Geneva, sans-serif; font-size: 1.2em;  */
/*   font-weight: bold; */
/*   display: block;  */
/*   padding: 0.2em 0 0.6em 0; */
/* } */
/* .classic { padding: 0.8em 1em; } */
/* * html a:hover { background: transparent; } */
/* .classic {background: #FFFFAA; border: 1px solid #FFAD33; } */

/* 컨테이너 설정 */

/* .toool-container {display:flex;justify-content:center; flex-direction: row;} */
/* .toool-inner-container {display:flex;flex-direction: column;width: 200px;text-align:center;margin-top:50px} */

/* 컨테이너 설정 */
/* 툴팁 기본 스타일 설정 시작 */
.toooltip {
  position: relative;
  display: block;
}
.toooltip:hover {
  color: #8d7ffc;
}
.toooltip .toooltiptext {
  visibility: hidden;
  width: 184px;
  background-color: black;
  color: #fff;
  text-align: center;
  border-radius: 6px;
  padding: 5px 0;

  position: absolute;
  z-index: 1;
}
.toooltip:hover .toooltiptext {
  visibility: visible;
}
/* 툴팁 기본 스타일 설정 끝 */
/* -------------------------- */
/* 툴팁 화살표 기본 스타일 설정 시작 */
/* .toooltip .toooltiptext::after { */
/*   content: " "; */
/*   position: absolute; */
/*   border-style: solid; */
/*   border-width: 5px; */
/* } */
/* 툴팁 화살표 기본 스타일 설정 끝 */
/* -------------------------- */
/* 툴팁 방향 설정 시작 */
/* 오른쪽 툴팁 시작 */
.toooltip .toooltip-right {
  top: -62px;
  position: absolute;
  left: 30%
}
.toooltip .toooltip-right::after {
  top: 50%;
  right: 100%;
  margin-top: -5px;
  border-color: transparent black transparent transparent;
}
/* 오른쪽 툴팁 끝 */
/* 툴팁 방향 설정 끝 */


.toooltiptext {
  width: 300px;
  background-color: rgba(0, 0, 0, 0.7);
  color: white;
  border-radius: 6px;
  padding: 5px 10px;
  position: absolute;
  z-index: 9999;
  top: 0;
  left: 0;
}

</style>

<script type="text/javascript">

</script>

<main>

<!-- Page content START -->


<div class="page-content justify-content-center" style="margin-left: 7rem;">


	<div class="container">
	<div class="row">
	
			<!-- Page main content START -->
	<div class="page-content-wrapper border col-md-7" style="margin: 1.0rem 1.0rem;">

		<!-- Card START -->
		<div class="card bg-transparent border">

			<!-- Card header START -->
			<div class="card-header bg-light border-bottom">
				<!-- Search and select START -->
				<div class="row g-3 align-items-center justify-content-between">
					<!-- Search bar -->
					<div class="col-md-5">
						<form class="rounded position-relative">
							<input class="form-control bg-body" id = "qstnTtl" type="search" placeholder="검색" aria-label="Search">
						</form>
					</div>
					<div class="col-md-3">
						<input type="checkbox" id="passYn">
						<label>안 푼 문제</label>
					</div>
					<!-- Select option -->
					<div class="col-md-4">
						<select id="sortBy" class="form-select border-0 z-index-9" aria-label=".form-select-sm">
							<option value="new">최신순</option>
							<option value="high">정답률 높은 순</option>
							<option value="low">정답률 낮은 순</option>
						</select>
					</div>
				
				</div>
				<!-- Search and select END -->
				
				<input type="hidden" id="ttt" value="${username}">
				
				<div class="row g-3 align-items-center">
					<div class="col-md-3">
						<select id="qstnGrd" class="form-select border-0 z-index-9" aria-label=".form-select-sm">
							<option value="">난이도</option>
							<option value="1">초보</option>
							<option value="2">중급</option>
							<option value="3">상급</option>
						</select>
					</div>
					
					<c:set var="qstnSubjectList" value="${codingtestVO.qstnSubjectList }"/>
					<div class="col-md-4">
						<select id = "qstnSubject" class="form-select border-0 js-choice z-index-9" aria-label=".form-select-sm">
							<option value="">유형</option>
						<c:forEach var="qstnSubject" items="${qstnSubjectList }" varStatus="status">
							<option value="${qstnSubject}">${qstnSubject}</option>
						</c:forEach>		
						</select>
					</div>
					
					<c:set var="ctgryList" value="${codingtestVO.ctgryList}"/>
					<div class="col-md-5">
						<select id = "pastQstnCtgryNm" class="form-select border-0 js-choice z-index-9" aria-label=".form-select-sm">
							<option value="">기출문제</option>
						<c:forEach var="ctgry" items="${ctgryList }" varStatus="status">
							<option value="${ctgry}">${ctgry}</option>
						</c:forEach>
						</select>
					</div>
					
					
				</div>

			</div>
			<!-- Card header END -->

			<!-- Card body START -->
			<div class="card-body">
				<!-- Course table START -->
				<div class="table-responsive border-0 rounded-3">
					<!-- Table START -->
					<table class="table table-dark-gray align-middle p-4 mb-0 table-hover">
						<!-- Table head -->
						<thead>
							<tr>
								<th scope="col" class="border-0 rounded-start" style="text-align: center">상태</th>
								<th scope="col" class="border-0" style="text-align: center">제목</th>
								<th scope="col" class="border-0" style="text-align: center">유형</th>
								<th scope="col" class="border-0" style="text-align: right">난이도</th>
								<th scope="col" class="border-0 rounded-end" style="text-align: right">정답률</th>
							</tr>
						</thead>
						
						<!-- Table body START -->
						<tbody id ="tbodyPrint">
							<c:choose>
								<c:when test="${empty codeList}">
									<tr><td colspan="5">검색결과가 없어요</td></tr>								
								</c:when>
								
								<c:otherwise>
								
									<c:forEach items="${codeList }" var="code">
									<tr>
										<c:choose>
												<c:when test="${code.passYn eq 'Y'}">
													<td style="color: green;">해결</td>					
												</c:when>
												<c:otherwise>
													<td>미해결</td>							
												</c:otherwise>
										</c:choose>
										
									
										<td>
											<div class="d-flex align-items-center position-relative">
											
												<h6 class="table-responsive-title mb-0 ms-2">	
													<a href="/codingtest/detail.do?qstnNo=${code.qstnNo}" class="stretched-link">${code.qstnTtl }</a>
													</h6>
												</div>
											</td>
			
											<td>
												<div style="text-align: center;">
														${code.qstnSubject}
												</div>
											</td>
			
											<td style="text-align: right">
											<c:choose>
												<c:when test="${code.qstnGrd eq 1}">
													<span class="badge text-bg-primary">초보 </span>							
												</c:when>
												<c:when test="${code.qstnGrd eq 2}">
													<span class="badge text-bg-success">중급</span>							
												</c:when>
												<c:otherwise>
													<span class="badge text-bg-danger">상급</span>
												</c:otherwise>
											</c:choose>
											</td>
											
											<td style="text-align: right;">${code.correctRate} %</td>
			
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

		</div>
				
		<!-- Card END -->
		
				<div class="card-footer bg-transparent pt-0">
				<!-- Pagination START -->
				<div class="d-sm-flex justify-content-sm-between align-items-sm-center">
					<!-- Content -->
					
					<p class="mb-0 text-center text-sm-start"></p>
					<!-- Pagination -->
					
					<nav class="d-flex justify-content-center mb-0" aria-label="navigation" id="pagingArea">
						${customPagingVO.pagingHTML }
					</nav>
				</div>
				
			</div>
	</div>


	<div class="page-content-wrapper border col-md-3"
			style="position: sticky; top: 0;">
        <!-- Profile content here -->
				<div class="card-body">
					<div class="user-info">

						<c:choose>
							<c:when
								test="${empty sessionScope['SPRING_SECURITY_CONTEXT'].authentication.principal.username}">
								<p style="text-align: center; font-weight: bold;">로그인 후
									코딩테스트 연습하러가기</p>
								<button type="button" class="btn btn-purple"
									style="display: block; margin: auto;"
									onclick="location.href='/main/loginForm.do'">로그인</button>
							</c:when>
							<c:otherwise>

								<c:set var="accoutVO" value="${accoutVO }" />

								<c:set var="sumCnt" value="0" />
								<c:set var="sumTotalCnt" value="0" />

								<c:forEach items="${accoutVO.codePower}" var="codepower">
									<c:set var="sumCnt" value="${sumCnt +  codepower.cnt}" />
									<c:set var="sumTotalCnt"
										value="${sumTotalCnt +  codepower.totalCnt}" />
								</c:forEach>


								<h5 class="name">${accoutVO.accountNick }</h5>
								<table style="width: 100%;">
									<tr>
										<td class="label" style="font-size: 14px;">순위:</td>
										<td class="value"
											style="font-size: 16px; font-weight: bold; text-align: right;">${accoutVO.ranking }
											위</td>
									</tr>
									<tr>
										<td class="label" style="font-size: 14px;">전투력:</td>
										<td class="value"
											style="font-size: 16px; font-weight: bold; text-align: right;">${accoutVO.codingtestScore}cp</td>
									</tr>
									<tr>
										<td class="label" style="font-size: 14px;">해결한 문제:</td>
										<td class="value"
											style="font-size: 16px; font-weight: bold; text-align: right;">${sumCnt }
											/ ${sumTotalCnt } 개</td>
									</tr>

								</table>

							</c:otherwise>

						</c:choose>

						<hr />
						<br />

						<c:choose>
							<c:when test="${empty sessionScope['SPRING_SECURITY_CONTEXT'].authentication.principal.username}">
        						알고리즘 설명이 궁금하다면?
        						 <br/><br/>
								<div class="toool-container">
									<div class="toool-inner-container">
			        					<div class="toooltip">Queue
									      <span class="toooltiptext toooltip-right">Queue<br/>컴퓨터의 기본적인 자료 구조의 한가지로, 먼저 집어 넣은 데이터가 먼저 나오는 FIFO(First In First Out)구조로 저장하는 형식을 말한다.</span>
									    </div>
									    <div class="toooltip">stack
									      <span class="toooltiptext toooltip-right">stack<br/>한 쪽 끝에서만 자료를 넣거나 뺄 수 있는 선형 구조(LIFO - Last In First Out)로 데이터를 저장하는 형식을 말한다.</span>
									    </div>
			        					<div class="toooltip">dfs/bfs
									      <span class="toooltiptext toooltip-right">dfs: 깊이 우선 탐색은 맹목적 탐색방법의 하나로 한 노드를 시작으로 인접한 다른 노드를 재귀적으로 탐색해가고 끝까지 탐색하면 다시 위로 와서 다음을 탐색하여 검색한다.<br/>bfs: 너비 우선 탐색은 맹목적 탐색방법의 하나로 시작 정점을 방문한 후 시작 정점에 인접한 모든 정점들을 우선 방문하는 방법이다.</span>
									    </div>
									    <div class="toooltip">graph
									      <span class="toooltiptext toooltip-right">컴퓨터 시스템에 그래프는 연결되어 있는 객체간의 관계를 표현할 수 있는 자료구조다.</span>
									    </div>
			        					<div class="toooltip">greedy
									      <span class="toooltiptext toooltip-right">최적해를 구하는 데에 사용되는 근사적인 방법으로, 여러 경우 중 하나를 결정해야 할 때마다 그 순간에 최적이라고 생각되는 것을 선택해 나가는 방식으로 진행하여 최종적인 해답에 도달한다.</span>
									    </div>
									    <div class="toooltip">dp
									      <span class="toooltiptext toooltip-right">동적 계획법(Dynamic programming)<br/>복잡한 문제를 풀기위해서 간단한 여러 개의 하위 문제로 나누어 푼 다음, 그것을 결합하여 목적에 도달하는 방법이다.</span>
									    </div>
									    <div class="toooltip">tree
									      <span class="toooltiptext toooltip-right">트리 구조<br/>그래프의 일종으로, 여러 노드가 한 노드를 가리킬 수 없는 구조이다. 간단하게는 회로가 없고, 서로 다른 두 노드를 잇는 길이 하나뿐인 그래프를 트리라고 부른다.</span>
									    </div>
			        					<div class="toooltip">permute/combine
									      <span class="toooltiptext toooltip-right">순열조합(permutation combination)<br/>순열은 순서가 부여된 임의의 집합을 다른 순서로 뒤섞는 연산이며, 조합은 집합에서 일부 원소를 취해 부분 집합을 만드는 방법을 말한다.</span>
									    </div>
									    <div class="toooltip">bruteforce
									      <span class="toooltiptext toooltip-right">문제를 해결하기 위해서는 모든 자료를 탐색해야 하기 때문에 특정한 구조를 전체적으로 탐색한다.</span>
									    </div>
									    <div class="toooltip">sort
									      <span class="toooltiptext toooltip-right">데이터를 일정한 규칙에 맞춰 정렬하는 것을 말한다 <br/>(주로 오름차순 또는 내림차순)</span>
									    </div>
			        					<div class="toooltip">dijkstra
									      <span class="toooltiptext toooltip-right">다익스트라 알고리즘 <br/>어떤 변도 음수 가중치를 갖지 않는 유향 그래프에서 주어진 출발점과 도착점 사이의 최단 경로 문제를 푸는 알고리즘이다.</span>
									    </div>
									    <div class="toooltip">hash
									      <span class="toooltiptext toooltip-right">Hash table은 키를 값에 매핑할 수 있는 구조인, 연관 배열 추가에 사용되는 자료 구조이다.<br/>Hash table은 Hash 함수를 사용하여 색인(index, Key)을 버킷(bucket)이나 슬롯(slot)의 배열로 계산한다.</span>
									    </div>
									    <div class="toooltip">recrusion
									      <span class="toooltiptext toooltip-right">재귀 <br/> 수학이나 컴퓨터 과학 등에서 자신을 정의할 때 자기 자신을 재참조하는 방법을 뜻한다.<br/>주로 이 방법은 함수에 적용한 재귀 함수(Recursion Function)의 형태로 많이 사용된다.</span>
									    </div>
			        					<div class="toooltip">bst
									      <span class="toooltiptext toooltip-right">이진 검색 알고리즘(binary search algorithm)<br/>오름차순으로 정렬된 리스트에서 특정한 값의 위치를 찾는 알고리즘이며, 처음 중간의 값을 임의의 값으로 선택하여, 그 값과 찾고자 하는 값의 크고 작음을 비교하는 방식을 채택하고 있다. 처음 선택한 중앙값이 만약 찾는 값보다 크면 그 값은 새로운 최고값이 되며, 작으면 그 값은 새로운 최하값이 된다.</span>
									    </div>
									    <div class="toooltip">floyd warshall
									      <span class="toooltiptext toooltip-right">플로이드-워셜 알고리즘(Floyd-Warshall Algorithm)<br/>그래프에서 모든 꼭짓점 사이의 최단 경로의 거리를 구하는 알고리즘이다. 제일 바깥쪽 반복문은 거쳐가는 꼭짓점이고, 두번째 반복문은 출발하는 꼭짓점, 세번째 반복문은 도착하는 꼭짓점이다.</span>
									    </div>
									</div>
								</div>
        					</c:when>

							<c:otherwise>
								<c:set var="accoutVO" value="${accoutVO }" />
								<p>문항별 맞은 항목</p>
								<table style="width: 100%;">

									<c:forEach items="${accoutVO.codePower}" var="codepower">
										<c:set var="sumCnt" value="${sumCnt +  codepower.cnt}" />
										<c:set var="sumTotalCnt"
											value="${sumTotalCnt +  codepower.totalCnt}" />

										<tr>
											<td class="label" style="font-size: 14px;">
												<a href="/codingtest/list.do?qstnSubject=${codepower.qstnSubject}" 
													class="toooltipMember">${codepower.qstnSubject}:</a>
											</td>

											<td class="value"
												style="font-size: 16px; font-weight: bold; text-align: right;">
												${codepower.cnt}/${codepower.totalCnt}</td>
										</tr>

									</c:forEach>
								</table>
							</c:otherwise>
						</c:choose>
					</div>


					<!-- 			 <div class="tags"> -->
					<!-- 				<span class="tag">JavaScript</span> -->
					<!-- 				필요한 만큼 태그를 추가하세요 -->
					<!-- 			 </div> -->
					<!-- 			 <div class="buttons"> -->
					<!-- 				<button class="edit-button">수정하기</button> -->
					<!-- 				<button class="other-button">다른 버튼</button> -->
					<!-- 			 </div> -->
				</div>
			</div>
			</div>
	</div>

</div>
<!-- Page content END -->


<script type="text/javascript">
	//<input type="hidden" id="ttt" value="${principal}">

	//console.log(${principal});
	// 	if(test != null && test != "") {
	// 	    document.getElementById("qstnSubject").value = "${qstnSubject}";
	// 	}
	// 	test = "${pastQstnCtgryNm}";
	// 	if(test != null && test != ""){
	// 	    document.getElementById("pastQstnCtgryNm").value = "${pastQstnCtgryNm}";
	// 	}

	document
			.addEventListener(
					"DOMContentLoaded",
					function() {

						var qstnTtl = document.getElementById("qstnTtl");
						var qstnGrd = document.getElementById("qstnGrd");
						var qstnSubject = document
								.getElementById("qstnSubject");
						var pastQstnCtgryNm = document
								.getElementById("pastQstnCtgryNm");
						var sortBy = document.getElementById("sortBy");
						var passYn = document.getElementById("passYn");

						const tbodyPrint = document
								.getElementById("tbodyPrint");

						//var pagingArea = document.getElementById("pagingArea");

						qstnTtl.addEventListener('input', function() {
							getQstnList();
						}); //

						qstnGrd.addEventListener('change', function() {
							getQstnList();
						}); //

						qstnSubject.addEventListener('change', function() {
							getQstnList();
						}); //

						pastQstnCtgryNm.addEventListener('change', function() {
							getQstnList();
						}); //

						sortBy.addEventListener('change', function() {
							getQstnList();
						});

						passYn.addEventListener('change', function() {
							getQstnList();
						});

						function getQstnList() {
							//alert(pastQstnCtgryNm.value);
							html = "";

							var passChecked = passYn.checked ? "N" : ""

							var formData = {
								qstnTtl : qstnTtl.value,
								qstnGrd : qstnGrd.value,
								qstnSubject : qstnSubject.value,
								pastQstnCtgryNm : pastQstnCtgryNm.value,
								passYn : passChecked,
								sortBy : sortBy.value
							}

							$
									.ajax({
										type : "post",
										url : "/codingtest/list.do",
										contentType : "application/json; charset=utf-8",
										data : JSON.stringify(formData),
										beforeSend : function(xhr) {
											xhr.setRequestHeader(header, token);
										},
										success : function(res) {
											if (res.length === 0) {
												html += '<tr><td colspan="5">검색결과가 없어요</td></tr>';
												tbodyPrint.innerHTML = html;
											} else {
												drawNewTable(res);
											}
										}
									})
						}

						function drawNewTable(data) {
							html = "";

							// 데이터를 반복하면서 HTML 문자열을 생성합니다.
							for (var i = 0; i < data.length; i++) {

								var code = data[i];

								html += '<tr>';

								if (code.passYn === 'Y') {
									html += '<td style="color: green;">' + '해결'
											+ '</td>';
								} else {
									html += '<td>' + '미해결' + '</td>';
								}

								html += '<td><div class="d-flex align-items-center position-relative"><h6 class="table-responsive-title mb-0 ms-2"><a href="/codingtest/detail.do?qstnNo='
										+ code.qstnNo
										+ '" class="stretched-link">'
										+ code.qstnTtl + '</a></h6></div></td>';

								html += '<td><div style="text-align: center;">'
										+ code.qstnSubject + '</div></td>';

								if (code.qstnGrd === 1) {
									html += '<td style="text-align: right;"><span class="badge text-bg-primary">'
											+ '초급' + '</span></td>';
								} else if (code.qstnGrd === 2) {
									html += '<td style="text-align: right;"><span class="badge text-bg-success">'
											+ '중급' + '</span></td>';
								} else {
									html += '<td style="text-align: right;"><span class="badge text-bg-danger">'
											+ '상급' + '</span></td>';
								}

								html += '<td style="text-align: right;">'
										+ code.correctRate + '%' + '</td>';

								html += '</tr>';
							}

							document.querySelector('tbody').innerHTML = html;

						}
						
						var links = document.querySelectorAll('.toooltipMember');
						links.forEach(function(link) {
							link.addEventListener('mouseover', function(event) {
// 								console.log($(this).text().replace(':',''));
								var subject = $(this).text().replace(':','');
								showTooltip(event, subject);
							});
					    });
						
						function showTooltip(event, subject) {
					        var tooltipContent = getTooltipContent(subject);
					        var tooltip = document.createElement('span');
					        tooltip.textContent = tooltipContent;
					        tooltip.className = 'toooltiptext';
					        tooltip.style.position = 'fixed';
					        tooltip.style.top = (event.clientY + 10) + 'px';
					        tooltip.style.left = (event.clientX + 10) + 'px';
					        tooltip.style.zIndex = '9999';
					        document.body.appendChild(tooltip);

					        event.target.onmouseout = function () {
					            document.body.removeChild(tooltip);
					        };
						}

						function getTooltipContent(subject) {
					        switch (subject) {
					            case 'queue':
					                return '컴퓨터의 기본적인 자료 구조의 한가지로, 먼저 집어 넣은 데이터가 먼저 나오는 FIFO(First In First Out)구조로 저장하는 형식을 말한다.';
					            case 'stack':
					                return '한 쪽 끝에서만 자료를 넣거나 뺄 수 있는 선형 구조(LIFO - Last In First Out)로 데이터를 저장하는 형식을 말한다.';
					            case 'dfs/bfs':
					                return 'dfs: 깊이 우선 탐색은 맹목적 탐색방법의 하나로 한 노드를 시작으로 인접한 다른 노드를 재귀적으로 탐색해가고 끝까지 탐색하면 다시 위로 와서 다음을 탐색하여 검색한다. bfs: 너비 우선 탐색은 맹목적 탐색방법의 하나로 시작 정점을 방문한 후 시작 정점에 인접한 모든 정점들을 우선 방문하는 방법이다.';
					            case 'graph':
					                return '컴퓨터 시스템에 그래프는 연결되어 있는 객체간의 관계를 표현할 수 있는 자료구조다.';
					            case 'greedy':
					                return '최적해를 구하는 데에 사용되는 근사적인 방법으로, 여러 경우 중 하나를 결정해야 할 때마다 그 순간에 최적이라고 생각되는 것을 선택해 나가는 방식으로 진행하여 최종적인 해답에 도달한다.';
					            case 'dp':
					                return '동적 계획법(Dynamic programming) 복잡한 문제를 풀기위해서 간단한 여러 개의 하위 문제로 나누어 푼 다음, 그것을 결합하여 목적에 도달하는 방법이다.';
					            case 'tree':
					                return '그래프의 일종으로, 여러 노드가 한 노드를 가리킬 수 없는 구조이다. 간단하게는 회로가 없고, 서로 다른 두 노드를 잇는 길이 하나뿐인 그래프를 트리라고 부른다.';
					            case 'graph':
					                return '컴퓨터 시스템에 그래프는 연결되어 있는 객체간의 관계를 표현할 수 있는 자료구조다.';
					            case 'permute/combine':
					                return '순열조합(permutation combination) 순열은 순서가 부여된 임의의 집합을 다른 순서로 뒤섞는 연산이며, 조합은 집합에서 일부 원소를 취해 부분 집합을 만드는 방법을 말한다.';
					            case 'bruteforce':
					                return '문제를 해결하기 위해서는 모든 자료를 탐색해야 하기 때문에 특정한 구조를 전체적으로 탐색한다.';
					            case 'sort':
					                return '데이터를 일정한 규칙에 맞춰 정렬하는 것을 말한다 (주로 오름차순 또는 내림차순)';
					            case 'dijkstra':
					                return '어떤 변도 음수 가중치를 갖지 않는 유향 그래프에서 주어진 출발점과 도착점 사이의 최단 경로 문제를 푸는 알고리즘이다.';
					            case 'hash':
					                return 'Hash table은 키를 값에 매핑할 수 있는 구조인, 연관 배열 추가에 사용되는 자료 구조이다.Hash table은 Hash 함수를 사용하여 색인(index, Key)을 버킷(bucket)이나 슬롯(slot)의 배열로 계산한다.';
					            case 'recrusion':
					                return '수학이나 컴퓨터 과학 등에서 자신을 정의할 때 자기 자신을 재참조하는 방법을 뜻한다. 주로 이 방법은 함수에 적용한 재귀 함수(Recursion Function)의 형태로 많이 사용된다.';
					            case 'bst':
					                return '이진 검색 알고리즘(binary search algorithm) 오름차순으로 정렬된 리스트에서 특정한 값의 위치를 찾는 알고리즘이며, 처음 중간의 값을 임의의 값으로 선택하여, 그 값과 찾고자 하는 값의 크고 작음을 비교하는 방식을 채택하고 있다. 처음 선택한 중앙값이 만약 찾는 값보다 크면 그 값은 새로운 최고값이 되며, 작으면 그 값은 새로운 최하값이 된다.';
					            case 'floyd warshall':
					                return '그래프에서 모든 꼭짓점 사이의 최단 경로의 거리를 구하는 알고리즘이다. 제일 바깥쪽 반복문은 거쳐가는 꼭짓점이고, 두번째 반복문은 출발하는 꼭짓점, 세번째 반복문은 도착하는 꼭짓점이다.';
					            default:
					                return '해당 주제에 대한 설명이 없습니다.';
					        }
					    }

					});
</script>

</main>
