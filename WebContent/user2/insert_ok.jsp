<%@page import="test.jsp.study.db.DBCon"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");
String uiName = request.getParameter("ui_name");
String uiId = request.getParameter("ui_id");
String uiAge = request.getParameter("ui_age");
String uiEtc = request.getParameter("ui_etc");
String result = "";
String sql = "insert into user_info";
sql += " (ui_num,ui_name,ui_id,ui_age,ui_etc)";
sql += " values(seq_ui_num.nextval,?,?,?,?)";

try{
	PreparedStatement ps = DBCon.getCon().prepareStatement(sql);
	ps.setString(1, uiName);
	ps.setString(2, uiId);
	ps.setString(3, uiAge);
	ps.setString(4, uiEtc);
	int cnt = ps.executeUpdate();
	result = "회원가입 실패";
	if(cnt==1){
		result = "성공";
	}
}catch(Exception e){
	
}finally{
	DBCon.close();
}

%>
<script>
	alert("<%=result%>");
	location.href = "/jsp-study/user2/insert.jsp";
</script>