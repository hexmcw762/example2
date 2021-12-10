<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니</title>
</head>
<body>
<c:choose>
<c:when test="${custom==null}">
<c:redirect url="/login" />
</c:when>
<c:when test="${custom!=null}">
<div class="tb_wrap">
<div class="tb_box">
<c:import url="Top.jsp"/>
	<table class="tb">
		<tr>
			<td class="tb2">
				<form action="" method="post">
					<table>
						<thead>
							<tr>
								<th class="theadstyle">제품번호</th>
								<th class="theadstyle">제품명</th>
								<th class="theadstyle">가격</th>
								<th class="theadstyle">수량</th>
								<th class="theadstyle">수정/삭제</th>
								<th class="theadstyle">조회</th>
							</tr>
						</thead>
						<tbody>
							<c:choose>
								<c:when test="${fn:length(hCartList)>0}">
									<c:forEach var="cvo" items="${hCartList}" varStatus="i">
									<tr>
										<td class="tb2">${cvo.key}</td>
										<td class="tb2">${cvo.value.p_name}</td>
										<td class="tb2">${cvo.value.price}</td>
										<td class="tb2"> 
											<input style="text-align:right" name="quantity" type="text" value="${cvo.value.quantity}" size="5">
											<input type="hidden" name="p_no" value="${cvo.value.p_no}">
											<input type="hidden" name="p_name" value="${cvo.value.p_name}">
											<input type="hidden" name="price" value="${cvo.value.price}">
										</td>
										<td class="tb2"> 
											<button onclick="javascript:cartUpdate('U',${i.index})">수정</button>&nbsp;/&nbsp;
											<button onclick="javascript:cartUpdate('D',${i.index})">삭제</button>
										</td>
										<td class="tb2">
											<a href="javascript:shopMgrDetail('${cvo.value.p_no}')">상세보기</a>
										</td>
									</tr>
									</c:forEach>
									<tr>
										<td class="tb2" colspan="6"><a href="customorderProc">주문하기</a></td>
									</tr>
								</c:when>
								<c:otherwise>
									<tr>
										<td class="tb2" colspan="6">장바구니가 비었습니다.</td>
									</tr>
								</c:otherwise>
							</c:choose>
							
						</tbody>
					</table>
				</form>
			</td>
		</tr>
	</table>
<c:import url="Bottom.jsp"/>
<form name="detail" method="post" action="productDetail">
	<input type="hidden" id="no" name="p_no">
</form>
</div>
</div>
</c:when>
</c:choose>
</body>
</html>