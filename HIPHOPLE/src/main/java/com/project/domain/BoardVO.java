package com.project.domain;

import java.util.List;

import com.project.domain.BoardAttachVO;

public class BoardVO {

	private int bno;
	private int likecnt;	
	private String category;
	private String title;
	private String content;
	private String writer;
	private String regdate;
	private String writerid;	
	private int viewcnt;
	private List<BoardAttachVO> attachList;
	
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
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
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	public int getViewcnt() {
		return viewcnt;
	}
	public void setViewcnt(int viewcnt) {
		this.viewcnt = viewcnt;
	}
	
	public List<BoardAttachVO> getAttachList() {
		return attachList;
	}
	public void setAttachList(List<BoardAttachVO> attachList) {
		this.attachList = attachList;
	}
	
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	
	public String getWriterid() {
		return writerid;
	}
	public void setWriterid(String writerid) {
		this.writerid = writerid;
	}
	
	public int getLike() {
		return likecnt;
	}
	
	public void setLikecnt(int likecnt) {
		this.likecnt = likecnt;
	}
	
	@Override
	public String toString() {
		return "BoardVO [bno=" + bno + ", likecnt=" + likecnt + ", category=" + category + ", title=" + title
				+ ", content=" + content + ", writer=" + writer + ", regdate=" + regdate + ", writerid=" + writerid
				+ ", viewcnt=" + viewcnt + ", attachList=" + attachList + "]";
	}
	
}
