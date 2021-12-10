<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 관리</title>
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
					<th class="theadstyle" ><font color="#FFFFFF">고객명(아이디)</font></th>
					<th class="theadstyle" ><font color="#FFFFFF">이메일</font></th>
					<th class="theadstyle"><font color="#FFFFFF">전화번호</font></th>
					<th class="theadstyle"><font color="#FFFFFF">직업</font></th>
					<th class="theadstyle"><font color="#FFFFFF">회원등급</font></th>
					<th class="theadstyle" ><font color="#FFFFFF">우편번호</font></th>
					<th class="theadstyle" style="width:30%"><font color="#FFFFFF">주소</font></th>
					<th class="theadstyle" ><font color="#FFFFFF">가입일자</font></th>
					</tr>
			</thead>
			<tbody>
				<c:choose>
					<c:when test="${fn:length(mList)>0}">
					<c:forEach var="mvo" items="${mList}">
						<tr>
							<td class="tbodystyle"><a href="javascript:compare('${mvo.mem_id}')">${mvo.m_name}(${mvo.mem_id})</a></td>
							<td class="tbodystyle">${mvo.m_email}</td>
							<td class="tbodystyle">${mvo.m_phone}</td>
							<td class="tbodystyle">${mvo.m_job}</td>
							<td class="tbodystyle">${mvo.m_role}</td>
							<td class="tbodystyle">${mvo.zipcode}</td>
							<td class="tbodystyle">${mvo.address}&nbsp;${mvo.address2}</td>
							<td class="tbodystyle">${mvo.m_regDate}</td>
						</tr>
					</c:forEach>
					</c:when>
					<c:otherwise>
						<tr>
							<td class="tb2" colspan="8">등록된 회원이 없습니다.</td>
						</tr>
					</c:otherwise>
				</c:choose>
			</tbody>
		</table>
	</td>
</tr>
</table>
<c:import url="Bottom.jsp"/>
<form name="detail" method="post" action="memberDetail">
	<input type="hidden" id="id" name="mem_id">
	<input type="hidden" id="pw" value="${admin.m_passwd}">
</form>
</div>
</div>
</c:when>
</c:choose>
</body>
</html>