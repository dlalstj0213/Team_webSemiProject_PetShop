package main.product.control;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import main.product.model.ProductService;
import main.vo.ListResult;
import web.domain.Product;

@WebServlet("/product/product.do")
public class ProductController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String m = request.getParameter("m");
		if(m != null) {
			m = m.trim();
			if(m.equals("detail")) {
				detail(request, response);
			}else if(m.equals("page")) {
				page(request, response);
			}
		}else {
			page(request, response);
		}
	}

	public void page(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		HttpSession session = request.getSession(true);

		int cp = 1;
		int ps = 5;
		String cpStr = request.getParameter("cp");
		String psStr = request.getParameter("ps");
		
		if(cpStr == null) {
			Object cpObj = session.getAttribute("cp");
			if(cpObj != null) {
				cp = (Integer)cpObj;
			}
		}else {
			cpStr = cpStr.trim();
			cp = Integer.parseInt(cpStr);
		}
		
		if(psStr == null) {
			Object psObj = session.getAttribute("ps");
			if(psObj != null) {
				ps = (Integer)psObj;
			}
		}else {
			psStr = psStr.trim();
			int psParam = Integer.parseInt(psStr);
			
			Object psObj = session.getAttribute("ps");
			if(psObj != null) {
				int psSession = (Integer)psObj; 
				if(psSession != psParam) { //페이지 사이즈와 넘어온 파라미터가 다르면 페이지 초기화
					cp = 1;
					session.setAttribute("cp", cp);
				}
			}else {
				if(ps != psParam) {
					cp = 1;
					session.setAttribute("cp", cp);
				}
			}
			ps = psParam;
		}
		session.setAttribute("cp", cp);
		session.setAttribute("ps", ps);
		ProductService service = ProductService.getInstance();
		ListResult listResult = service.pageS(cp, ps);
		request.setAttribute("listResult", listResult);
		
		String view = "product.jsp";
		RequestDispatcher rd = request.getRequestDispatcher(view);
		rd.forward(request, response);
	}
	
	public void detail(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		if(session.getAttribute("loginUser")==null) {
			String view = "../login/login.do";
			response.sendRedirect(view);
			return;
		}
		ProductService service = ProductService.getInstance();
		String codeStr = request.getParameter("product_code");
		if(codeStr != null) {
			codeStr = codeStr.trim();
			int product_code = Integer.parseInt(codeStr);
			Product pro = service.detailS(product_code);
			request.setAttribute("pro", pro);
		}
		String view = "product_detail.jsp";
		RequestDispatcher rd = request.getRequestDispatcher(view);
		rd.forward(request, response);
	}
}