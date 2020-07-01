package web.domain;

import java.sql.Date;

public class Board {
	private int idx;
	private String writer;
	private String email;
	private String title;
	private String content;
	private Date wrtieDate;
	private int readNum;
	private String fileName;
	private String ofileName;
	private long fileSize;
	
	public Board() {}
	
	public Board(int idx, String writer, String email, String title, String content, Date wrtieDate, int readNum,
			String fileName, String ofileName, long fileSize) {
		this.idx = idx;
		this.writer = writer;
		this.email = email;
		this.title = title;
		this.content = content;
		this.wrtieDate = wrtieDate;
		this.readNum = readNum;
		this.fileName = fileName;
		this.ofileName = ofileName;
		this.fileSize = fileSize;
	}

	public int getIdx() {
		return idx;
	}

	public void setIdx(int idx) {
		this.idx = idx;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getWrtieDate() {
		return wrtieDate;
	}

	public void setWrtieDate(Date wrtieDate) {
		this.wrtieDate = wrtieDate;
	}

	public int getReadNum() {
		return readNum;
	}

	public void setReadNum(int readNum) {
		this.readNum = readNum;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public String getOfileName() {
		return ofileName;
	}

	public void setOfileName(String ofileName) {
		this.ofileName = ofileName;
	}

	public long getFileSize() {
		return fileSize;
	}

	public void setFileSize(long fileSize) {
		this.fileSize = fileSize;
	}
}
