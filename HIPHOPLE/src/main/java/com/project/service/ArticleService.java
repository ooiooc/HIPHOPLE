package com.project.service;

import java.util.List;


import com.project.domain.ArticleVO;
import com.project.domain.BoardAttachVO;
import com.project.domain.BoardVO;
import com.project.domain.CategoriesVO;
import com.project.domain.Criteria;


public interface ArticleService {
	
	//글쓰기
	public void insert(ArticleVO vo) throws Exception;
				
	//제목 클릭 후 한 건에 대한 select
	public ArticleVO select(ArticleVO vo) throws Exception;
				
	//글 수정
	public void update(ArticleVO vo) throws Exception;
			
	//글 삭제
	public void delete(ArticleVO vo) throws Exception;
		
	//게시글 리스트(여러 건에 대한 select)
	public List<ArticleVO> listAll() throws Exception;
		
	//게시글 리스트 페이징
	public List<ArticleVO> postlistPage(Criteria cri) throws Exception;
		
	//페이징 처리를 위한 카운팅
	public int getTotalCount(Criteria cri) throws Exception;
		
	//카테고리 조회
	public List<CategoriesVO> categoryList() throws Exception;
	
	//BoardAttachVO에 있는 정보를 불러오는 서비스
	//여러개의 이미지 정보를 넘겨주기 위해 List 배열 타입
	public List<BoardAttachVO> getAttachlist(int bno);
	
}
