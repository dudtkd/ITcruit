<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" 
	rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" 
		crossorigin="anonymous">
<meta charset="UTF-8">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta id="_csrf" name="_csrf" content="${_csrf.token}"/>
<meta id="_csrf_header" name="_csrf_header" content="${_csrf.headerName}"/>
<title>Programming Challenge Interface</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

<script type="text/javascript">
	// ajax 요청시 사용할 csrf 글로벌 변수설정
	var token = $("meta[name='_csrf']").attr("content");
	var header = $("meta[name='_csrf_header']").attr("content");
</script>

<style>
.navbar-application.navbar-breadcrumb {
    background-color: #1e1e1e;
     width: 100%;
}
/*   body {  */
/*     font-family: Arial, sans-serif; */
/*     background-color: #121212; */
/*     color: #ffffff;  */
/*     margin: 0; */
/*     padding: 0; */
/*   } */
  
/*   .container {  */
/*     display: flex;  */
/*     justify-content: space-between;  */
/*     flex-wrap: wrap; */
/* 	height: 80vh; */
/*   } */

/*   .section {  */
/*     background-color: #1e1e1e;  */
/*     padding: 20px; */
/*     margin-bottom: 20px;  */
/*     border-radius: 5px; */
/*     margin-top: 0; */
/*     overflow: auto;  */
/* 	height: 40vh; */
/* 	} */
  
	/*
	
	.code-editor { 
    height: 200px; 
    width: 100%; 
	height: 80%;
    background-color: #ffffff; 
    color: #333333; 
    border: none;
    padding: 10px;
    margin-bottom: 20px; /
    border-radius: 5px;
    box-sizing: border-box; 

  }
	
	*/  
/*   .result {  */
/*     background-color: #262626;  */
/*     padding: 10px; */
/*     border-radius: 5px; */
/* 	height: 75%; */
/*   } */
  

	/* 버튼 꾸미기 - 질문 */
/* 	.qstn-btn { */
/* 	  color: #fff; */
/* 	  text-align: center; */
/* 	  vertical-align: middle; */
/* 	  user-select: none; */
/* 	  background-color: #6c757d; */
/* 	  border: 1px solid #6c757d; */
/* 	  padding: .375rem .75rem; */
/* 	  font-size: 1rem; */
/* 	  line-height: 1.5; */
/* 	  border-radius: .25rem; */
/* 	  transition: color .15s ease-in-out, background-color .15s ease-in-out, border-color .15s ease-in-out, box-shadow .15s ease-in-out; */
/* 	} */


	/* 버튼 꾸미기 - 테스트 */
/* 	.test-btn { */
/* 	  margin-right: 10px; */
/* 	  color: #fff; */
/* 	  text-align: center; */
/* 	  vertical-align: middle; */
/* 	  user-select: none; */
/* 	  background-color: #198754; */
/* 	  border: 1px solid #198754; */
/* 	  padding: .375rem .75rem; */
/* 	  font-size: 1rem; */
/* 	  line-height: 1.5; */
/* 	  border-radius: .25rem; */
/* 	  transition: color .15s ease-in-out, background-color .15s ease-in-out,  */
/* 	  			border-color .15s ease-in-out, box-shadow .15s ease-in-out; */
/* 	  float: right; */
/* 	} */
	
/* 	.test-btn:hover { */
/* 	  color: #fff; */
/* 	  background-color: #198754; */
/* 	  border-color: #198754; */
/* 	  transform: scale(1.05); */
/* 	} */

	/* 버튼 꾸미기 - 제출 */
/* 	.submit-btn { */
/* 	  margin-right: 10px; */
/* 	  color: #fff; */
/* 	  text-align: center; */
/* 	  vertical-align: middle; */
/* 	  user-select: none; */
/* 	  background-color: #0d6efd; */
/* 	  border: 1px solid #0d6efd; */
/* 	  padding: .375rem .75rem; */
/* 	  font-size: 1rem; */
/* 	  line-height: 1.5; */
/* 	  border-radius: .25rem; */
/* 	  transition: color .15s ease-in-out, background-color .15s ease-in-out,  */
/* 	  			border-color .15s ease-in-out, box-shadow .15s ease-in-out; */
/* 	  float: right; */
/* 	} */
	
/* 	.submit-btn:hover { */
/* 	  color: #fff; */
/* 	  background-color: #0d6efd; */
/* 	  border-color: #0d6efd; */
/* 	  transform: scale(1.05); */
/* 	} */


</style>

</head>
<body>
    <header>
        <!-- Logo Nav START -->
        <nav class="navbar navbar-expand-xl">
			<div class="navbar navbar-dark navbar-expand-lg navbar-application navbar-breadcrumb">
			  <a class="navbar-brand" href="/">
<!-- 			   	 <img alt="logo" width="24" src="/assets/bi-symbol-light-4a9edc980025418d6883d7519df4acf2b6c65f068508931dff0881d1c5ad4721.png"> --></a>  
				
				<a href="/codingtest/list.do">코딩테스트 문제</a> >
				<a href="/codingtest/list.do?pastQstnCtgryNm=${codingtestVO.pastQstnCtgryNm }">${codingtestVO.pastQstnCtgryNm } ></a> 
				<a href="/codingtest/list.do?qstnSubject=${codingtestVO.qstnSubject }">${codingtestVO.qstnSubject } > </a> 
				<span>${codingtestVO.qstnTtl } > </span>  
				<span style="color: white;"> > 질문목록</span>

			</div>
        </nav>
    </header>
    <main>
        <section>
            <h2>n + 1 카드게임</h2>
            <p>카드게임에 대한 설명...</p>
        </section>
    </main>
    <footer>
        <p>© ITCurit</p>
    </footer>
</body>
</html>