<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
	<table>
		<tr>
		<th class="theadstyle" colspan="3" style="color:#FFFFFF;font-weight: bold;">${pvo.p_name}
		</th>
		</tr>
		<tr>
			<td class="tbodystyle" style="width:20%"><a href="/upload/${pvo.image}"><img alt="준비중입니다." src="/upload/${pvo.image}" height="150px"  width="150px"></a></td>
			<td style="width:60%">
				<table >
					<tr><th class="tbodystyle" style="font-weight: bold; text-align:center; width:150px">상품이름:</th><td class="tbodystyle">${pvo.p_name}</td></tr>
					<tr><th class="tbodystyle" style="font-weight: bold; text-align:center; width:150px">가&nbsp;&nbsp;&nbsp;&nbsp;격:  </th><td class="tbodystyle">${pvo.price}</td></tr>
					<tr><th class="tbodystyle" style="font-weight: bold; text-align:center; width:150px">입고일자:</th><td class="tbodystyle">${pvo.pr_date}</td></tr>
					<tr><th class="tbodystyle" style="font-weight: bold; text-align:center; width:150px">재&nbsp;&nbsp;&nbsp;&nbsp;고:</th><td class="tbodystyle">${pvo.stock}</td></tr>
				</table>
			</td>
			<td class="tbodystyle">${pvo.detail}</td>
		</tr>
		<tr>
		<td class="tbtnstyle" colspan="3" style="text-align:center">
		<a href="javascript:productUpdate('${pvo.p_no}','U')">수정하기</a>&nbsp;&nbsp;&nbsp;&nbsp;
		<a href="javascript:productUpdate('${pvo.p_no}','D')">삭제하기</a>&nbsp;&nbsp;&nbsp;&nbsp;
		<a href="/productMgr">목록으로</a>
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
</c:when>
</c:choose>
</body>
</html>