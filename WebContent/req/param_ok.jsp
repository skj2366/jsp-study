<%@page import="java.util.Iterator"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//Map<String, String[]> map = request.getParameterMap();

//String[] ids = map.get("id");
//String[] names = map.get("name");
//String[] credats = map.get("credat");
//String[] trans = map.get("trans");
//String[] content = map.get("content");

//if(ids!= null){
//	out.write("ID : " +ids[0]+"<br>");
//	out.write("NAME : " +names[0]+"<br>");
//	out.write("DATE : " +credats[0]+"<br>");
//	out.write("TRANS : " +trans[0]+"<br>");
//	out.write("CONTENT : " +content[0]+"<br>");
//	
//}

Map<String,String[]> map = request.getParameterMap();
Set<String> keys = map.keySet();
Iterator<String> it = keys.iterator();
while(it.hasNext()){
	String key = it.next();
	String[] values = map.get(key);
	if("content".equals(key)){
		out.write(key + " : " + values[0].replace("\r","<br>")+"<br>");
	}else{
		out.write(key + " : " + values[0]+"<br>");
	}	
}

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>