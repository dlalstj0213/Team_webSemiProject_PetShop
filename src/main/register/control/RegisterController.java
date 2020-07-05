package main.register.control;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import main.register.model.RegisterService;
import web.domain.Member;

@WebServlet("/register/register.do")
public class RegisterController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	private String m = "";
	public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		m = request.getParameter("m");
		if(m != null) {
			m = m.trim();
			switch(m) {
				case "form": form(request, response); break;
				case "check": check(request, response); break;
				default: response.sendRedirect("membership.jsp");
			}
		}else {
			response.sendRedirect("membership.jsp");
		}
	}
	private void form(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String view = "membership.jsp";
		response.sendRedirect(view);
	}
	private void check(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    String email = request.getParameter("email").trim();
	    String name=  request.getParameter("name").trim();    
	    String pwd = request.getParameter("pwd").trim();
	    String postStr  = request.getParameter("post").trim();
	    int post = 0;
	    if(postStr != null) post = Integer.parseInt(postStr); 
	    String address = request.getParameter("address").trim();
	    String phone = request.getParameter("phone").trim();

	    
	    RegisterService service = RegisterService.getInstance();
	    int rCode = service.checkMember(new Member(email,name,pwd,post,address,phone,0));
	    request.setAttribute("rCode", rCode);
	    

	    String view = "membership_msg.jsp";
	    RequestDispatcher rd = request.getRequestDispatcher(view);
	    rd.forward(request, response);
	}
}









