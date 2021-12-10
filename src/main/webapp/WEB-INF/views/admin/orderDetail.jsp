<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문정보</title>
</head>
<body>
<div class="tb_wrap">
<div class="tb_box">
<c:import url="Top.jsp"/>
<table>
	<tr>
		<td>
			<form action="orderProc" name="order" method="post">
			<table>
			<tr><th colspan="2" class="theadstyle"><font color="#FFFFFF">주문상세내역</font></th></tr>
			<tr><td class="tdLeftstyle">고객아이디</td>
			<td  class="tbodystyle">${ovo.m_id}</td>
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
			<tr><td class="tdLeftstyle">재고수량</td>
			<td class="tbodystyle" align="center">${ovo.stock}개</td>
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
				<select name="state" id="state">
					<option value="1">접수중</option>
					<option value="2">접수</option>
					<option value="3">입금확인</option>
					<option value="4">배송준비</option>
					<option value="5">배송중</option>
					<option value="6">완료</option>
				</select>
				<script type="text/javascript">
				$(function(){
					$("#state").val(${ovo.state})
				})	
				</script>
				</td>
				</tr>
				<tr>
					<td class="tbtnstyle" colspan="2" align="center">
					<input type="button" value="수정" size="3" onclick="javascript:orderUpdate(this.form,'U')">
					<input type="button" value="삭제" size="3" onclick="javascript:orderUpdate(this.form,'D')">
				</td>
				</tr>
				</table>
				<input type="hidden" name="o_no" value="${ovo.o_no}">
				<input type="hidden" name="flag">
				</form>
		</td>
		</tr>
	</table>
	<c:import url="Bottom.jsp"/>
	</div>
	</div>
</body>
</html>