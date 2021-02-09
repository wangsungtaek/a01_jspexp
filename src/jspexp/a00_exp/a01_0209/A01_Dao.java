package jspexp.a00_exp.a01_0209;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class A01_Dao {
	private Connection conn;
	private Statement stmt;
	private ResultSet rs;
	
	private String driver = "oracle.jdbc.driver.OracleDriver";
	private String url = "jdbc:oracle:thin:@localhost:1521:xe";
	private String uid = "scott";
	private String upw = "tiger";
	
	public void setCon() {

		
		// 드라이버 메모리에 로드
		try {
			Class.forName(driver);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
			e.getMessage();
		}
		
		// 자바 프로그램과 db서버와 실질적인 네트워크상의 연결
		try {
			conn = DriverManager.getConnection(url,uid,upw);
			System.out.println("연결완료");
		} catch (SQLException e) {
			e.printStackTrace();
			e.getMessage();
		}
	}

	public static void main(String[] args) {
		A01_Dao dao = new A01_Dao();
		
		dao.setCon();
	}
	
	public ArrayList<UserInfo> searchUser(String id, String name){
		ArrayList<UserInfo> list = new ArrayList<UserInfo>();
		
		String sql = "SELECT * FROM userinfo\n"
				+ "WHERE u_id LIKE '%"+id+"%'\n"
				+ "AND name LIKE '%"+name+"%'";
		try {
			setCon();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				UserInfo user = new UserInfo(rs.getString("u_id"),
											 rs.getString("u_pw"),
											 rs.getString("name"),
											 rs.getInt("point"),
											 rs.getString("address"),
											 rs.getDate("regdate"),
											 rs.getInt("authority"));
				list.add(user);
			}
			
			rs.close();
			stmt.close();
			conn.close();
			
		} catch (SQLException e) {
			
			e.printStackTrace();
			e.getMessage();
		}
		
		return list;
	}
}
