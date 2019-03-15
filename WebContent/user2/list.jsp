<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="test.jsp.study.db.DBCon"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form method="get" action="">
이름 : <input type="text" name="ui_name">
<button>search</button>
</form>
<%
request.setCharacterEncoding("utf-8");
String uiName = request.getParameter("ui_name");
String sql = "select ui_num, ui_name, ui_id, ui_age, ui_etc from user_info where 1=1";
if(uiName!=null){
	sql += " and ui_name like '%'||?||'%'";
}
PreparedStatement ps =  DBCon.getCon().prepareStatement(sql);
if(uiName!=null){
	ps.setString(1, uiName);
}
ResultSet rs = ps.executeQuery();
while(rs.next()){
	out.write(rs.getString("ui_num") + ", ");
	out.write("<a href=\"/jsp-study/user2/view.jsp?ui_num="); 
	out.write(rs.getString("ui_num")+"\">" + rs.getString("ui_name") + "</a>");
	out.write(rs.getString("ui_id") + ", ");
	out.write(rs.getString("ui_age") + ", ");
	out.write(rs.getString("ui_etc"));
	out.write(" <button onclick=\"deleteUser(" + rs.getString("ui_num") + ")\">삭제</button><br>");
	
}
%>
<a href="/jsp-study/user2/insert.jsp"><button>회원가입</button></a>
<script>
	
	function deleteUser(uiNum){
		window.document.getElementById("ui_num").value=uiNum;
		//document.querySelector('#ui_num').value = uiNum;//바닐라JS 요즘은 이 양식으로 더 많이 쓴다.
		document.getElementById("deleteForm").submit();
	}
</script>
<form method="post" id="deleteForm" action="/jsp-study/user2/delete_ok.jsp">
	<input type="hidden" name="ui_num" id="ui_num">
</form>
</body>
</html>