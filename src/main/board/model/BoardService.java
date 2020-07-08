package main.board.model;

import java.util.ArrayList;

import main.vo.ListResult;
import main.vo.Pagination;
import web.domain.Board;
import web.domain.Comment;
import web.domain.Member;

public class BoardService {

	private BoardDAO dao;
	private static final BoardService instance= new BoardService();
	private BoardService() {
		dao= new BoardDAO();
	}
	public static BoardService getInstance() {
		return instance;
	}
	public ListResult getListResult(int currentPage, int pageSize ) {
		ArrayList<Board> list = dao.listResult(currentPage, pageSize);
		long listCount = dao.getTotalCount();
		ListResult r = new ListResult(list, new Pagination(listCount, currentPage, pageSize));
		return r;
	}
	public boolean insertS(Board board) {
		return dao.insert(board);
	}
	public Board getBoardS(long seq) {
		return dao.getBoard(seq);
	}
	public boolean updateS(Board board) {
		return dao.update(board);
	}
	public void delS(long seq) {
		dao.del(seq);
	}
	
	public boolean updateReadNumService(long idx, int count) {
		Board board = dao.getBoard(idx);
		board.setReadNum(board.getReadNum()+count);
		return dao.updateReadNum(board);
	}
	
	public ArrayList<Comment> getCommentListService(long boardIdx){
		return dao.getCommentList(boardIdx);
	}
	
	public ArrayList<Comment> insertCommentAndgetCommentListService(Member user, long idx, String content){
		if(dao.insertComment(user, idx, content)) {
			return dao.getCommentList(idx);
		} else {
			return null;
		}
	}
	
	public void deleteCommentService(long commentIdx) {
		dao.deleteComment(commentIdx);
	}
}
