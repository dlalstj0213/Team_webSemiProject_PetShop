package main.order.control;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import main.cart.model.CartService;
import main.order.model.OrderService;
import main.vo.ListResult;
import main.vo.ResultSet;
import web.domain.Cart;
import web.domain.Member;
import web.domain.OrderDetail;

@WebServlet("/order/order.do")
public class OrderController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	String m = "";

	public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		m = request.getParameter("m");
		if(m != null) {
			m = m.trim();
			switch(m) {
			case "check" : checkOut(request, response, "cart"); break;
			case "checkAll" : checkOut(request, response, "all"); break;
			case "buy" : buyProduct(request, response); break;
			default : response.sendRedirect("cart.do"); break;
			}
		} else {
			response.sendRedirect("cart.do");
		}
	}

	private void checkOut(HttpServletRequest request, HttpServletResponse response, String checkType) throws ServletException, IOException {
		HttpSession session = request.getSession();
		Member user = (Member)session.getAttribute("loginUser");
		
		if(checkType.equals("cart")) {
			OrderService service = OrderService.getInstance();
			ListResult cart = (ListResult)session.getAttribute("cart");
			String codeStr = request.getParameter("code");
			int cartCode = Integer.parseInt(codeStr);
			ListResult result = service.getProductByCart(cart, cartCode);
			result.setResultType(ResultSet.CHECK_ONE);
			session.setAttribute("order", result);
		}
		if(checkType.equals("all")) {
			CartService service = CartService.getInstance();
			ListResult result = service.getAllCartList(user.getEmail());
			result.setResultType(ResultSet.CHECK_ALL);
			session.setAttribute("order", result);
		}
		String view = "checkout.jsp";
		RequestDispatcher rs = request.getRequestDispatcher(view);
		rs.forward(request, response);
	}

	private void buyProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String address = request.getParameter("address").trim();
		String phone = request.getParameter("phone").trim();
		String memo = request.getParameter("memo").trim();
		ListResult result = new ListResult();
		OrderService service = OrderService.getInstance();
		HttpSession session = request.getSession();
		ListResult requestData = (ListResult)session.getAttribute("order");
		result = service.buyProductService(requestData, address, phone, memo);
		request.setAttribute("result", result);
		String view = "confirmation.jsp"; 
		RequestDispatcher rs = request.getRequestDispatcher(view);
		rs.forward(request, response);
	}

}