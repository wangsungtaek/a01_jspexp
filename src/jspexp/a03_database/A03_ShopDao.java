package jspexp.a03_database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;

import jspexp.z01_vo.Product3;

public class A03_ShopDao {
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

	// 조회 메서드
	public ArrayList<Product3> shopList(){
		Product3 pro = new Product3("", 0, 99999);
		return shopList(pro);
	}
	
	public ArrayList<Product3> shopList(String pname, String fr, String to){
		if(pname == null || pname.equals("")) pname = "";
		if(fr == null || fr.equals("")) fr = "0";
		if(to == null || to.equals("")) to = "99999";
		
		Product3 pro = new Product3(pname, Integer.parseInt(fr), Integer.parseInt(to));
		return shopList(pro);
	}

	public ArrayList<Product3> shopList(Product3 sch) {
		ArrayList<Product3> plist = new ArrayList<Product3>();
		try {
			setCon();
			String sql = "SELECT * FROM PRODUCT2 WHERE name LIKE '%'||'"+sch.getName()+"'||'%'\n"
					+ "   AND price BETWEEN "+sch.getFr_price()+" AND "+sch.getTo_price()+" ORDER BY pno desc";
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);
			while (rs.next()) {
				plist.add(new Product3(rs.getInt("pno"),
									   rs.getString("name"),
									   rs.getInt("price"),
									   rs.getInt("cnt"),
									   rs.getDate("credte"),
									   rs.getString("comp"),
									   rs.getDate("incomdte"),
									   rs.getString("inmanager")));
			}
			rs.close();
			stmt.close();
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("DB 에러:"+e.getMessage());
		} catch (Exception e) {
			System.out.println("일반 에러:"+e.getMessage());
		}
		return plist;
	}	

	// 등록 메서드
	public void insertProduct(Product3 ins) {
		ArrayList<Product3> plist = new ArrayList<Product3>();
		try {
			setCon();
			con.setAutoCommit(false);
			String sql = "INSERT INTO product2 VALUES(prod2_seq.nextval, '"+ins.getName()+"',"+ins.getPrice()+","+ins.getCnt()+",sysdate,\n"
					+ "	'"+ins.getCompany()+"', sysdate, '"+ins.getInmanager()+"')";
			System.out.println(sql);
			stmt = con.createStatement();
			stmt.executeUpdate(sql);
			
			con.commit();
			stmt.close();
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("DB 에러:"+e.getMessage());
			try {
				con.rollback();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		} catch (Exception e) {
			System.out.println("일반 에러:"+e.getMessage());
		}
	}
	
	// 단일데이터 메서드
	public Product3 getProd(int prono) {
		Product3 pro = null;
		try {
			setCon();
			String sql = "SELECT * FROM PRODUCT2 WHERE PNO = "+prono;
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);
			if (rs.next()) {
				pro = new Product3(rs.getInt("pno"),
								   rs.getString("name"),
								   rs.getInt("price"),
								   rs.getInt("cnt"),
								   rs.getDate("credte"),
								   rs.getString("comp"),
								   rs.getDate("incomdte"),
								   rs.getString("inmanager"));
			}
			rs.close();			
			stmt.close();
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("상세 조회 에러:"+e.getMessage());
		} catch (Exception e) {
			System.out.println("일반 에러:"+e.getMessage());
		}
		
		return pro;
	}

	// updatae
	public void updateProd(Product3 prod) {
		try {
			setCon();
			con.setAutoCommit(false);
			
			String sql = "UPDATE product2\n"
					+ "   SET  name = ?,\n"
					+ "   	   price = ?,\n"
					+ "   	   cnt = ?,\n"
					+ "   	   credte = to_date(?,'YYYY-MM-DD'),\n"
					+ "   	   comp = ?,\n"
					+ "   	   incomdte = to_date(?,'YYYY-MM-DD'),\n"
					+ "   	   inmanager = ?\n"
					+ "WHERE pno = ?";
			System.out.println(sql);
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, prod.getName());
			pstmt.setInt(2, prod.getPrice());
			pstmt.setInt(3, prod.getCnt());
			pstmt.setString(4, prod.getCredteS());
			pstmt.setString(5, prod.getCompany());
			pstmt.setString(6, prod.getIncomedteS());
			pstmt.setString(7, prod.getInmanager());
			pstmt.setInt(8, prod.getPno());
			pstmt.executeUpdate();
			System.out.println(sql);
			con.commit();
			
			pstmt.close();
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println(e.getMessage());
			try {
				con.rollback();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
	}

	// 삭제 메서드
	public void delete(int pno) {
		try {
			setCon();
			con.setAutoCommit(false);
			String sql = "DELETE product2 WHERE pno=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, pno);
			pstmt.executeUpdate();
			
			con.commit();
			pstmt.close();
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("DB 에러:"+e.getMessage());
			try {
				con.rollback();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		} catch (Exception e) {
			System.out.println("일반 에러:"+e.getMessage());
		}
	}

	public static void main(String[] args) {
		A03_ShopDao dao = new A03_ShopDao();
	}
}
