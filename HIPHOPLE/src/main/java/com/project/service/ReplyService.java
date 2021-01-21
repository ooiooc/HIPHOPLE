package com.project.service;

import com.project.domain.Criteria;
import com.project.domain.ReplyPageVO;
import com.project.domain.ReplyVO;

public interface ReplyService {
	
	//댓글리스트
	public ReplyPageVO list(int bno, Criteria cri) throws Exception;

	//댓글쓰기
	public void insert(ReplyVO vo) throws Exception;
	
	//댓글수정
	public void update(ReplyVO vo) throws Exception;
	
	//댓글삭제
	public void delete(int rno) throws Exception;

}
