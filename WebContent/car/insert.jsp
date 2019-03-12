<%@page import="test.jsp.study.db.DBCon"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String ciNum = request.getParameter("ci_num");
	String ciYear = request.getParameter("ci_Year");
	String ciName = request.getParameter("ci_Name");
	String ciVendor = request.getParameter("ci_vendor");
	if (ciName == null) {
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메뉴등록</title>
</head>
<body>
	<form method="post">
		차 이름 : <input type="text" name="ciName"><br> 
		차 연식 : <input type="number" name="ciYear"><br>
		차 밴더 : <input type="number" name="ciVendor"><br>
		차 정보 : <input type="number" name="ciEtc"><br>
		<button>차량등록</button>
	</form>
</body>
</html>
<%
	} else {
		out.println("등록준비!");
		String sql = "insert into food(ci_num,ci_name,ci_year,ci_vendor,ci_etc)";
		sql += " values ((select nvl(max(ci_num),0)+1 from food),?,?,?,?)";
		PreparedStatement ps = DBCon.getCon().prepareStatement(sql);
		ps.setString(1, ciName);
		ps.setString(2, ciYear);
		ps.setString(3, ciVendor);
		ps.setString(4, ciEtc);
		int cnt = ps.executeUpdate();
		if (cnt == 1) {
			out.println("차량등록 성공!");
		} else if (cnt == 0) {
			out.println("차량등록 실패!");
		}
		out.println("<a href=\"/jsp-study/car/list.jsp\">차량리스트</a>");
	}
%>