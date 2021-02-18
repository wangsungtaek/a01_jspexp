package jspexp.a03_database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;

import jspexp.z01_vo.Member;

public class A04_MemberDao {
	private Connection con;
	private PreparedStatement pstmt;
	private ResultSet rs;

	// 접속
	public void setCon() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		String info = "jdbc:oracle:thin:@localhost:1521:xe";
		try {
			con = DriverManager.getConnection(info, "scott", "tiger");
			System.out.println("접속 성공");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println(e.getMessage());
		}
	}

	// 로그인
	public Member login(Member login) {
		Member m = null;
		try {
			setCon();
			
			String sql = "SELECT * \n"
					+ "FROM MEMBER5\n"
					+ "WHERE id=?\n"
					+ "AND pass=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, login.getId());
			pstmt.setString(2, login.getPass());
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				m = new Member(rs.getString("id"),
						       rs.getString("pass"),
						       rs.getInt("point"),
			 			       rs.getString("name"),
						       rs.getString("auth"));
			}
			
			pstmt.close();
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("DB 에러:"+e.getMessage());
		} catch (Exception e) {
			System.out.println("일반 에러:"+e.getMessage());
		}
		
		return m;
	}
	
	// 등록확인
	public boolean checkMamber(String id) {
		boolean isMember = false;
		try {
			setCon();
			
			String sql = "SELECT *\n"
					+ "FROM MEMBER5\n"
					+ "WHERE id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1,id);
			rs = pstmt.executeQuery();
			
			isMember = rs.next();
			
			pstmt.close();
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("DB 에러:"+e.getMessage());
		} catch (Exception e) {
			System.out.println("일반 에러:"+e.getMessage());
		}
		
		return isMember;
	}
	
	public static void main(String[] args) {
//		A04_MemberDao dao = new A04_MemberDao();
		
//		System.out.println(dao.checkMamber("hima"));
	}
}
