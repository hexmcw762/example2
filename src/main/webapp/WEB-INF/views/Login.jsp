<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="tb_wrap">
<div class="tb_box">
<c:import url="Top.jsp"/>
<form name="loginForm" method="post" action="loginProc">
<table class="tb">
	<tr>
		<td class="tbodystyle">
			<table class="tb">
				<thead>
				<tr><td style="text-align:center" colspan="2">로그인</td></tr>
				</thead>
				<tbody>
					<tr>
					<td class="tbodystyle" style="text-align:center">id</td>
					<td class="tbodystyle" style="text-align:center"><input type="text" name="mem_id"></td>
					</tr>
					<tr>
					<td class="tbodystyle" style="text-align:center">password</td>
					<td class="tbodystyle" style="text-align:center"><input type="text" name="m_passwd"></td>
					</tr>
				</tbody>
				<tfoot>
					<tr>
						<td colspan="2">
						<button type="submit" id="login">로그인</button>
						<button type="button" onclick="javascript:location.href='/'">취소</button>
						</td>
					</tr>
				</tfoot>
			</table>
		</td>
	</tr>
</table>
</form>
<c:import url="Bottom.jsp"/>
</div>
</div>
</body>
</html>