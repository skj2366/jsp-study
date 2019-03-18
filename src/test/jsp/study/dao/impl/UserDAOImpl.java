package test.jsp.study.dao.impl;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import test.jsp.study.dao.UserDAO;
import test.jsp.study.db.DBCon;

public class UserDAOImpl implements UserDAO {

	@Override
	public List<Map<String, String>> selectUserList(Map<String, String> user) {
		String sql = "select ui_num,ui_name,ui_id,ui_age,ui_etc from user_info";
		List<Map<String,String>> userList = new ArrayList<>();
		try {
			PreparedStatement ps = DBCon.getCon().prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				Map<String,String> u = new HashMap<>();
				u.put("ui_num",rs.getString("ui_num"));
				u.put("ui_name",rs.getString("ui_name"));
				u.put("ui_id",rs.getString("ui_id"));
				u.put("ui_age",rs.getString("ui_age"));
				u.put("ui_etc",rs.getString("ui_etc"));
				userList.add(u);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return userList;//null을 해도 상관없다고는 함.
	}

	@Override
	public Map<String, String> selectUser(Map<String, String> user) {//Map으로 안받아도 상관없지만.(단일건으로는 1개로밖에 안받는다)
		String sql = "select ui_num, ui_name, ui_id, ui_age, ui_etc from user_info";
		sql += " where ui_num=?";
		try {
			PreparedStatement ps = DBCon.getCon().prepareStatement(sql);
			ps.setString(1, user.get("ui_num"));
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				Map<String,String> u = new HashMap<>();
				u.put("ui_num",rs.getString("ui_num"));
				u.put("ui_name",rs.getString("ui_name"));
				u.put("ui_id",rs.getString("ui_id"));
				u.put("ui_age",rs.getString("ui_age"));
				u.put("ui_etc",rs.getString("ui_etc"));
				return u;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public int insertUser(Map<String, String> user) {
		String sql = "insert into user_info";
		sql += " (ui_num, ui_name, ui_id, ui_age, ui_etc)";
		sql += " values(seq_ui_num.nextval,?,?,?,?)";
		try {
			PreparedStatement ps = DBCon.getCon().prepareStatement(sql);
			ps.setString(1, user.get("ui_name"));
			ps.setString(2, user.get("ui_id"));
			ps.setString(3, user.get("ui_age"));
			ps.setString(4, user.get("ui_etc"));
			return ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return 0;
	}

	@Override
	public int updateUser(Map<String, String> user) {
		String sql = "update user_info set ui_name=?, ui_id=?, ui_age=?, ui_etc=?";
		sql += " where ui_num=?";
		try {
			PreparedStatement ps = DBCon.getCon().prepareStatement(sql);
			ps.setString(1, user.get("ui_name"));
			ps.setString(2, user.get("ui_id"));
			ps.setString(3, user.get("ui_age"));
			ps.setString(4, user.get("ui_etc"));
			ps.setString(5, user.get("ui_num"));
			return ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return 0;
	}

	@Override
	public int deleteUser(Map<String, String> user) {
		String sql = "delete from user_info where ui_num=?";
		try {
			PreparedStatement ps = DBCon.getCon().prepareStatement(sql);
			ps.setString(1, user.get("ui_num"));
			return ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return 0;
	}
	
	public static void main(String[] args) {
		UserDAO udao = new UserDAOImpl();
		System.out.println(udao.selectUserList(null));
		
		/**/Map<String,String> user = new HashMap<>();
		/**/user.put("ui_num","81");
		/**/System.out.println(udao.selectUser(user));// Mock Data(Mak Data) 목업, ㅋㅋ 막다루는 가상의 데이터. 필요에 의하여 만들어진 데이터.시험에 나와요.
		
//		user.put("ui_name","임꺽정");
//		user.put("ui_age","33");
//		user.put("ui_id","LimKKJ");
//		user.put("ui_etc", "의적");
//		System.out.println(udao.insertUser(user));
		
//		user.put("ui_name","꺽정이");
//		user.put("ui_age","22");
//		user.put("ui_id","KKJLee");
//		user.put("ui_etc","갓적");
//		user.put("ui_name","81");
//		System.out.println(udao.updateUser(user));
		
		user.put("ui_num","81");
		System.out.println(udao.deleteUser(user));
		
	}

}
