<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>고객주문정보</title>
</head>
<body>
<div class="tb_wrap">
<div class="tb_box">
<c:import url="Top.jsp"/>
<table>
	<tr>
		<td>
		<table>
			<tr><th colspan="2" class="theadstyle"><font color="#FFFFFF">주문상세내역</font></th></tr>
			<tr><td class="tdLeftstyle">고객아이디</td>
			<td  class="tbodystyle">${ovo.m_name}(${ovo.m_id})</td>
			<tr><td class="tdLeftstyle">주문번호</td>
			<td class="tbodystyle">${ovo.o_no}</td>
			</tr>
			<tr><td class="tdLeftstyle">제품번호</td>
			<td class="tbodystyle" align="center">${ovo.p_no}</td>
			</tr>
			<tr><td class="tdLeftstyle">제품이름</td>
			<td class="tbodystyle" align="center">${ovo.p_name}</td>
			</tr>
			<tr><td class="tdLeftstyle">제품가격</td>
			<td class="tbodystyle" align="center">${ovo.price}</td>
			</tr>
			<tr><td class="tdLeftstyle">주문수량</td>
			<td class="tbodystyle" align="center">${ovo.quantity}</td>
			</tr>
			<tr><td class="tdLeftstyle">주문날짜</td>
			<td class="tbodystyle" align="center">${ovo.o_regdate}</td>
			</tr>
			<tr><td class="tdLeftstyle">금액</td>
			<td class="tbodystyle" align="center">${ovo.quantity*ovo.price}원</td>
			</tr>
			<tr>
			<td class="tbodystyle">주문상태</td>
			<td class="tbodystyle" align="center">
				<c:choose>
			    <c:when test="${ovo.state==1}">접수중</c:when>
			    <c:when test="${ovo.state==2}">접수</c:when>
			    <c:when test="${ovo.state==3}">입금확인</c:when>
			    <c:when test="${ovo.state==4}">배송준비</c:when>
			    <c:when test="${ovo.state==5}">배송중</c:when>
			    <c:when test="${ovo.state==6}">완료</c:when>
		  		 </c:choose>
				</td>
				</tr>
					<tr>
					<td class="tb2">
					<a href="/orderList"><input type="button" value="구매목록"></a>
					</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
	<c:import url="Bottom.jsp"/>
	</div>
	</div>
</body>
</html>