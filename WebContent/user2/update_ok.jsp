<%@page import="test.jsp.study.db.DBCon"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; 63charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");
String uiNum = request.getParameter("ui_num");
String uiName = request.getParameter("ui_name");
String uiId = request.getParameter("ui_id");
String uiEtc = request.getParameter("ui_etc");
String uiAge = request.getParameter("ui_age");

String sql = "update user_info set ui_name=?, ui_age=?, ui_id=?, ui_etc=? where ui_num=?";
PreparedStatement ps = DBCon.getCon().prepareStatement(sql);
ps.setString(1,uiName);
ps.setString(2,uiAge);
ps.setString(3,uiId);
ps.setString(4,uiEtc);
ps.setString(5,uiNum);

int cnt = ps.executeUpdate();
String result = "Update Fail";
if(cnt==1){
	result = "Update Complete";
}else{
	result = "Update Fail";
}

%>
<script>
	alert("<%=result%>");
	location.href = "/jsp-study/user2/list.jsp";
</script>