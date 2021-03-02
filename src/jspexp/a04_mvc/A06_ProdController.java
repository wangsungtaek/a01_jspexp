package jspexp.a04_mvc;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jspexp.a03_database.A03_ShopDao;

/**
 * Servlet implementation class A06_ProdController
 */
@WebServlet(name = "prod.do", urlPatterns = { "/prod.do" })
public class A06_ProdController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public A06_ProdController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		request.setCharacterEncoding("utf-8");
		String pname = request.getParameter("pname");
		String fromPrice = request.getParameter("fromPrice");
		String toPrice = request.getParameter("toPrice");
		
		if(pname == null) pname = "";
		if(fromPrice == null) fromPrice = "";
		if(toPrice == null) toPrice = "";
		
		A03_ShopDao dao = new A03_ShopDao();
		request.setAttribute("prodList", dao.shopList(pname, fromPrice, toPrice));
		request.getRequestDispatcher("a00_exp/a12_0302/a01_exp.jsp").forward(request, response);
	}

}
