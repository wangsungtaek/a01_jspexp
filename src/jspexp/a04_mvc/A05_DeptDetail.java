package jspexp.a04_mvc;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jspexp.a03_database.A01_Dao;
import jspexp.a03_database.A02_DeptDao;
import jspexp.z01_vo.Dept;

/**
 * Servlet implementation class A05_DeptDetail
 */
@WebServlet(name = "deptDetail.do", urlPatterns = { "/deptDetail.do" })
public class A05_DeptDetail extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public A05_DeptDetail() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");

		int deptno = 1;
		String dname = "";
		String loc = "";
		
		// request
		String deptnoS = request.getParameter("deptno");
		String dnameS = request.getParameter("dname");
		String locS = request.getParameter("loc");
		String proc = request.getParameter("proc");
		
		// 조건검사
		if(deptnoS != null && !deptnoS.equals("")) deptno = Integer.parseInt(deptnoS);
		if(dnameS !=null && !dnameS.equals("")) dname = dnameS;
		if(locS !=null && !locS.equals("")) loc = locS;
		
		A02_DeptDao dao = new A02_DeptDao();
		
		if(proc != null) {
			if(proc.equals("update"))
				dao.updateDept(new Dept(deptno, dname, loc));
			if(proc.equals("delete"))
				dao.deleteDept(deptno);
		}
		request.setAttribute("dept", dao.getDept(deptno));
		
		// 3. 뷰호출
		String page = "a11_mvc/a04_deptDetail.jsp";
		RequestDispatcher rd = request.getRequestDispatcher(page);
		rd.forward(request, response);
	}
}
