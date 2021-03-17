package com.project.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.project.domain.Criteria;
import com.project.domain.ReplyPageVO;
import com.project.domain.ReplyVO;

public interface ReplyMapper {

	//댓글리스트
	//@param을 통해 두 개의  parameter 값 받아오기 
	public List<ReplyVO> list(@Param("bno") int bno, @Param("cri") Criteria cri) throws Exception;

	//현재 게시물 전체 댓글 수
	public int getCountByBno(int bno);
	
	//댓글 작성
	public void insert(ReplyVO vo) throws Exception;
	
	//댓글 수정
	public void update(ReplyVO vo) throws Exception;

	//댓글 삭제
	public void delete(int rno) throws Exception;

	
}
