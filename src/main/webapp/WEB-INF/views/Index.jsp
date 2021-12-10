<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%-- <c:if test="${(fn:length(msg)>0 or msg!=null)}">
	<script type="text/javascript">
		var msg = '${msg}';
		alert("오류"+msg);
	</script>
</c:if> --%>
<div class="tb_wrap">
<div class="tb_box">
<c:import url="Top.jsp"/>
<table class="tb">
<c:choose>
	<c:when test="${custom==null}">
	<tr>
		<td class="tb2">로그인 후 이용 바람</td>
	</tr>
	</c:when>
	<c:when test='${custom!=null and custom.m_role=="custom"}'>
	
	<tr>
		<td class="tb2">${custom.m_name} 님 환영</td>
	</tr>
	</c:when>
	
</c:choose>	
</table>
<c:import url="Bottom.jsp"/>
</div>
</div>
</body>
</html>