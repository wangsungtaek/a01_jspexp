package jspexp.a03_database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import jspexp.z01_vo.Emp;

public class A00_EmpDao {
	private Connection con;
	private Statement stmt;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	
	// DB 연결
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
	         e.printStackTrace();
	         System.out.println(e.getMessage());
	      }
	   }

	// emplist (부서별 최근입사일, 평균연봉) 
	public ArrayList<Emp> groupEmpList() {
		ArrayList<Emp> list = new ArrayList<Emp>();
		try {
			setCon();
			String sql = "SELECT deptno,\n"
					+ "	   MAX(hiredate) hiredate, \n"
					+ "	   ROUND(avg(sal)) sal\n"
					+ "  FROM emp2\n"
					+ " GROUP BY deptno\n"
					+ " ORDER BY deptno";
			
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);
			while (rs.next()) {
				Emp e = new Emp();
				e.setDeptno(rs.getInt("deptno"));
				e.setHiredate(rs.getDate("hiredate"));
				e.setSal(rs.getInt("sal"));
				
				list.add(e);
			}
			
			rs.close();
			stmt.close();
			con.close();
		} catch (SQLException e1) {
			e1.printStackTrace();
			System.out.println(e1.getMessage());
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return list;
	}


	public static void main(String[] args) {
//		A00_EmpDao service = new A00_EmpDao();
//		ArrayList<Emp> list = service.groupEmpList();
//		for(Emp e : list)
//			System.out.println(e.getDeptno());
	}
}
