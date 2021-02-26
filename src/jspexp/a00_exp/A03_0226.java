package jspexp.a00_exp;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class A03_0226
 */
@WebServlet(name = "mvc.do", urlPatterns = { "/mvc.do" })
public class A03_0226 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public A03_0226() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String id = request.getParameter("id");
		String pass = request.getParameter("pass");
		
		if(id != null && pass !=null ) {
			if(id.equals("himan") && pass.equals("7777")) {
				request.setAttribute("isUser", id+"님 환영합니다.");
			} else {
				request.setAttribute("isUser", id+"님 인증된 계정이 아닙니다.");
			}
			request.getRequestDispatcher("a00_exp/a11_0226/a02_view.jsp").forward(request, response);
		}
	}

}
