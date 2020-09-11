package com.project.domain;

import java.util.List;

public class ArticleVO {

	private int bno;
	private String title;
	private String content;
	private String writer;
	private String url;
	private String regdate;
	private int viewcnt;
	//private List<BoardAttachVO> attachList;
	
	
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
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
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
	@Override
	public String toString() {
		return "ArticleVO [bno=" + bno + ", title=" + title + ", content=" + content + ", writer=" + writer + ", url="
				+ url + ", regdate=" + regdate + ", viewcnt=" + viewcnt + "]";
	}
	
}
