<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호  확인</title>
<script src="resources/js/etcScript.js" charset="utf-8"></script>
</head>
<body>
<table>
	<tr>
		<td>비밀번호 입력: </td>
		<td><input type="password" id="pwCheck" ></td>
	</tr>
	<tr>
		<td><input type="button" value="확인" onclick="setParentText(this);"></td>
		<td><input type="button" value="닫기" onclick="window.close();"></td>
	</tr>
</table>
</body>
</html>