<%@page import="test.jsp.study.db.DBCon"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");
String[] ciNums = request.getParameterValues("ci_num");//배열로 여러 값을 가져올수있다.
String result ="체크박스를 선택해주세요";
if(ciNums==null){
%>
<script>
	alert("<%=result%>");
	location.href="/jsp-study/car2/list.jsp";
</script>
<%
}else{
	String sql = "delete from car_info where 1=1";
	sql += " and ci_num in(";
	for(int i=0;i<ciNums.length;i++){
		sql += "?,"; 
	}
	sql = sql.substring(0,sql.length()-1);//0번째부터 sql의 길이의 -1까지 만 출력.
	sql += ")";

	PreparedStatement ps = DBCon.getCon().prepareStatement(sql);
	for(int i=0;i<ciNums.length;i++){
		ps.setString(i+1, ciNums[i]);
	}

	int cnt = ps.executeUpdate();
	result ="삭제 실패";
	if(cnt==ciNums.length){
		result = "삭제 성공";
	}	
}

%>
<script>
	alert("<%=result%>");
	location.href="/jsp-study/car2/list.jsp";
</script>
    