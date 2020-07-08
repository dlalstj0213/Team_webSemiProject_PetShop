package main.board.model;

class BoardSQL {
	
	static final String LIST="select * from BOARD order by BOARD_NO desc";
	static final String INSERT="insert into BOARD values(BOARD_SEQ.nextval, ?, ?, ?, ?, SYSDATE, 0, ?, ?, ?)";//insert
	static final String CONTENT="select * from BOARD where IDX=?";
	static final String UPDATE="update BOARD set EMAIL=?, TITLE=?, CONTENT=? where IDX=?";
	static final String DEL="delete from BOARD where IDX=?";
	static final String UPDATE_READNUM = "update BOARD set READNUM=? where IDX=?";
	final static String LIST_PAGE 
	= "select * from (select ROWNUM rnum, aa.* from (select * from BOARD order by IDX desc) aa) where rnum>? and rnum<=?";
	final static String COUNT = "select COUNT(IDX) from BOARD";
	final static String SELECT_COMMENT = "select * from BOARD_COMMENT where BOARD_IDX=? order by COMMENT_IDX desc";
	final static String INSERT_COMMENT = "insert into BOARD_COMMENT values(COMMENT_SEQ.nextval, ?, ?, ?, SYSDATE, ?)";
	final static String DELETE_COMMENT = "delete from BOARD_COMMENT where COMMENT_IDX=?";
}
