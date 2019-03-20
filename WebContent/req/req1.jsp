<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
request.setAttribute("종인","commit");
pageContext.setAttribute("난","누구?");
session.setAttribute("backend","뒤끝");
application.setAttribute("왜웃어","같이웃자");
RequestDispatcher rd = request.getRequestDispatcher("/req/req2.jsp");
rd.forward(request, response);
%>
