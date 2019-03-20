<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%=pageContext.getAttribute("난")%> <!--// null  -->
<%=request.getAttribute("종인") %> <!--  //commit-->
<%=session.getAttribute("backend") %><!-- // 뒤끝 -->
<%=application.getAttribute("왜웃어") %> <!-- //같이웃자 -->
<%
//RequestDispatcher rd = request.getRequestDispatcher("/req/req3.jsp");
//rd.forward(request, response);
%>