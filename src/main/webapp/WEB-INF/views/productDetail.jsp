<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 상세보기</title>
</head>
<body>

<div class="tb_wrap">
<div class="tb_box">
<c:import url="Top.jsp"/>
<table class="tb">
	<tr>
	<td class="tb2">
		<table>
			<tr>
				<th class="theadstyle" colspan="3">${pvo.p_name}</th>
			</tr>
			<tr>
				<td class="tdLeftstyle" style="width:20%">
					<a href="upload/${pvo.image}"><img alt="이미지" src="upload/${pvo.image}" height="150" width="150"></a>
				</td>
				<td class="tdLeftstyle" style="width:30%">
					<form action="cartProc?flag=add" name="cart" method="post">
						<table>
							<tr>
							<th class="tdLeftstyle">상품이름:</th>
							<td class="tbodystyle">${pvo.p_name}<input type="hidden" name="p_name" value="${pvo.p_name}"></td>
							</tr>
							<tr>
							<th class="tdLeftstyle">가&nbsp;&nbsp;&nbsp;&nbsp;격:</th>
							<td class="tbodystyle">${pvo.price}<input type="hidden" name="price" value="${pvo.price}"></td>
							</tr>
							<tr>
							<th class="tdLeftstyle">구매수량:</th>
							<td class="tbodystyle"><input type="text" name="quantity" value="1" size="5" style="text-align:right; padding-right:5px;">개</td>
							</tr>
							<tr>
								<td class="tbtnstyle" colspan="2">
								<input type="submit" value="장바구니 담기">
								<input type="hidden" name="p_no" value="${pvo.p_no}">
								</td>
							</tr>
						</table>
					</form>
				</td>
				<td class="tbodystyle">
					${pvo.detail}
				</td>
			</tr>
		</table>
	</td>
	</tr>
</table>
<c:import url="Bottom.jsp"/>
<form name="update" method="post" action="productDetail">
	<input type="hidden" id="no" name="p_no">
</form>
</div>
</div>

</body>
</html>