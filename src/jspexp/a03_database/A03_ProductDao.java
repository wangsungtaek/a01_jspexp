package jspexp.a03_database;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import jspexp.z01_vo.Dept;
import jspexp.z01_vo.Product2;
import jspexp.z01_vo.Product3;

public class A03_ProductDao {

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

	public ArrayList<Product2> produtList() {
		ArrayList<Product2> plist = new ArrayList<Product2>();
		try {
			setCon();
			String sql = "select * from product2";
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);
			while (rs.next()) {
				plist.add(new Product2(rs.getInt("pno"),
									   rs.getString("pname"),
									   rs.getInt("price"),
									   rs.getInt("cnt"),
									   rs.getDate("regdate"),
									   rs.getString("mfg"),
									   rs.getDate("wrhsdate"),
									   rs.getString("director")));
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
		return plist;
	}	
	
	public ArrayList<Product2> produtList(String pname, int from, int to) {
		ArrayList<Product2> plist = new ArrayList<Product2>();
		try {
			setCon();
			String sql = "SELECT * FROM product2\n"
					+ " WHERE NAME LIKE '%'||?||'%'\n"
					+ "AND PRICE BETWEEN ? AND ?";
			System.out.println(sql);
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, pname);
			pstmt.setInt(2, from);
			pstmt.setInt(3, to);
			
			rs = pstmt.executeQuery();
			while (rs.next()) {
				plist.add(new Product2(rs.getInt("pno"),
									   rs.getString("name"),
									   rs.getInt("price"),
									   rs.getInt("cnt"),
									   rs.getDate("credte"),
									   rs.getString("comp"),
									   rs.getDate("incomdte"),
									   rs.getString("inmanager")));
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
		return plist;
	}	
	
	public Product2 getProduct(int pno) {
		Product2 prod = null;
		try {
			setCon();
			String sql = "SELECT * FROM product2"
					   + " WHERE pno = "+pno;
			System.out.println(sql);
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);
			if(rs.next()) {
				prod = new Product2(rs.getInt("pno"),
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
			System.out.println(e.getMessage());
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}	

		return prod;
	}
	
	public void insertProd(Product2 prod) {
		try {
			setCon();
			String sql = "INSERT INTO product2"
					+ " VALUES(product_seq.nextval,"
					+ "'"+prod.getPname()+"',"
					+ ""+prod.getPrice()+","
					+ ""+prod.getCnt()+","
					+ "to_date('"+prod.getRegdate_s()+"','YYYY/MM/DD'),"
					+ "'"+prod.getMfg()+"',"
					+ "to_date('"+prod.getWrhsdate_s()+"','YYYY/MM/DD'),"
					+ "'"+prod.getDirector()+"')";
			System.out.println(sql);
			stmt = con.createStatement();
			stmt.executeQuery(sql);
			
			stmt.close();
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println(e.getMessage());
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
	}
	
	public static void main(String[] args) {
		A03_ProductDao dao = new A03_ProductDao();
		
		
	}
}
