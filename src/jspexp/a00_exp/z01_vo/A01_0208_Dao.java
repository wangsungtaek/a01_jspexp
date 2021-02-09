package jspexp.a00_exp.z01_vo;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class A01_0208_Dao {
	// 공통 필드 선언
	private Connection con;
	private Statement stmt;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
   // # 연결 처리 기능메서드
   public void setCon() {
      // 1. driver 메모리 로딩
      try {
         Class.forName("oracle.jdbc.driver.OracleDriver");
      } catch (ClassNotFoundException e) {
         e.printStackTrace();
      }
      // 2. 특정 서버
      //      - 접속 정보 : 드라이버명:@ip:port:sid
      String info = "jdbc:oracle:thin:@localhost:1521:xe";
      //드라이버 매니저 객체를 통해서 Connection 객체를 생성
      try {
         con = DriverManager.getConnection(info, "scott", "tiger");
         System.out.println("접속 성공");
      } catch (SQLException e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
         System.out.println(e.getMessage());
      }
   }
   // 기능 메서드 select * from MEMBER
   public ArrayList<Member> getMemberList() {
	   ArrayList<Member> mlist = null;
	   try {
		   // 1. 공통 연결메서드.
		   setCon();
		   // 2. Statement 객체
		   	stmt = con.createStatement();
		   // 3. ResultSet
		   	String sql = "select * from member";
		   	rs = stmt.executeQuery(sql);
		   // 4. while처리
		   	while(rs.next()) {
		   		System.out.print(rs.getString("U_ID")+"\t");
		   		System.out.print(rs.getString("U_PW")+"\t");
		   		System.out.print(rs.getString("U_NAME")+"\t");
		   		System.out.print(rs.getDate("U_JOINDATE")+"\n");
		   }
		   // 5. 자원해제
		   rs.close();
		   stmt.close();
	   // 6. Exception 정리
	   } catch(SQLException e) {
		   e.printStackTrace();
		   System.out.println("# DB 관련 예외 #");
		   System.out.println(e.getMessage());
	   } catch(Exception e) {
		   System.out.println("# 기타 예외 #");
		   System.out.println(e.getMessage());
	   }
	   return mlist;
   }
   public static void main(String[] args) {
	   A01_0208_Dao dao = new A01_0208_Dao();
	   
	   dao.getMemberList();

	}
}
