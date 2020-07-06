package main.board.model;

import java.util.ArrayList;

import main.vo.ListResult;
import main.vo.Pagination;
import web.domain.Board;

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

}
