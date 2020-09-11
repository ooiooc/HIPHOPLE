package com.project.domain;

public class PageDTO {

	//첫번째 페이지
	private int startPage;
	
	//마지막 페이지
	private int endPage;	
	
	//이전 페이지 여부
	private boolean prev;
	
	//다음 페이지 여부
	private boolean next;
	
	//게시물 총 갯수
	private int total;
	private Criteria cri;
	
	//startPage, endPage 계산
	public PageDTO(Criteria cri, int total) {
		this.cri = cri;
		this.total = total;
	
		//endPage 끝 페이지 계산
		//Math.ceil 올림함수 둘중 하나의 값이 실수여야 값이 소수점 값으로 나오기 때문에 10.0
		this.endPage=(int)(Math.ceil(cri.getPageNum()/10.0))*10;
				
		//startPage
		this.startPage = this.endPage-9;
				
		int realEnd = (int)(Math.ceil((total*1.0)/cri.getAmount()));
			
		if(realEnd < endPage) {
			this.endPage=realEnd;
	
		}
		
		this.prev = this.startPage>1; //false값을 prev에 저장
		this.next = this.endPage<realEnd;
	
	}
	public int getStartPage() {
		return startPage;
	}
	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}
	public int getEndPage() {
		return endPage;
	}
	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}
	public boolean isPrev() {
		return prev;
	}
	public void setPrev(boolean prev) {
		this.prev = prev;
	}
	public boolean isNext() {
		return next;
	}
	public void setNext(boolean next) {
		this.next = next;
	}
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}
	public Criteria getCri() {
		return cri;
	}
	public void setCri(Criteria cri) {
		this.cri = cri;
	}
	
}//END
