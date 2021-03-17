package com.project.domain;

import java.util.List;

public class ReplyPageVO {

	//list
	private List<ReplyVO> list;
	
	//count
	private int replycnt;
	
	
	public ReplyPageVO(List<ReplyVO> list, int replycnt) {
		this.list = list;
		this.replycnt = replycnt;
	}

	public List<ReplyVO> getList() {
		return list;
	}

	public void setList(List<ReplyVO> list) {
		this.list = list;
	}

	public int getReplycnt() {
		return replycnt;
	}

	public void setReplycnt(int replycnt) {
		this.replycnt = replycnt;
	}

	@Override
	public String toString() {
		return "ReplyPageVO [list=" + list + ", replycnt=" + replycnt + "]";
	}
	
}
