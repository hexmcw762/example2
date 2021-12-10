<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상픔 등록</title>
</head>
<body>
<c:choose>
<c:when test="${admin==null}">
<c:redirect url="/login"/>
</c:when>
<c:when test='${admin!=null and admin.m_role=="admin"}'>
<div class="tb_wrap">
<div class="tb_box">
<c:import url="Top.jsp"/>
<table class="tb">
<tr>
	<td class="tb2">
		<form action="productMgrProc?flag=insert" method="post" enctype="multipart/form-data" name="wForm">
		<table>
			<thead>
				<tr>
					<th class="theadstyle" colspan="2" style="color:white">상품등록</th>
				</tr>
			</thead>
			<tbody>
			<tr>
				<td class="tbodystyle" style="width:20%">상품이름</td>
				<td class="tbodystyle"><input type="text" name="p_name" size="20" class="chk" title="상품이름"></td>
			</tr>
			<tr>	
				<td class="tbodystyle">상품가격</td>
				<td class="tbodystyle"><input type="text" name="price" size="20" class="chk" title="상품가격">&nbsp;원</td>
			</tr>
			<tr>	
				<td class="tbodystyle">상품설명</td>
				<td class="tbodystyle"><textarea rows="10" cols="80" name="detail" class="chk" title="상세설명"></textarea></td>
			</tr>
			<tr>
				<td class="tbodystyle">상품수량</td>
				<td class="tbodystyle"><input type="text" name="stock" size="20" class="chk" title="상품수량">&nbsp;개</td>
			</tr>
			<tr>
				<td class="tbodystyle">상품이미지</td>
				<td class="tbodystyle"><input type="file" name="image2" size="30" class="chk" title="이미지" ></td>
			</tr>
			<tr>
				<th colspan="2" class="tbtnystyle">
				<button type="submit" id="inputCheck">상품등록</button>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<button type="reset">다시쓰기</button></th>
			</tr>
			</tbody>
		</table>
		</form>
	</td>
</tr>		
</table>
<c:import url="Bottom.jsp"/>
</div>
</div>
</c:when>
</c:choose>
</body>
</html>