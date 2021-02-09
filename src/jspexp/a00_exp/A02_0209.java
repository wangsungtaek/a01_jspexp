package jspexp.a00_exp;

import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Date;

public class A02_0209 {

//[하] 1. jsp화면에서 Database를 처리한 결과를 출력할려고 한다. 처리하는 process를 정리하세요.
//	1) 데이터베이스 드라이버를 통해 오라클 데이터 베이스를 메모리에 할당한다.
//	2) 연결객체인 Connection를 이용하여 연결을 한다.
//	3) 대화객체 Statement를 통해 쿼리문 전달
//	4) 결과객체 ResultSet를 통해 결과값 확인

//[하] 2.    SELECT ename, 
//        to_char(hiredate,'YYYY') year,
//        to_char(hiredate,'MM') month,
//        to_char(hiredate,'W') weekyear,
//        to_char(hiredate,'DAY') day
//       FROM emp
//       WHERE to_char(hiredate,'W') = '1';에 해당하는 vo 객체과 DAO 메서드를 선언해보세요.
	
//	public class Emp {
//		private Date year;
//		private Date month;
//		private Date weekyear;
//		private Date day;
//		
//		public Emp() {
//		
//		}
//		public Emp(Date year, Date month, Date weekyear, Date day) {
//			this.year = year;
//			this.month = month;
//			this.weekyear = weekyear;
//			this.day = day;
//		}
//
//		public Date getYear() {
//			return year;
//		}
//
//		public void setYear(Date year) {
//			this.year = year;
//		}
//
//		public Date getMonth() {
//			return month;
//		}
//
//		public void setMonth(Date month) {
//			this.month = month;
//		}
//
//		public Date getWeekyear() {
//			return weekyear;
//		}
//
//		public void setWeekyear(Date weekyear) {
//			this.weekyear = weekyear;
//		}
//
//		public Date getDay() {
//			return day;
//		}
//
//		public void setDay(Date day) {
//		<td><%=m.getId() %></td>	this.day = day;
//		}
//	}

//[하] 4. Connection, Statement, ResultSet 객체의 생성과정을 메서드와 함께 기술하세요.
//	Connection con = DriverManager.getConnection("접속정보", "scott", "tiger");
//	Statement stmt = con.createStatement();
//	ResultSet rs stmt.excuteQuery(sql);
	
//[하] 5. ResultSet 객체의 rs.next(), rs.getString()의 기능을 구체적으로 기술하고, while()과의
//    관계를 기술하세요.
//	1) rs.next() : 행단위 변경
//	2) re.getString() : 열단위 변경

//[중] 6. select * from member를 데이터를 확인하고, 조회되는 메서드를 DAO로 구현하세요.
}
