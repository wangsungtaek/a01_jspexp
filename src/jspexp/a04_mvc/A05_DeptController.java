package jspexp.a04_mvc;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jspexp.a03_database.A02_DeptDao;
import jspexp.z01_vo.Dept;

/**
 * Servlet implementation class A05_DeptController
 */
@WebServlet(name = "dept.do", urlPatterns = { "/dept.do" })
public class A05_DeptController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public A05_DeptController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		request.setCharacterEncoding("utf-8");
		String dname = request.getParameter("dname");
		String loc = request.getParameter("loc");
		
		if(dname == null) dname = "";
		if(loc == null) loc = "";
		
		A02_DeptDao dao = new A02_DeptDao();
		request.setAttribute("deptList", dao.deptList(new Dept(dname, loc)));
		
		request.getRequestDispatcher("a11_mvc/a04_deptList.jsp").forward(request, response);
	}
}
