package com.project.domain;

public class Criteria {
	
	//Criteria : pageNum, amount 값을 전달하는 용도

	//페이지 번호
	private int pageNum;
		
	//페이지 당 데이터 수
	private int amount;
		
	//검색 종류(제목, 내용, 작성자, 제목+내용)
	private String type;
		
	//keyword
	private String keyword;
	
	//category
	private String category;
		
	//기본생성자 (1, 10에 대한 아래에 있는 매개변수 두개 호출)
	public Criteria() {
		this(1, 10); //1 페이지, 10개 게시글
	}
	
	//pageNum, amount 2개 매개변수 필요	
	public Criteria(int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
		
	}

	public int getPageNum() {
		return pageNum;
	}

	public void setPageNum(int pageNum) {
		if(pageNum <= 0) {
			this.pageNum = 1;
			return;
		}
		this.pageNum = pageNum;
	}

	public int getAmount() {
		return amount;
	}
	
	public int getPageStart() {
		return (this.pageNum-1)*amount;
	}
	
	public void setAmount(int amount) {
		this.amount = amount;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	@Override
	public String toString() {
		return "Criteria [pageNum=" + pageNum + ", amount=" + amount + ", type=" + type + ", keyword=" + keyword + "]";
	}

}
