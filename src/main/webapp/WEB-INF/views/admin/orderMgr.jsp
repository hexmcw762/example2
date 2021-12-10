<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 관리</title>
</head>
<body>
<c:choose>
<c:when test="${admin==null}">
<c:redirect url="/login"/>
</c:when>
<c:when test='${admin!=null and admin.m_role=="admin"}'>
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
					<th class="theadstyle">&nbsp;</th>
				</tr>
			</thead>
			<tbody>
				<c:choose>
					<c:when test="${fn:length(oList)>0}">
					<c:forEach var="ovo" items="${oList}" varStatus="i">
						<tr>
							<td class="tbodystyle">${ovo.o_no}</td>
							<td class="tbodystyle">${ovo.m_name}</td>
							<td class="tbodystyle">${ovo.p_name}</td>
							<td class="tbodystyle">${ovo.quantity}</td>
							<td class="tbodystyle">${ovo.o_regdate}</td>
							<td class="tbodystyle">
							<select name='state' id="state${i.count}" disabled="disabled">
							<option value="1">접수중</option>
							<option value="2">접수</option>
							<option value="3">입금확인</option>
							<option value="4">배송준비</option>
							<option value="5">배송중</option>
							<option value="6">완료</option>
							</select>
					    <script>$(function(){
						     $("#state"+'${i.count}').val('${ovo.state}')});
					   </script>
							
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