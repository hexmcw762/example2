<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<script src="resources/jquery/jquery-3.6.0.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="resources/js/zipCheck.js"></script>
<link rel="stylesheet" href="resources/css/main.css" type="text/css">
</head>
<body>
<c:import url="Top.jsp"/>
<form action="registerProc" method="post" name="wForm"> 
	<table class="tableclass2">
		<thead>
			<tr><th colspan="3" class="theadstyle">회원가입</th></tr>
		</thead>
		<tbody>
			<tr><td class="tbodystyle">아이디</td>
			<td style="width:57%" class="tbodystyle">
			<input size="40" type="text" name="mem_id" placeholder="아이디를 입력하세요" class="chk" id="idchck" title ="아이디" maxlength="6" value=""><br>
				<font id="warning" size="2" color="red"></font>
			</td>
			<td class="tbodystyle">아이디를 입력하세요</td>
			</tr>
			<tr><td class="tbodystyle">비밀번호</td>
			<td class="tbodystyle">
			<input type="password" class="chk" size="40" id="passwd" name="m_passwd" placeholder="비밀번호를 입력하세요" value="" title="비밀번호">
			<font id="check" size="2" color="red"></font>
			</td>
			<td class="tbodystyle">비밀번호를 입력하세요</td>
			</tr>
			<tr><td class="tbodystyle">비밀번호 확인</td>
			<td class="tbodystyle">
			<input type="password" class="chk" size="40" id="passwd2" name="m_repasswd" placeholder="비밀번호를 입력하세요" value="" title="비밀번호2">
			</td>
			<td class="tbodystyle">비밀번호를 다시 입력하세요</td>
			</tr>
			<tr><td class="tbodystyle">이름</td>
			<td class="tbodystyle">
			<input type="text" size="40" class="chk" name="m_name" placeholder="이름를 입력하세요" value="" title="이름">
			</td>
			<td class="tbodystyle">이름을 입력하세요</td>
			</tr>
			<tr><td class="tbodystyle">이메일</td>
			<td class="tbodystyle">
			<input type="email" size="40" class="chk" name="m_email" placeholder="이메일을 입력하세요" value="" title="이메일">
			</td>
			<td class="tbodystyle">이메일을 입력하세요</td>
			</tr>
			<tr><td class="tbodystyle">전화번호</td>
			<td class="tbodystyle">
			<input type="text" size="40" class="chk" name="m_phone" placeholder="전화번호를 입력하세요" value="" title="전화번호">
			</td>
			<td class="tbodystyle">전화번호를 입력하세요</td>
			</tr>
			<tr><td class="tbodystyle">우편번호</td>
			<td class="tbodystyle">
			<input type="text" size="30" class="chk" name="zipcode" readonly placeholder="우편번호를 검색하세요" value="" title="우편번호" id="sample6_postcode">
			<input type="button" onclick="zipCheck()" class="chk" title="우편번호" value="우편번호 찾기">
			</td>
			<td class="tbodystyle">우편변호를 입력하세요</td>
			</tr>
			<tr><td class="tbodystyle">주소</td>
			<td class="tbodystyle">
			<input type="text" size="40" class="chk" name="address" placeholder="주소를 입력하세요" value="" title="주소" id="sample6_address">
			</td>
			<td class="tbodystyle">주소를 입력하세요</td>
			</tr>
			<tr><td class="tbodystyle">상세주소</td>
			<td>
			<input type="text" size="40" class="chk" name="address2" placeholder="상세주소를 입력하세요" value="" title="상세주소" id="sample6_address2">
			</td>
			<td class="tbodystyle">상세주소를 입력하세요</td>
			</tr>
			<tr><td class="tbodystyle">직업</td>
			<td class="tbodystyle">
				<select name="m_job">
					<option value="0">선택하세요.
					<option value="회사원">회사원
					<option value="연구전문직">연구전문직
					<option value="교수학생">교수학생
					<option value="일반자영업">일반자영업
					<option value="공무원">공무원
					<option value="의료인">의료인
					<option value="법조인">법조인
					<option value="종교,언론,예술인">종교,언론,예술인
					<option value="농,축,수산,광업인">농,축,수산,광업인
					<option value="주부">주부
					<option value="무직">무직
					<option value="기타">기타
				</select>
				</td>
				<td class="tbodystyle">직업을 선택 하세요.</td>
			</tr>
			<tr>
				<td colspan="3" class="theadstyle">
					<input type="button" id="submit1" value="회원가입">
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="reset" value="다시쓰기">
				</td>
			</tr>
		</tbody>
	</table>
	</form>
	<c:import url="Bottom.jsp"/>
</body>
</html>