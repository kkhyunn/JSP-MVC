<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니 보기</title>
<style type="text/css">
table {
	margin: 10px auto;
	width: 800px;
	border-collapse: collapse;
	border-color: navy;
	font-size: 10pt;
}

table, th, td {
	border: 1px solid black;
	padding: 2px;
}

input {
	width: 50px;
}
</style>
<script type="text/javascript">
	function edit_cart(f) {
		f.action = "/MyController?cmd=editCart";
		f.submit();
	}
	function delete_cart(f) {
		f.action = "/MyController?cmd=deleteCart";
		f.submit();
	}
	function allcheck_cart(f) {
		f.action = "/MyController?cmd=allcheck";
		f.submit();
	}
</script>

<script src="/resources/jquery/jquery-3.3.1.min.js"></script>
</head>
<body>
	<%-- 현재 페이지에서 다른 페이지 가져오기  --%>
	<%@ include file="top.jsp"%>
	<hr>
	<table>
		<caption>
			<h2>:: 장바구니 내용 ::</h2>
		</caption>
		<thead>
			<tr bgcolor="#dedede">
				<th style="width: 20%">
				<div class="allCheck">
					<input type="checkbox" name="allCheck" id="allCheck" />
					<br>
					<label for="allCheck">모두 선택</label>
					<script>
					$("#allCheck").click(function(){
						var chk = $("#allCheck").prop("checked");
						if(chk) {
							$("/chBox").prop("checked", true);
						} else {
							$(".chBox").prop("checked", false);
						}
					});
					</script>
				</div>
				<%-- 
				<div class="delBtn">
					<button type="button" class="delete_cart(this.form)">선택 삭제</button>
				</div>--%>
				</th>
				<th style="width: 10%">제품번호</th>
				<th style="width: 20%">제품명</th>
				<th style="width: 20%">단가</th>
				<th style="width: 20%">수량</th>
				<th style="width: 15%">금액</th>
			</tr>
		</thead>
		<tbody>
			<c:choose>
				<c:when test="${empty cartList }">
					<tr>
						<td colspan="6"><h2>장바구니가 비었습니다</h2></td>
					</tr>
				</c:when>
				<c:otherwise>
					<c:forEach var="k" items="${cartList }">
						<tr>
							<td>
								<div class="checkBox">
									<input type="checkbox" name="chBox" class="chBox" data-cartNum="${k.c_idx }" />
									
									<script>
										$(".chBox").click(function(){
											$("allCheck").prop("checked", false);
										});
									</script>
								</div>
							</td>
							<td>${k.p_num }</td>
							<td>${k.p_name }</td>
							<td>시중가 : <fmt:formatNumber value="${k.p_price }"
									pattern="#,###" /> 원 <br> <font style="color: tomato">(세일가
									: <fmt:formatNumber value="${k.p_saleprice}" pattern="#,###" />
									원)
							</font>
							</td>
							<td>
								<form method="post">
									<input type="number" name="amount" value="${k.amount}">
									<input type="hidden" name="id" value="${k.id}"> <input
										type="hidden" name="p_num" value="${k.p_num}"> <input
										type="button" value="수정" onclick="edit_cart(this.form)">
								</form>
							</td>
							<td><fmt:formatNumber value="${k.p_saleprice * k.amount }"
									pattern="#,###" /> 원</td>
							<%-- 
							<td>

								<form method="post">
									<input type="hidden" name="id" value="${k.id}"> 
									<input type="hidden" name="p_num" value="${k.p_num}">

								</form>
							</td>
							--%>
							<c:set var="total"
								value="${total = total + (k.p_saleprice * k.amount) }"></c:set>
						</tr>
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</tbody>
		<tfoot>
			<tr style="text-align: right;">
				<td colspan="6" style="padding-right: 50px;">
					<h2>
						총 결제액 :
						<fmt:formatNumber value="${total}" pattern="#,###" />
						원
					</h2>
				</td>
			</tr>
		</tfoot>
	</table>
</body>
</html>