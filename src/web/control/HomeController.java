package web.control;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import main.product.model.ProductService;
import main.vo.ProductSet;
import web.domain.Member;
import web.domain.Product;

@WebServlet("/home/home.do")
public class HomeController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	String m = "";   

	public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		m = request.getParameter("m");
		if(m != null) {
			m = m.trim();
			if(m.equals("contact")) {
				contact(request, response);
			} else {
				home(request, response);
			}
		}
		home(request, response);
	}

	private void home(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ProductService service = ProductService.getInstance();
		ArrayList<Product> list = service.listS();
		request.setAttribute("list", list);

		HttpSession session = request.getSession();
		//상품셋
		session.setAttribute("product", new ProductSet());

		String view = "home.jsp";
		RequestDispatcher rd = request.getRequestDispatcher(view);
		rd.forward(request, response);
	}
	
	
	private void contact(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String view ="contact.jsp";
		RequestDispatcher rd = request.getRequestDispatcher(view);
		rd.forward(request, response);
	}
}
