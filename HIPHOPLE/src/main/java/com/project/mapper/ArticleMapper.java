package com.project.mapper;

import java.util.List;

import com.project.domain.ArticleVO;
import com.project.domain.Criteria;

public interface ArticleMapper {

	//게시물 등록
	public void insert(ArticleVO vo) throws Exception;
	
	//게시글 조회
	public ArticleVO select(ArticleVO vo) throws Exception;
	
	//게시물 수정
	public void update(ArticleVO vo) throws Exception;
		
	//게시물 삭제
	public void delete(ArticleVO vo) throws Exception;
		
	//게시물 리스트 조회
	public List<ArticleVO> listAll() throws Exception;
		
	//게시글 페이징
	//public List<BoardVO> listPage(Criteria cri) throws Exception;

	//총 게시글 count
	//public int getTotalCount(Criteria cri);
		
	//조회수 update
	//public void updateViewcnt(BoardVO vo) throws Exception;
}
