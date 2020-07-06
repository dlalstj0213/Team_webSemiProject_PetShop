package main.board.control;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import main.board.model.BoardService;
import main.vo.ListResult;
import web.domain.Board;


@WebServlet("/board/board.do")
public class BoardController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	private String m = "list";
	public void service(HttpServletRequest request, HttpServletResponse response) {
		m = request.getParameter("m");
		try {
			if(m != null) {
				m = m.trim();
				switch (m) {
					case "write": write(request, response); break;
					case "writeOk": writeOk(request, response); break;
					case "content": getBoard(request, response, "content"); break;
					case "update": getBoard(request, response, "update"); break;
					case "updateOk": updateOk(request, response); break;
					case "del": del(request, response); break;		
					default: list(request, response); break;
				}
			}else {
				list(request, response); 
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	
	public void list(HttpServletRequest request , HttpServletResponse response ) throws ServletException, IOException {
	String cpStr= request.getParameter("cp");
	String psStr= request.getParameter("ps");
	HttpSession session =request.getSession();
	 
	//cp 
	int cp=1;
	if(cpStr == null) {
		Object cpObj= session.getAttribute("cp");
		if(cpObj!=null) {
			cp=(Integer)cpObj;
		}
	}else {
		cpStr= cpStr.trim();
		cp=Integer.parseInt(cpStr);
	}
	session.setAttribute("cp", cp);
	int ps=10;
	if(psStr ==null) {
		Object psObj=session.getAttribute("ps");
		if(psObj!=null) {
			ps=(Integer)psObj;
		}
	}else {
		psStr=psStr.trim();
		int paParam= Integer.parseInt(psStr);
		Object psObj=session.getAttribute("ps");
		if(psObj != null) {
			int psSession = (Integer)psObj;
			if(psSession != paParam) {
				cp=1;
				session.setAttribute("cp", cp);
			}
		}else {
			if(ps != paParam) {
				cp=1;
				session.setAttribute("cp",cp);
			}
		}
		ps=paParam;
	}
	session.setAttribute("ps",ps);
	
	BoardService service = BoardService.getInstance();
	ListResult listResult = service.getListResult(cp, ps);
	request.setAttribute("listResult", listResult);
	if(listResult.getList() != null && listResult.getList().size() == 0 && cp>1) {
		response.sendRedirect("board.do?m=list&cp="+(cp-1));
	}else {
		String view = "list.jsp";
		RequestDispatcher rd = request.getRequestDispatcher(view);
		rd.forward(request, response);
	}
}
	
	public void write(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String view = "write.jsp";	
		response.sendRedirect(view);
	}
	public void writeOk(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String writer = request.getParameter("writer");
		String email = request.getParameter("email");
		String subject = request.getParameter("subject");
		String content = request.getParameter("content");
		BoardService service = BoardService.getInstance();
		boolean flag = service.insertS(new Board(-1, writer, email, subject, content, null, 0, null, null, 0));
		request.setAttribute("result", flag);
		request.setAttribute("kind", "writeOk");
		String view = "msg.jsp";	
		RequestDispatcher rd = request.getRequestDispatcher(view);
		rd.forward(request, response);
	}
	public void getBoard(HttpServletRequest request, HttpServletResponse response, String view)
			throws ServletException, IOException {
		long seq = getSeq(request);
		if(seq != -1L) {
			BoardService service = BoardService.getInstance();
			Board board = service.getBoardS(seq);
			request.setAttribute("board", board);
			
			RequestDispatcher rd = request.getRequestDispatcher(view+".jsp");
			rd.forward(request, response);
		}else {
			response.sendRedirect("board.do");
		}
	}
	public void updateOk(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		long seq = getSeq(request);
		String writer = request.getParameter("writer");
		String email = request.getParameter("email");
		String subject = request.getParameter("subject");
		String content = request.getParameter("content");
		
		
		BoardService service = BoardService.getInstance();
		boolean flag = service.updateS(new Board(seq, writer, email, subject, content, null, 0, null, null, 0));
		request.setAttribute("result", flag);
		request.setAttribute("kind", "updateOk");
		
		String view = "msg.jsp";
		RequestDispatcher rd = request.getRequestDispatcher(view);
		rd.forward(request, response);
	}
	public void del(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		long seq = getSeq(request);
		if(seq != -1L) {
			BoardService service = BoardService.getInstance();
			service.delS(seq);
		}
		response.sendRedirect("board.do");
	}
	
	private long getSeq(HttpServletRequest request) {
		long seq = -1L;
		String seqStr = request.getParameter("seq");
		if(seqStr != null) {
			seqStr = seqStr.trim();
			try {
				seq = Long.parseLong(seqStr);
			}catch(NumberFormatException ne) {
				ne.printStackTrace();
			}
		}
		
		return seq;
	}
}