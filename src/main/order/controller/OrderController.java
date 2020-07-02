package main.order.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import main.order.model.OrderService;
import main.vo.Receipt;
import web.domain.OrderDetail;

@WebServlet("/order.do")
public class OrderController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	String m = "";
	
	public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		m = request.getParameter("m");
		if(m != null) {
			m = m.trim();
			switch(m) {
			case "check" : checkProduct(request, response); break;
			case "buy" : buyProduct(request, response); break;
			case "buyAll" : buyAllProducts(request, response); break;
			default : response.sendRedirect("cart.do"); break;
			}
		} else {
			response.sendRedirect("cart.do");
		}
	}
	
	private void checkProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email = request.getParameter("email");
		String codeStr = request.getParameter("code");
		int productCode = Integer.parseInt(codeStr);
		String address = request.getParameter("address");
		String phone = request.getParameter("phone");
		String quantityStr = request.getParameter("quantity");
		int quantity = Integer.parseInt(quantityStr);
		String totalPriceStr = request.getParameter("totalPrice");
		long totalPrice = Long.parseLong(totalPriceStr);
		String memo = request.getParameter("memo");	
		
		OrderService service = OrderService.getInstance();
		OrderDetail result = service.getTotalPrice(new OrderDetail(-1, email, 1, productCode, null, address, phone, null, quantity, totalPrice, 0, memo, null));
		request.setAttribute("result", result);
		String view = "checkOrder.jsp";
		RequestDispatcher rs = request.getRequestDispatcher(view);
		rs.forward(request, response);
	}
	
	private void buyProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email = request.getParameter("email");
		String codeStr = request.getParameter("productCode");
		int productCode = Integer.parseInt(codeStr);
		String address = request.getParameter("address");
		String phone = request.getParameter("phone");
		String quantityStr = request.getParameter("quantity");
		int quantity = Integer.parseInt(quantityStr);
		String totalPriceStr = request.getParameter("totalPrice");
		long totalPrice = Long.parseLong(totalPriceStr);
		String memo = request.getParameter("memo");
		
		OrderService service = OrderService.getInstance();
		Receipt result = service.buyProductService(new OrderDetail(-1, email, 1, productCode, null, address, phone, null, quantity, totalPrice, 0, memo, null));
		request.setAttribute("result", result);
		String view = "resultOrder.jsp";
		RequestDispatcher rs = request.getRequestDispatcher(view);
		rs.forward(request, response);
	}
	
	private void buyAllProducts(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String userEmail = (String)session.getAttribute("loginUser");
		OrderService service = OrderService.getInstance();
		Receipt result = service.buyAllProductsService(userEmail);
		request.setAttribute("result", result);
		String view = "resultOrder.jsp";
		RequestDispatcher rs = request.getRequestDispatcher(view);
		rs.forward(request, response);
	}
}