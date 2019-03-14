<%@page import="java.util.Iterator"%>
<%@page import="java.util.Set"%>
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
/////////////////////////////////////////////////
Set<String> keys = map.keySet(); 
Iterator<String> it = keys.iterator();
while(it.hasNext()){
	String key = it.next();
	String[] values = map.get(key);
	out.write(key + " : " + values[0]);
}
///////////////Iterator 패턴//////////////////////
//String[] ids = map.get("id");
//String[] names = map.get("name");
//String credat = request.getParameter("credat");
//String[] credats = map.get("credat");
//String id = request.getParameter("id");
//String[] trans = map.get("trans");
//String[] content = map.get("content");
//if(ids!=null){
//	out.write(ids[0]);
//	out.write(names[0]);
//	out.write(credats[0]);
//	out.write(trans[0]);
//	out.write(content[0]);
//}
/*String[] ids = map.get("id");
if(ids!=null){
	out.println(ids[0]);
	out.println(ids[1]);
	out.println(ids.length);
	out.println(map.get("name")[0]);
}*/
%>
<form action="/jsp-study/req/param_ok.jsp" method="get">
	ID : <input type="text" name="id" value="skj2366"><br>
	NAME : <input type="text" name="name" value="김동근"><br>
	BIRTH : <input type="date" name="credat" value="1992-02-19"><br>
	TRANS : <select name="trans">
		<option value="m">남자</option>
		<option value="w">여자</option>
	</select><br>
	<br>
	<textarea name="content" cols="40" rows="20">
Hello World</textarea><br>
	<button type="submit">전송</button>
</form>
</body>
</html>