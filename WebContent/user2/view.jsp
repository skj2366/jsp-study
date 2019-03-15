<%@page import="java.sql.ResultSet"%>
<%@page import="test.jsp.study.db.DBCon"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
request.setCharacterEncoding("utf-8");
String uiNum = request.getParameter("ui_num");
//out.write(uiNum);
String sql = "select ui_num, ui_name, ui_id, ui_age, ui_etc from user_info";
sql += " where ui_num=?";
PreparedStatement ps = DBCon.getCon().prepareStatement(sql);
ps.setString(1, uiNum);
ResultSet rs = ps.executeQuery();
if(rs.next()){
%>
<form method="post" action="/jsp-study/user2/update_ok.jsp" id="userForm">
번호 : <input type="text" name="ui_num" value="<%=rs.getString("ui_num")%>"><br>
이름 : <input type="text" name="ui_name" value="<%=rs.getString("ui_name")%>"><br>
아이디 : <input type="text" name="ui_id" value="<%=rs.getString("ui_id")%>"><br>
나이 : <input type="number" name="ui_age" value="<%=rs.getString("ui_age")%>"><br>
기타 : <textarea name="ui_etc">
<%=rs.getString("ui_etc")%>
</textarea>
<button>수정</button>
<button type="button" onclick="deleteUser()">유저삭제</button>

<input type="hidden" name="ui_num" value="<%=rs.getString("ui_num")%>">
</form>
<script>
	function deleteUser(){
		document.getElementById("userForm").action="/jsp-study/user2/delete_ok.jsp";
		document.getElementById("userForm").submit();
	}
</script>
<%
}else{
	out.write("없는 번호입니당");
}
%>
<a href="/jsp-study/user2/list.jsp">돌아가기</a>
</body>
<script>
</script>
</html>