package com.project.domain;

import java.util.List;

public class ArticleVO {

	private int bno;
	private String title;
	private String category;
	private String content;
	private String writer;
	private String articleimg;
	private String regdate;
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
	
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
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
	public String getArticleimg() {
		return articleimg;
	}
	public void setArticleimg(String articleimg) {
		this.articleimg = articleimg;
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
	@Override
	public String toString() {
		return "ArticleVO [bno=" + bno + ", title=" + title + ", category=" + category + ", content=" + content
				+ ", writer=" + writer + ", articleimg=" + articleimg + ", regdate=" + regdate + ", viewcnt=" + viewcnt
				+ ", attachList=" + attachList + "]";
	}
	
}
