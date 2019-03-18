package test.jsp.study.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import test.jsp.study.service.UserService;
import test.jsp.study.service.Impl.UserServiceImpl;

public class UserServlet extends HttpServlet {// HttpServlet.class를 상속받고 있어서 이 클래스가 서블릿 클래스가 된다.
	private static final long serialVersionUID = 1L;
	private UserService us = new UserServiceImpl();

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");// 22,23라인 -> utf-8로 서블릿을 설정해주는 라인.
		PrintWriter pw = response.getWriter(); //쓰는 객체를 가져오기 전에 utf-8을 가져와야(설정해주어야) 한글이 안깨진다.!
		String cmd = request.getParameter("cmd");
		if(cmd==null) {
			pw.print("커맨드 없는 요청은 정상적인 요청이 아닙니다.(doGet)");
		}else {
			if("users".equals(cmd)) {//list를 가져오게 만들기.
				pw.print(us.selectUserList(null));
			}else if("user".equals(cmd)) {//조회결과를 가져오기.
				//컨츄롤러~
				String uiNum = request.getParameter("ui_num");
				if(uiNum==null || "".equals(uiNum)){
					pw.print("404 NOT FOUND");
					//throw new ServletException("누굴 조회하실라고?"); // 500에러 , 인터널에러로 표시시켜줌 . 내부적으로 표시해야해서 로그쪽..????
					//정상적으로 진행되면 코드200번대.(웹에서는 200)
				}else {
					Map<String,String> user = new HashMap<>();
					user.put("ui_num",uiNum);
					pw.print(us.selectUser(user));
				}
			}
		}
		//http://localhost/jsp-study/user?cmd=user&ui_num=102
//		pw.println("우와 서블릿!!");
//		response.getWriter().append("Served at: ").append(request.getContextPath());
//		String str = request.getParameter("str");
//		pw.println(" 니가 넘긴 str => " + str);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");// 15,16라인 -> utf-8로 서블릿을 설정해주는 라인.
		request.setCharacterEncoding("utf-8");
		PrintWriter pw = response.getWriter();
		String cmd = request.getParameter("cmd");
		if(cmd==null) {	//커맨드 방식.
			pw.print("커맨드 없는 요청은 정상적인 요청이 아닙니다.(doPost)");
		}else {
			if("insert".equals(cmd)) {
				String uiName = request.getParameter("ui_name");
				String uiId = request.getParameter("ui_id");
				String uiAge = request.getParameter("ui_age");
				String uiEtc = request.getParameter("ui_etc");
				Map<String,String> user = new HashMap<>();
				user.put("ui_name",uiName);
				user.put("ui_id",uiId);
				user.put("ui_age",uiAge);
				user.put("ui_etc",uiEtc);
				int cnt = us.insertUser(user);
				String result = "등록 실패!";
				if(cnt==1) {
					result = "등록 성공!";
				}
				pw.print(result);
			}else if("update".equals(cmd)) {
				String uiNum = request.getParameter("ui_num");
				String uiName = request.getParameter("ui_name");
				String uiId = request.getParameter("ui_id");
				String uiAge = request.getParameter("ui_age");
				String uiEtc = request.getParameter("ui_etc");
				Map<String,String> user = new HashMap<>();
				user.put("ui_num",uiNum);
				user.put("ui_name",uiName);
				user.put("ui_id",uiId);
				user.put("ui_age",uiAge);
				user.put("ui_etc",uiEtc);
				int cnt = us.updateUser(user);
				String result = "수정 실패!";
				if(cnt==1) {
					result = "수정 성공!";
				}
				pw.print(result);
			}else if("delete".equals(cmd)) {
				String uiNum = request.getParameter("ui_num");
				Map<String,String> user = new HashMap<>();
				user.put("ui_num",uiNum);
				int cnt = us.deleteUser(user);
				String result = "삭제 실패!";
				if(cnt==1) {
					result = "삭제 성공!";
				}
				pw.print(result);
			}
		}
//		pw.println("난 포스트 방식");
//		response.getWriter().append("Served at: ").append(request.getContextPath());
//		String str = request.getParameter("str");
//		pw.println(" 니가 넘긴 str => " + str);		
	}

}
