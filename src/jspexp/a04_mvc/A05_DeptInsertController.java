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
import jspexp.z01_vo.Emp;

/**
 * Servlet implementation class A05_DeptInsertController
 */
@WebServlet(name = "deptInsert.do", urlPatterns = { "/deptInsert.do" })
public class A05_DeptInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public A05_DeptInsertController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		// 1. 요청값
		request.setCharacterEncoding("utf-8");
		String deptno = request.getParameter("deptno"); if(deptno == null) deptno=""; log("deptno:"+deptno);
		String dname = request.getParameter("dname"); if(dname == null) dname=""; log("dname:"+dname);
		String loc = request.getParameter("loc"); if(loc == null || loc.trim().equals("")) loc="0"; log("mgr:"+loc);

		if(!dname.equals("")){
			Dept ins = new Dept(new Integer(deptno), dname, loc);
		
			A02_DeptDao dao = new A02_DeptDao();
			dao.insertDept(ins);
		}
		
		// 3. view호출.
		String page = "a11_mvc/a04_deptInsert.jsp";
		RequestDispatcher rd = request.getRequestDispatcher(page);
		rd.forward(request, response);
	}

}
