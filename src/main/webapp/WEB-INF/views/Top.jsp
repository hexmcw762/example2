<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>shopping top</title>
<script src="resources/jquery/jquery-3.6.0.js"></script>
<script src="resources/js/mainScript.js" charset="utf-8"></script>
<script src="resources/js/etcScript.js" charset="utf-8"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="resources/js/zipCheck.js"></script>
<link rel="stylesheet" href="resources/css/main.css" type="text/css">

<script type="text/javascript">
//뒤로가기 클릭시 화면 다시 읽어라
 // if(history.back()) location.reload();
</script>
</head>
<body>
<table>
<tr>
 	<th><a href="/">홈</a></th>
 	<c:choose>
 	<c:when test="${custom==null}">
 	<th><a href="/login">로그인</a></th>
 	<th><a href="/register">회원가입</a></th>
 	</c:when>
 	<c:when test="${custom!=null}">
 	<th><a href="/logout">로그아웃</a></th>
 	<th><a href="javascript:pwCheck('U')">정보수정</a></th>
 	</c:when>
 	</c:choose>
 	<th><a href="/productList">상품목록</a></th>
 	<th><a href="/cartList">장바구니</a></th>
 	<c:if test="${custom!=null}">
 	<th><a href="/orderList">주문목록</a></th>
 	</c:if>
 	
 </tr> 
</table>
<form action="" method="post" id="postF" name="postF">
	<input type="hidden" name="passwd" id="pw" value="${custom.m_passwd}">
</form>
</body>
</html>