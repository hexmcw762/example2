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
					<th class="theadstyle" style="width:30%"><font color="#FFFFFF">상품명</font></th>
					<th class="theadstyle"><font color="#FFFFFF">가격</font></th>
					<th class="theadstyle" style="width:20%"><font color="#FFFFFF">날짜</font></th>
					<th class="theadstyle"><font color="#FFFFFF">재고</font></th>
					<th class="theadstyle" style="width:10%">&nbsp;</th>
				</tr>
			</thead>
			<tbody>
				<c:choose>
					<c:when test="${fn:length(pList)>0}">
					<c:forEach var="pvo" items="${pList}">
						<tr>
							<td class="tbodystyle">${pvo.p_name}</td>
							<td class="tbodystyle" style="text-align:center">${pvo.price}</td>
							<td class="tbodystyle">${pvo.pr_date}</td>
							<td class="tbodystyle" style="text-align:center">${pvo.stock}</td>
							<td class="tbodystyle"><a href="javascript:shopMgrDetail('${pvo.p_no}')">상세보기</a></td>
						</tr>
					</c:forEach>
					</c:when>
					<c:otherwise>
						<tr>
							<td class="tb2" colspan="5">등록된 상품이 없습니다.</td>
						</tr>
					</c:otherwise>
				</c:choose>
				<tr>
					<td class="tb2" colspan="5"><a href="productInsert">상품등록</a></td>
				</tr>
			</tbody>
		</table>
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