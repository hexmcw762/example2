<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>정보수정</title>
<script src="resources/jquery/jquery-3.6.0.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="resources/js/zipCheck.js"></script>
<link rel="stylesheet" href="resources/css/main.css" type="text/css">
</head>
<body>
<div class="tb_wrap">
<div class="tb_box">
<c:choose>
	<c:when test="${admin!=null }">
	<c:import url="./admin/Top.jsp"/>
	</c:when>	
	<c:when test="${custom!=null }">
	<c:import url="Top.jsp"/>
	</c:when>	
</c:choose>
<form action="updateProc" method="post" name="wForm">
 	<c:choose>
	<c:when test="${admin!=null }">
	<c:set value="${admin}" var="mvo" />
	</c:when>	
	<c:when test="${custom!=null }">
	<c:set value="${custom}" var="mvo" />
	</c:when>	
	</c:choose>
	<table class="tableclass2">
		<thead>
			<tr><th colspan="3" class="theadstyle">정보수정</th></tr>
		</thead>
		<tbody>
			<tr><td class="tbodystyle">아이디</td>
			<td style="width:57%" class="tbodystyle"><input type="text" name="mem_id" value="${mvo.mem_id }" readonly="readonly">
			</td>
			</tr>
			<tr><td class="tbodystyle">비밀번호</td>
			<td class="tbodystyle">
			<input type="password" class="chk" size="40" id="passwd" name="m_passwd" value="${mvo.m_passwd}"  title="비밀번호">
			<font id="check" size="2" color="red"></font>
			</td>
			</tr>
			<tr><td class="tbodystyle">비밀번호 확인</td>
			<td class="tbodystyle">
			<input type="password" class="chk" size="40" id="passwd2" name="m_repasswd" value="${mvo.m_passwd}"  title="비밀번호2">
			</td>
			</tr>
			<tr><td class="tbodystyle">이름</td>
			<td class="tbodystyle">
			<input type="text" size="40" class="chk" name="m_name" value="${mvo.m_name}"  title="이름">
			</td>
			</tr>
			<tr><td class="tbodystyle">이메일</td>
			<td class="tbodystyle">
			<input type="email" size="40" class="chk" name="m_email" value="${mvo.m_email}"  title="이메일">
			</td>
			</tr>
			<tr><td class="tbodystyle">전화번호</td>
			<td class="tbodystyle">
			<input type="text" size="40" class="chk" name="m_phone" value="${mvo.m_phone}" title="전화번호">
			</td>
			</tr>
			<tr><td class="tbodystyle">우편번호</td>
			<td class="tbodystyle">
			<input type="text" size="30" class="chk" name="zipcode" value="${mvo.zipcode}" title="우편번호" id="sample6_postcode">
			<input type="button" onclick="zipCheck()" class="chk" title="우편번호" value="우편번호 찾기">
			</td>
			</tr>
			<tr><td class="tbodystyle">주소</td>
			<td class="tbodystyle">
			<input type="text" size="40" class="chk" name="address" value="${mvo.address}" title="주소" id="sample6_address">
			</td>
			</tr>
			<tr><td class="tbodystyle">상세주소</td>
			<td>
			<input type="text" size="40" class="chk" name="address2"  value="${mvo.address2}" title="상세주소" id="sample6_address2">
			</td>
			</tr>
			<tr><td class="tbodystyle">직업</td>
			<td class="tbodystyle">
				<select name="m_job">
					<option value="0" <c:if test="${mvo.m_job==null}">selected</c:if>>선택하세요.</option>
					<option value="회사원" <c:if test='${mvo.m_job=="회사원"}'>selected</c:if>>회사원 </option>
					<option value="연구전문직" <c:if test='${mvo.m_job=="연구전문직"}'>selected</c:if>>연구전문직</option>
					<option value="교수학생" <c:if test='${mvo.m_job=="교수학생"}'>selected</c:if>>교수학생</option>
					<option value="일반자영업" <c:if test='${mvo.m_job=="일반자영업"}'>selected</c:if>>일반자영업</option>
					<option value="공무원" <c:if test='${mvo.m_job=="공무원"}'>selected</c:if>>공무원</option>
					<option value="의료인" <c:if test='${mvo.m_job=="의료인"}'>selected</c:if>>의료인</option>
					<option value="법조인" <c:if test='${mvo.m_job=="법조인"}'>selected</c:if>>법조인</option>
					<option value="종교,언론,에술인" <c:if test='${mvo.m_job=="종교,언론,에술인"}'>selected</c:if>> 종교.언론/예술인</option>
					<option value="농,축,수산,광업인" <c:if test='${mvo.m_job=="농,축,수산,광업인"}'>selected</c:if>>농/축/수산/광업인</option>
					<option value="주부" <c:if test='${mvo.m_job=="주부"}'>selected</c:if>>주부</option>
					<option value="무직" <c:if test='${mvo.m_job=="무직"}'>selected</c:if>>무직</option>
					<option value="기타" <c:if test='${mvo.m_job=="기타"}'>selected</c:if>>기타</option>
				</select>
				<input type="hidden" name="m_role" value="${mvo.m_role}">
				</td>
			</tr>
			<tr>
				<td colspan="3" class="theadstyle">
					<input type="button" id="submit1" value="정보수정">
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="reset" value="다시쓰기">
				</td>
			</tr>
		</tbody>
	</table>
	</form>
	<c:choose>
	<c:when test="${admin!=null }">
	<c:import url="./admin/Bottom.jsp"/>
	</c:when>	
	<c:when test="${custom!=null }">
	<c:import url="Bottom.jsp"/>
	</c:when>	
</c:choose>
</div>
</div>
</body>
</html>