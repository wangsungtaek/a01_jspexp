package jspexp.a04_mvc;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jspexp.a03_database.A03_ShopDao;

/**
 * Servlet implementation class A06_ProdDetailController
 */
@WebServlet(name = "prodDetail.do", urlPatterns = { "/prodDetail.do" })
public class A06_ProdDetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public A06_ProdDetailController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
//		name,price,cnt,credte,inmanager
		int pno = 0;
		int price = 0;
		int cnt = 0;
		String credte = "";
		String inmanager = "";
				
		String pno_ = request.getParameter("pno");
		String price_ = request.getParameter("price");
		String cnt_ = request.getParameter("cnt");
		String credte_ = request.getParameter("credte");
		String inmanager_ = request.getParameter("inmanager");
		
		if(price_ != null && !price_.equals("")) price = Integer.parseInt(price_);
		if(cnt_ != null && !cnt_.equals("")) cnt = Integer.parseInt(cnt_);
		if(cnt_ != null && !cnt_.equals("")) cnt = Integer.parseInt(cnt_);
		if(cnt_ != null && !cnt_.equals("")) cnt = Integer.parseInt(cnt_);
		
		if(pno_ != null && !pno_.equals("")) {
			pno = Integer.parseInt(pno_);
			A03_ShopDao dao = new A03_ShopDao();
			request.setAttribute("prod", dao.getProd(pno));
		}
		System.out.println(pno_);
		request.getRequestDispatcher("a00_exp/a13_0303/prodDetail.jsp").forward(request, response);
	}

}
