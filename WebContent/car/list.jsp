<%@page import="test.jsp.study.db.DBCon"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자동차목록</title>
</head>

<%
String ciName = request.getParameter("ci_name");
String ciYear = request.getParameter("ci_year");
String ciVendor = request.getParameter("ci_vendor");
String ciEtc = request.getParameter("ci_etc");
if (ciName != null) {
%>
 	<b>차 이름 : <%=ciName%><br></b> 
	<b>차 년식: <%=ciYear%><br></b>
	<b>차 밴더: <%=ciVendor%><br></b>
	<b>차 정보: <%=ciEtc%><br></b>
<%
}
%>

<form>
	차 이름 : <input type="text" name="ci_name"> <br> 
	차 년식 : <input type="text" name="ci_year"> <br>
	차 밴더 : <input type="text" name="ci_vendor"> <br>
	차 정보 : <input type="text" name="ci_etc"> <br>
	<button>검색</button>
</form>
<body>
	<%
		String sql = "select ci_num,ci_name,ci_year,ci_vendor,ci_etc from car_info ";
		sql += " where 1=1";
		if (ciName != null && !"".equals(ciName)) {
			sql += " and ci_name like '%' ||?|| '%' ";
		}
		if (ciYear != null && !"".equals(ciYear)) {
			sql += " and ci_year=? ";
		}
		if (ciVendor != null && !"".equals(ciVendor)) {
			sql += " and ci_vendor=? ";
		}
		if (ciEtc != null && !"".equals(ciEtc)) {
			sql += " and ci_etc=? ";
		}
		sql += " order by ci_num";
		try {
			PreparedStatement ps = DBCon.getCon().prepareStatement(sql);
			int cnt = 1;
			if (ciName != null && !"".equals(ciName)) {
				ps.setString(cnt++, ciName);
			}
			if (ciYear != null && !"".equals(ciYear)) {
				ps.setString(cnt++, ciYear);
			}
			if (ciVendor != null && !"".equals(ciVendor)) {
				ps.setString(cnt++, ciVendor);
			}
			if (ciEtc != null && !"".equals(ciEtc)) {
				ps.setString(cnt++, ciEtc);
			}
			ResultSet rs = ps.executeQuery();
			out.write("<table border=\"1\">");
			while (rs.next()) {
				out.write("<tr>");
				out.write("<td>" + rs.getInt("ci_num") + "</td>");
				out.write("<td>");
				out.write("<a href=\"/jsp-study/car/view.jsp?ci_num=" + rs.getInt("ci_num") + "\">");
				out.write("<td>"+ rs.getString("ci_name") + "</a></td>");
				out.write("<td>" + rs.getInt("ci_year") + "</td>");
				out.write("<td>" + rs.getInt("ci_year") + "</td>");
				out.write("<td><button onclick=\"carDelete(" + rs.getInt("ci_num") + ")\">삭제</button></td>");
				out.write("</tr>");
			}
			out.write("</table>");
		} catch (Exception e) {
			out.println(e);
		} finally {
			DBCon.close();
		}
	%>
	<a href="/jsp-study/food/insert.jsp">메뉴등록</a>
	<script>
		function carDelete(ciNum) {
			var isDelete = confirm("차량을 삭제하시겠습니까?");
			if (isDelete) {
				location.href = "/jsp-study/car/delete_ok.jsp?ciNum="
						+ ciNum;
			}
		}
	</script>
</body>
</html>