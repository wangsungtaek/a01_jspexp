package jspexp.a03_database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import jspexp.z01_vo.Dept;

public class A02_DeptDao {

	private Connection con;
	private Statement stmt;
	private PreparedStatement pstmt;
	private ResultSet rs;

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
	
	public Dept getDept(int deptno) {
		Dept d=null;
		try {
			setCon();
			
			String sql = "select * from dept2 where deptno="+deptno;
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);
			
			if (rs.next()) {
				d = new Dept(rs.getInt(1),
							 rs.getString(2),
							 rs.getString(3));
			}
			
			rs.close();
			stmt.close();
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println(e.getMessage());
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		System.out.println(deptno);
		System.out.println(d);
		return d;
	}
	
	public Dept getDept2(int deptno) {
		Dept d=null;
		try {
			setCon();
			String sql = "select * from dept2 where deptno= ? ";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, deptno);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				d = new Dept(rs.getInt(1),
							 rs.getString(2),
							 rs.getString(3));
			}
			rs.close();
			pstmt.close();
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println(e.getMessage());
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return d;
	}
	
	public ArrayList<Dept> deptList() {
		ArrayList<Dept> dlist = new ArrayList<Dept>();
		try {
			setCon();
			String sql = "select * from dept2";
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);
			while (rs.next()) {
				System.out.print(rs.getInt(1) + "\t");
				System.out.print(rs.getString(2) + "\t");
				System.out.println(rs.getString("loc"));
				dlist.add(new Dept(rs.getInt(1), rs.getString(2), rs.getString(3)));

			}
			System.out.println("데이터의 건수 : " + dlist.size());
			System.out.println("두번째 행의 부서명 : " + dlist.get(1).getDname());
			rs.close();
			stmt.close();
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println(e.getMessage());
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return dlist;
	}	
	
	public ArrayList<Dept> deptList(Dept sch) {
		ArrayList<Dept> dlist = new ArrayList<Dept>();
		// 1. 연결
		try {
			setCon();
			// 2. 대화 sql
			String sql = "SELECT * \r\n" + "FROM dept2\r\n" + "WHERE dname LIKE '%'||'" + sch.getDname() + "'||'%'\r\n"
					+ "AND loc LIKE '%'||'" + sch.getLoc() + "'||'%'";
			stmt = con.createStatement();
			// 3. 결과
			rs = stmt.executeQuery(sql);
			while (rs.next()) {
				dlist.add(new Dept(rs.getInt(1), rs.getString(2), rs.getString(3)));
			}
			System.out.println("데이터 크기 : " + dlist.size());
			// 4. 자원해제
			rs.close();
			stmt.close();
			con.close();
			// 5. 예외 처리.
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("## db처리 예외 ##");
			System.out.println(e.getMessage());
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("## 일반 예외 ##");
			System.out.println(e.getMessage());
		}

		return dlist;
	}

	public void insertDept(Dept ins) {
		try {
			setCon();
			stmt = con.createStatement();
			String sql = "INSERT INTO dept2 values(" + "" + ins.getDeptno() + "," + "'" + ins.getDname() + "'," + "'"
					+ ins.getLoc() + "')";
			System.out.println("####");
			System.out.println(sql);
			stmt.executeUpdate(sql);
			con.commit();
			stmt.close();
			con.close();

		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("db 처리 에리");
			try {
				con.rollback();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		} catch (Exception e) {
			System.out.println("일반에러");
		}
	}

	public void updateDept(Dept upd) {
		try {
			setCon();
			con.setAutoCommit(false);
			
			String sql = "UPDATE dept2\n"
					+ "   SET dname = ?,\n"
					+ "   	  loc = ?\n"
					+ "WHERE DEPTNO = ?";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, upd.getDname());
			pstmt.setString(2, upd.getLoc());
			pstmt.setInt(3, upd.getDeptno());
			
			pstmt.executeUpdate();
			
			con.commit();
			rs.close();
			pstmt.close();
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println(e.getMessage());
			try {
				con.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
	}

	public void deleteDept(int deptno) {
		try {
			setCon();
			con.setAutoCommit(false);
			
			String sql = "delete dept2 where deptno = ?";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, deptno);
			
			pstmt.executeUpdate();
			
			con.commit();
			rs.close();
			pstmt.close();
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println(e.getMessage());
			try {
				con.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
	}
	
	public static void main(String[] args) {
//		A02_DeptDao dao = new A02_DeptDao();
		
	}
}
