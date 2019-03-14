<%@page import="java.util.Map"%>
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
Map<String,String[]> map = request.getParameterMap();
String[] name = map.get("ui_name");
String[] id = map.get("ui_id");
String[] age = map.get("ui_age");
String[] etc = map.get("ui_etc");

if(id !=null && name !=null){
	out.println(id[0]);
	out.println(name[0]);
	out.println(age[0]);
	out.println(etc[0]);
}
%>
<form method="post" action="/jsp-study/user2/insert_ok.jsp">
	<table border="1">
		<tr>
			<th>이름</th>
			<td><input type="text" name="ui_name"></td>
		</tr>
		<tr>
			<th>아이디</th>
			<td><input type="text" name="ui_id"></td>
		</tr>
		<tr>
			<th>나이</th>
			<td><input type="text" name="ui_age"></td>
		</tr>
		<tr>
			<th>기타</th>
			<td><input type="text" name="ui_etc"></td>
		</tr>
	</table>
	<button type="submit">회원가입</button>	
</form>
</body>
</html>