<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문 리스트</title>
</head>
<body>
<c:choose>
<c:when test="${custom==null}">
<c:redirect url="/login"/>
</c:when>
<c:when test='${custom!=null and custom.m_role=="custom"}'>
<div class="tb_wrap">
<div class="tb_box">
<c:import url="Top.jsp"/>
<table class="tb">
<tr>
	<td class="tb2">
		<table>
			<thead>
				<tr>
					<th class="theadstyle">주문번호</th>
					<th class="theadstyle">주문고객</th>
					<th class="theadstyle">주문제품</th>
					<th class="theadstyle">주문수량</th>
					<th class="theadstyle">주문날짜</th>
					<th class="theadstyle">주문상태</th>
					<th class="theadstyle">상세보기</th>
				</tr>
			</thead>
			<tbody>
				<c:choose>
					<c:when test="${fn:length(oList)>0}">
					<c:forEach var="ovo" items="${oList}">
						<tr>
							<td class="tbodystyle">${ovo.o_no}</td>
							<td class="tbodystyle">${ovo.m_name}</td>
							<td class="tbodystyle">${ovo.p_name}</td>
							<td class="tbodystyle">${ovo.quantity}</td>
							<td class="tbodystyle">${ovo.o_regdate}</td>
							<td class="tbodystyle">
							<c:choose>
						    <c:when test="${ovo.state==1}">접수중</c:when>
						    <c:when test="${ovo.state==2}">접수</c:when>
						    <c:when test="${ovo.state==3}">입금확인</c:when>
						    <c:when test="${ovo.state==4}">배송준비</c:when>
						    <c:when test="${ovo.state==5}">배송중</c:when>
						    <c:when test="${ovo.state==6}">완료</c:when>
					  		 </c:choose>
							</td>
							<td class="tbodystyle"><a href="javascript:shopMgrDetail('${ovo.o_no}')">상세보기</a></td>
						</tr>
					</c:forEach>
					</c:when>
					<c:otherwise>
						<tr>
							<td class="tb2" colspan="7">주문내용이 없습니다.</td>
						</tr>
					</c:otherwise>
				</c:choose>
			</tbody>
		</table>
	</td>
</tr>
</table>
<c:import url="Bottom.jsp"/>
<form name="detail" method="post" action="orderDetail">
	<input type="hidden" id="no" name="o_no">
</form>
</div>
</div>
</c:when>
</c:choose>
</body>
</html>