package test.jsp.study.service.Impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import test.jsp.study.dao.UserDAO;
import test.jsp.study.dao.impl.UserDAOImpl;
import test.jsp.study.service.UserService;

public class UserServiceImpl implements UserService {

	private UserDAO udao = new UserDAOImpl();
	
	@Override
	public List<Map<String, String>> selectUserList(Map<String, String> user) {

		return udao.selectUserList(user);
	}

	@Override
	public Map<String, String> selectUser(Map<String, String> user) {

		return udao.selectUser(user);
	}

	@Override
	public int insertUser(Map<String, String> user) {

		return udao.insertUser(user);
	}

	@Override
	public int updateUser(Map<String, String> user) {

		return udao.updateUser(user);
	}

	@Override
	public int deleteUser(Map<String, String> user) {

		return udao.deleteUser(user);
	}

	public static void main(String[] args) {
		UserService us = new UserServiceImpl();
		Map<String,String> user = new HashMap<>();
		
		System.out.println("selectUserList : " + us.selectUserList(user)); //List 조회
		System.out.println("");
		user.put("ui_num", "101");
		System.out.println("selectUser : " + us.selectUser(user));
		System.out.println("");
		
//		user.put("ui_name","가가가");
//		user.put("ui_id","gagaga");
//		user.put("ui_age","99");
//		user.put("ui_etc","가가가");
//		System.out.println("insertUser : " + us.insertUser(user));
		
//		user.put("ui_name","다다다");
//		user.put("ui_id","다다다");
//		user.put("ui_age","999");
//		user.put("ui_etc","다다다");
//		user.put("ui_num", "102");
//		System.out.println("updateUser : " + us.updateUser(user));
		
		user.put("ui_num","103");
		System.out.println("deleteUser : " + us.deleteUser(user));
			
		
	}
}
