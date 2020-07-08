package web.domain;

import java.sql.Date;

public class Comment {
	private int commentIdx;
	private long boardIdx;
	private String writer;
	private String email;
	private Date writeDate;
	private String content;
	
	public Comment() {}

	public Comment(int commentIdx, long boardIdx, String writer, String email, Date writeDate, String content) {
		this.commentIdx = commentIdx;
		this.boardIdx = boardIdx;
		this.writer = writer;
		this.email = email;
		this.writeDate = writeDate;
		this.content = content;
	}



	public int getCommentIdx() {
		return commentIdx;
	}

	public void setCommentIdx(int commentIdx) {
		this.commentIdx = commentIdx;
	}

	public long getBoardIdx() {
		return boardIdx;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public Date getWriteDate() {
		return writeDate;
	}

	public void setWriteDate(Date writeDate) {
		this.writeDate = writeDate;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public void setBoardIdx(long boardIdx) {
		this.boardIdx = boardIdx;
	}
	
}
