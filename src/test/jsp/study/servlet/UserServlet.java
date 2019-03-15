package test.jsp.study.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class UserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");//15,16라인 -> utf-8로 서블릿을 설정해주는 라인.
		PrintWriter pw = response.getWriter();
		pw.println("우와 서블릿!!");
		response.getWriter().append("Served at: ").append(request.getContextPath());
		String str = request.getParameter("str");
		pw.println(" 니가 넘긴 str => " + str);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
