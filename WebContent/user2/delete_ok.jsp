<%@page import="test.jsp.study.db.DBCon"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");
String uiNum = request.getParameter("ui_num");

String sql = "delete from user_info where ui_num=?";
PreparedStatement ps = DBCon.getCon().prepareStatement(sql);
ps.setString(1, uiNum);

int cnt = ps.executeUpdate();
String result="Delete Fali";
if(cnt==1){
	result = "No." + uiNum + " delete complete.";
}

%>
<script>
	alert("<%=result%>");
	location.href="/jsp-study/user2/list.jsp";
</script>