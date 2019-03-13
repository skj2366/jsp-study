<%@page import="java.sql.ResultSet"%>
<%@page import="test.jsp.study.db.DBCon"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>차량 리스트</title>
</head>
<body>
<form method="post" action="/jsp-study/car2/delete_ok.jsp">
	<table border="1"> <!-- ""가 정식 규격 (법은 아니고 규칙)꼭 ""로 안묶어도 되긴 한다. -->
		<tr>
			<th>선택</th>
			<th>번호</th>
			<th>모델</th>
			<th>연식</th>
			<th>제조회사</th>
			<th>기타정보</th>
		</tr>
<%
String sql = "select ci_num, ci_name, ci_year, ci_vendor,ci_etc from car_info";
PreparedStatement ps = DBCon.getCon().prepareStatement(sql);
ResultSet rs = ps.executeQuery();
while(rs.next()){
%>

	<tr>
		<td><input type="checkbox" name="ci_num" value="<%=rs.getString("ci_num")%>"><br>
		<td><%=rs.getString("ci_num")%></td>
		<td><%=rs.getString("ci_name")%></td>
		<td><%=rs.getString("ci_year")%></td>
		<td><%=rs.getString("ci_vendor")%></td>
		<td><%=rs.getString("ci_etc")%></td>
	</tr>	
<%	
}
%>
	</table>
	<button type="button" onclick="goInsertPage()">차량등록</button>
	
	<button type="submit">선택차량삭제</button>
</form>
	<script>
		function goInsertPage(){
			location.href="/jsp-study/car2/insert.jsp";
		}
	</script>
</body>
</html>