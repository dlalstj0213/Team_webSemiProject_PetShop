package main.cart.control;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import main.cart.model.CartService;
import main.vo.ListResult;
import web.domain.Member;

@WebServlet("/cart/cart.do")
public class CartController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	String m = "";   

	public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		if(session.getAttribute("loginUser")==null) {
			String view = "../login/login.do";
			response.sendRedirect(view);
			return;
		}
		m  = request.getParameter("m");
		if(m != null) {
			m = m.trim();
			switch(m) {
			case "myCart" : responseMyCartList(request, response); break;
			case "delete" : responseDeleteMyCart(request, response, "one"); break;
			case "deleteAll" : responseDeleteMyCart(request, response, "all"); break;
			case "insert" : responseInsertMyCart(request, response); break;
			default : responseMyCartList(request, response); break;
			}
		} else {
			responseMyCartList(request, response);
		}
	}

	private void responseMyCartList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String cpStr = request.getParameter("cp");
		
		int currentPage = 1;
		if(cpStr == null) {
			Object cpObj = session.getAttribute("cp");
			if(cpObj != null) {
				currentPage = (Integer)cpObj;
			}
		}else {
			cpStr = cpStr.trim();
			currentPage = Integer.parseInt(cpStr);
		}
		session.setAttribute("cp", currentPage);

		//(2) ps 
		int pageSize = 3;
		
		Member user = (Member)session.getAttribute("loginUser");
		CartService service = CartService.getInstance();
		ListResult result = service.getListResult(currentPage, pageSize, user.getEmail());
		session.setAttribute("cart", result);

		if(result.getList() != null && result.getList().size() == 0 && currentPage>1) {
			response.sendRedirect("cart.do?m=myCart&cp="+(currentPage-1));
		}else {
			String view = "my_cart_list.jsp";
			RequestDispatcher rd = request.getRequestDispatcher(view);
			rd.forward(request, response);
		}
	}

	private void responseDeleteMyCart(HttpServletRequest request, HttpServletResponse response, String type) throws ServletException, IOException {
		HttpSession session = request.getSession();
		CartService service = CartService.getInstance();
		boolean result = false;
		Member user = (Member)session.getAttribute("loginUser");
		String codeStr = request.getParameter("code");
		if(codeStr != null && user.getEmail() != null) {
			int code = Integer.parseInt(codeStr.trim());
			result = service.deleteCart(user.getEmail(), code, type);
		} else if(codeStr == null) {
			result = service.deleteCart(user.getEmail(), -1, type);
		}
		request.setAttribute("result", result);
		String view = "cart.do?m=myCart";
		RequestDispatcher rd = request.getRequestDispatcher(view);
		rd.forward(request, response);
	}

	private void responseInsertMyCart(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		Member user = (Member)session.getAttribute("loginUser");
		String codeStr = request.getParameter("code").trim();
		String quantityStr = request.getParameter("quantity").trim();
		
		CartService service = CartService.getInstance();
		boolean result = false;
		if(codeStr != null && user.getEmail() != null && quantityStr != null) {
			int productCode = Integer.parseInt(codeStr);
			int quantity = Integer.parseInt(quantityStr);
			result = service.insertCart(user.getEmail(), productCode, quantity);
		}
		String view = "../product/product.do?m=page";
		response.sendRedirect(view);
	}
}
