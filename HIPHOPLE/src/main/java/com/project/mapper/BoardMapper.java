package com.project.mapper;

import java.util.List;
import com.project.domain.Criteria;
import com.project.domain.BoardVO;

public interface BoardMapper {
	
					/* notice */
	//게시물 등록
	public void insert(BoardVO vo) throws Exception;
	
	//게시글 조회
	public BoardVO select(BoardVO vo) throws Exception;
	
	//게시물 수정
	public void update(BoardVO vo) throws Exception;
		
	//게시물 삭제
	public void delete(BoardVO vo) throws Exception;
		
	//게시물 리스트 조회
	public List<BoardVO> listAll() throws Exception;
		
	//게시글 페이징
	public List<BoardVO> listPage(Criteria cri) throws Exception;

	//총 게시글 count
	public int getTotalCount(Criteria cri);
		
	//조회수 update
	public void updateViewcnt(BoardVO vo) throws Exception;
	
					/* community */
	//Community 게시판 글쓰기
	public void insertComm(BoardVO vo) throws Exception;
	
	//Community 게시물 조회
	public BoardVO selectComm(BoardVO vo) throws Exception;
	
	//community 내 글 조회
	public String allmyPost(String writerid) throws Exception;
	
	//Community 수정
	public void updateCom(BoardVO vo) throws Exception;

	//Community 삭제
	public void deleteCom(BoardVO vo) throws Exception;

	//Community 게시물 리스트(페이징x)
	public List<BoardVO> commlistAll() throws Exception;
	
	//Community 게시물 리스트(페이징o)
	public List<BoardVO> commlistPage(Criteria cri) throws Exception;
	
	//community 게시물 총 갯수
	public int comTotalcount(Criteria cri) throws Exception;
	
	//Community 조회수 업데이트
	public void comViewcnt(BoardVO vo) throws Exception;
	
	//Community 베스트 게시물 list limit 5
	public List<BoardVO> bestList() throws Exception; 
	
	//공지사항 최신 게시물 list limit 5
	public List<BoardVO> latestList() throws Exception;
	
}
