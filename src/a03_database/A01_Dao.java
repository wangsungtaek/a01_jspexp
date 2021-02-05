package a03_database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class A01_Dao { // DAO : database access object
	// 1. 데이터베이스 연결 처리
	private Connection con;
	// 2. 대화
	// 3. 결과값 받는 객체.
	
	// # 연결 처리 기능메서드.
	public void setCon() {
		// 1. driver 메모리 로딩.
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		// 2. 특정 서버
		//	- 접속 정보 : 드라이버명:@ip:port:sid
		String info = "jdbc:oracle:thin:@localhost:1521:xe";
		try {
			con = DriverManager.getConnection(info, "scott", "tiger");
			System.out.println("접속 성공 !!! ^^ ㅎㅎ");
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		A01_Dao dao = new A01_Dao();
		dao.setCon();
	}
}
