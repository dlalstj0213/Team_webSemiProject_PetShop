package main.board.control;

import java.io.IOException;
import java.util.ArrayList;

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
import web.domain.Comment;
import web.domain.Member;


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
				case "content": getBoard(request, response, "content", 1); break;
				case "update": getBoard(request, response, "update", 0); break;
				case "updateOk": updateOk(request, response); break;
				case "del": del(request, response); break;
				case "comment" : writeComment(request, response); break;
				case "deleteComment" : deleteComment(request, response); break;
				default: list(request, response); break;
				}
			}else {
				list(request, response); 
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

	private void list(HttpServletRequest request , HttpServletResponse response ) throws ServletException, IOException {
		String cpStr= request.getParameter("cp");
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

	private void write(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String view = "write.jsp";	
		response.sendRedirect(view);
	}

	private void writeOk(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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

	private void getBoard(HttpServletRequest request, HttpServletResponse response, String view, int count)
			throws ServletException, IOException {
		long seq = getSeq(request);
		BoardService service = BoardService.getInstance();
		if(seq != -1L) {
			if(count == 0) {
				Board board = service.getBoardS(seq);
				request.setAttribute("board", board);
			} else if(count == 1) {
				if(service.updateReadNumService(seq, count)) {
					ArrayList<Comment> commentList = service.getCommentListService(seq);
					Board board = service.getBoardS(seq);
					request.setAttribute("board", board);
					if(commentList != null) {
						request.setAttribute("comment", commentList);
					}
				}
			}

			RequestDispatcher rd = request.getRequestDispatcher(view+".jsp");
			rd.forward(request, response);
		}else {
			response.sendRedirect("board.do");
		}
	}

	private void updateOk(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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

	private void del(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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

	private void writeComment(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		Member user = (Member)session.getAttribute("loginUser");
		ArrayList<Comment> commentList = null;
		String idxStr = request.getParameter("idx").trim();
		if(user != null && idxStr != null) {
			long idx = Long.parseLong(idxStr);
			String content = request.getParameter("content");
			BoardService service = BoardService.getInstance();
			commentList = service.insertCommentAndgetCommentListService(user, idx, content);
		}
		request.setAttribute("comment", commentList);
		String view = "board.do?m=content&seq="+idxStr;
		RequestDispatcher rd = request.getRequestDispatcher(view);
		rd.forward(request, response);
	}
	
	private void deleteComment(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String idxStr = request.getParameter("idx").trim();
		long idx = Long.parseLong(idxStr);
		
		BoardService service = BoardService.getInstance();
		service.deleteCommentService(idx);
		String view = "board.do?m=content&seq="+request.getParameter("seq").trim();
		RequestDispatcher rd = request.getRequestDispatcher(view);
		rd.forward(request, response);
	}
}