<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css"></style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript">
   $(function() {
	 	// $("선택자").load(url[,데이터][,콜백함수]);
	 	$("#btn1").click(function() {
			$("#out01").load("data01.jsp");
		});
	 	
	 	$("#out02").on("mouseover",function(){
	 		$("#out03").load("data03.jsp");
	 	});
	 	
   });
</script>
<script type="text/javascript"></script>
</head>
<body>
	<div>
		<h2>iframe 활용</h2>
		<iframe src="data01.jsp" style="width: 90%; height: 40%"></iframe>
	</div>
	<hr>
	<div>
		<h2>include 지시어 활용</h2>
		<%@ include file="data02.jsp" %>
	</div>
	<hr>
	<div>
		<h2>include 액션 활용</h2>
		<jsp:include page="data03.jsp" />
	</div>
	<hr>
	<div>
		<h2>jQuery 활용</h2>
		<p id="out01"></p>
		<button id="btn1">data01.jsp 가져오기</button>
	</div>
	<hr>
	<div id="out02">
		<h2>jQuery 활용</h2>
		<p >메뉴보기</p>
		<span id="out03">data03.jsp 가져오기</span>
	</div>
	
	
</body>
</html>












