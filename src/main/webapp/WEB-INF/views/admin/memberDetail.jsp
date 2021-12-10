<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보</title>
<script src="resources/jquery/jquery-3.6.0.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="resources/js/zipCheck.js"></script>
<link rel="stylesheet" href="resources/css/main.css" type="text/css">
</head>
<body>
<div class="tb_wrap">
<div class="tb_box">
<c:import url="Top.jsp"/>
<table class="tableclass2">
		<thead>
			<tr><th colspan="2" class="theadstyle">회원정보</th></tr>
		</thead>
		<tbody>
			<tr><td class="tbodystyle">아이디</td>
			<td  class="tbodystyle">${mvo.mem_id}</td>
			<tr><td class="tbodystyle">이름</td>
			<td class="tbodystyle">${mvo.m_name}</td>
			</tr>
			<tr><td class="tbodystyle">이메일</td>
			<td class="tbodystyle">${mvo.m_email}</td>
			</tr>
			<tr><td class="tbodystyle">전화번호</td>
			<td class="tbodystyle">${mvo.m_phone}</td>
			</tr>
			<tr><td class="tbodystyle">우편번호</td>
			<td class="tbodystyle">${mvo.zipcode}</td>
			</tr>
			<tr><td class="tbodystyle">주소</td>
			<td class="tbodystyle">${mvo.address}</td>
			</tr>
			<tr><td class="tbodystyle">상세주소</td>
			<td class="tbodystyle">${mvo.address2}</td>
			</tr>
			<tr><td class="tbodystyle">직업</td>
			<td class="tbodystyle">
				<select name="m_job" disabled="disabled">
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
				</td>
				</tr>
				<tr>
					<td class="tbodystyle" colspan="2" style="text-align:center"><a href="/memberMgr">회원관리목록으로</a></td>
				</tr>
		</tbody>
	</table>
	<c:import url="Bottom.jsp"/>
	</div>
	</div>
</body>
</html>