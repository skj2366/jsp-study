<%@page import="java.sql.ResultSet"%>
<%@page import="test.jsp.study.db.DBCon"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String ciNum = request.getParameter("ciNum");
String sql = "select ci_num, ci_name, ci_year, ci_vendor, ci_etc from car_info where ci_num=?";
PreparedStatement ps = DBCon.getCon().prepareStatement(sql);
ps.setString(1, ciNums);
ResultSet rs = ps.executeQuery();
if(rs.next()) {
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form method="post"action="/jsp-study/car/update_ok.jsp">
	차량번호 : <input type="number"name="ciNum"value="<%=ciNum%>"readonly="readonly"><br>
	차량명 : <input type="text"name="ciName"value="<%=rs.getString("ci_name")%>"><br>
	차량연식 : <input type="number"name="ciYear"value="<%=rs.getString("ci_year")%>"><br>
	차량밴더 : <input type="number"name="ciVendor"value="<%=rs.getString("ci_vendor")%>"><br>
	차량정보 : <input type="number"name="ciEtc"value="<%=rs.getString("ci_etc")%>"><br>	
	<button>수정</button>
</form>
<a href="/jsp-study/car/list.jsp">차량리스트</a>
</body>
</html>
<%
}else {
	out.write("<b>조회하신 "+ciNum+" 번호는 존재하지 않습니다!</b>");
	out.write("<a href=\"/jsp-study/car/list.jsp\">차량리스트</a>");
}
%>