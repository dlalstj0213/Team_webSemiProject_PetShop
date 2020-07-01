package main.cart.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import main.cart.model.CartService;
import main.vo.Pagination;

@WebServlet("/cart.do")
public class CartController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    String m = "";   
	
	public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		m  = request.getParameter("m");
		if(m != null) {
			m = m.trim();
			switch(m) {
			case "myCart": responseMyCartList(request, response); break;
			case "delete": responseDeleteMyCart(request, response, "one"); break;
			case "deleteAll" : responseDeleteMyCart(request, response, "all"); break;
			case "insert": break;
			}
		}
		responseMyCartList(request, response);
	}
	
	private void responseMyCartList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String userEmail = null;
		if(request.getParameter("userEmail")==null) {
			 userEmail = (String) session.getAttribute("loginUser");
		} else {
			userEmail = request.getParameter("userEmail");
		}
		
		String cpStr = request.getParameter("cp");
		String psStr = request.getParameter("ps");

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
		int pageSize = 10;
		if(psStr == null) {
			Object psObj = session.getAttribute("ps");
			if(psObj != null) {
				pageSize = (Integer)psObj;
			}
		}else {
			psStr = psStr.trim();
			int psParam = Integer.parseInt(psStr);

			Object psObj = session.getAttribute("ps");
			if(psObj != null) {
				int psSession = (Integer)psObj;
				if(psSession != psParam) {
					currentPage = 1;
					session.setAttribute("cp", currentPage);
				}
			}else {
				if(pageSize != psParam) {
					currentPage = 1;
					session.setAttribute("cp", currentPage);
				}
			}
			pageSize = psParam;
		}
		session.setAttribute("ps", pageSize);
		
		if(userEmail != null) {
			CartService service = CartService.getInstance();
			Pagination result = service.getPagination(currentPage, pageSize, userEmail);
			request.setAttribute("result", result);
			//
			session.setAttribute("loginUser", userEmail);
			//
			if(result.getListResult().size() == 0 && currentPage>1) {
				response.sendRedirect("board.do?m=fboard&cp="+(currentPage-1));
			}else {
				String view = "result.jsp";
				RequestDispatcher rd = request.getRequestDispatcher(view);
				rd.forward(request, response);
			}
		}
	}
	
	private void responseDeleteMyCart(HttpServletRequest request, HttpServletResponse response, String type) throws ServletException, IOException {
		HttpSession session = request.getSession();
		CartService service = CartService.getInstance();
		boolean result = false;
		String userEmail = (String)session.getAttribute("loginUser");
		String codeStr = request.getParameter("code");
		if(codeStr != null && userEmail != null) {
			int code = Integer.parseInt(codeStr.trim());
			userEmail = userEmail.trim();
			result = service.deleteCart(userEmail, code, type);
		} else if(codeStr == null) {
			userEmail = userEmail.trim();
			result = service.deleteCart(userEmail, -1, type);
		}
		request.setAttribute("result", result);
		String view = "cart.do?m=myCart";
		RequestDispatcher rd = request.getRequestDispatcher(view);
		rd.forward(request, response);
	}
}
