<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

<head>
	<title>ITcruit - DDIT 403호 Team1</title>

	<!-- Meta Tags -->
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<meta name="author" content="Webestica.com">
	<meta name="description" content="ITcruit - DDIT 403호 Team1">
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/websocket.js"></script>
	<script type="text/javascript">
		wsConnect();	
	</script>
	<!-- ajax 요청시 사용할 csrf meta데이터 설정 -->
	<meta id="_csrf" name="_csrf" content="${_csrf.token}"/>
	<meta id="_csrf_header" name="_csrf_header" content="${_csrf.headerName}"/>
	
	<script type="text/javascript">
	// ajax 요청시 사용할 csrf 글로벌 변수설정
	var token = $("meta[name='_csrf']").attr("content");
	var header = $("meta[name='_csrf_header']").attr("content");
	</script>

	<!-- Favicon -->
	<link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/assets/images/taplogo1(배경X).png">

	<!-- Google Font -->
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com">
	<link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR:wght@600&family=IBM+Plex+Sans:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;1,100;1,200;1,300;1,400;1,500;1,600;1,700&display=swap" rel="stylesheet">


	<!-- Plugins CSS -->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/assets/vendor/font-awesome/css/all.min.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/assets/vendor/bootstrap-icons/bootstrap-icons.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/assets/vendor/choices/css/choices.min.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/assets/vendor/overlay-scrollbar/css/overlayscrollbars.min.css">

	<!-- Theme CSS -->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/assets/css/style.css">


	<script type="text/javascript" src="${pageContext.request.contextPath }/resources/ckeditor/ckeditor.js"></script>
	
	 <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.css">
 	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
	
</head>
<c:if test="${not empty message }">
	<script type="text/javascript">
	alert("${message}");
		<c:remove var="message" scope="request"/>
		<c:remove var="message" scope="session"/>
	</script>
</c:if>
<body>


	<!-- **************** MAIN CONTENT START **************** -->
<main>

		
		<!-- Sidebar START -->
		<tiles:insertAttribute name="sidebar"/>
		<!-- Sidebar END -->

		<!-- Page content START -->
		<div class="page-content">

			<!-- Top bar START -->
			<tiles:insertAttribute name="topbar"/>
			<!-- Top bar END -->

			<!-- Page main content START -->
			<tiles:insertAttribute name="content"/>
			<!-- Page main content END -->
		</div>
		<!-- Page content END -->


		<!-- ***** MODAL END ***** -->

	</main>

	<!-- **************** MAIN CONTENT END **************** -->


	<!-- Back to top -->
	<div class="back-top"><i class="bi bi-arrow-up-short position-absolute top-50 start-50 translate-middle"></i></div>

	<!-- Bootstrap JS -->
	<script src="${pageContext.request.contextPath}/resources/assets/vendor/bootstrap/dist/js/bootstrap.bundle.min.js"></script>

	<!-- Vendors -->
	<script src="${pageContext.request.contextPath}/resources/assets/vendor/choices/js/choices.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/assets/vendor/overlay-scrollbar/js/overlayscrollbars.min.js"></script>

	<!-- Template Functions -->
	<script src="${pageContext.request.contextPath}/resources/assets/js/functions.js"></script>

</body>

</html>