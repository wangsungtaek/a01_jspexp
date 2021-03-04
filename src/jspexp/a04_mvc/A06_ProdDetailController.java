package jspexp.a04_mvc;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jspexp.a03_database.A03_ShopDao;
import jspexp.z01_vo.Product3;

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
    private int paramInt(String s) {
    	int ret = 0;
    	try {
    		ret = Integer.parseInt(s);
    	} catch(Exception e) {
    		System.out.println(e.getMessage());
    	}
    	return ret;
    }
    private String paramStr(String s) {
    	String ret = "";
    	if(s != null) ret=s;
    	return ret;
    }
    
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
				
		String pno_ = request.getParameter("pno");
		String name_ = request.getParameter("name");
		String price_ = request.getParameter("price");
		String cnt_ = request.getParameter("cnt");
		String credte_ = request.getParameter("credte");
		String inmanager_ = request.getParameter("inmanager");
		String proc = request.getParameter("proc");
		
		int pno = paramInt(pno_);
		String name = paramStr(name_);
		int price = paramInt(price_);
		int cnt = paramInt(cnt_);
		String credte = paramStr(credte_);
		String inmanager = paramStr(inmanager_);
		
		A03_ShopDao dao = new A03_ShopDao();
		if(proc!=null) {
			if(proc.equals("upt")) {
				Product3 prod = new Product3();
				prod.setPno(pno);
				prod.setName(name);
				prod.setPrice(price);
				prod.setCnt(cnt);
				prod.setCredteS(credte);
				prod.setInmanager(inmanager);
				
				dao.updateProd(prod);
			}
			if(proc.equals("del")) {
				dao.delete(pno);
			}
		}
		
		
		if(pno_ != null && !pno_.equals("")) {
			request.setAttribute("prod", dao.getProd(pno));
		}
		System.out.println(pno_);
		request.getRequestDispatcher("a00_exp/a13_0303/prodDetail.jsp").forward(request, response);
	}

}
