
package com.project.service;

import java.util.List;

import com.project.domain.Criteria;
import com.project.domain.BoardAttachVO;
import com.project.domain.BoardVO;

public interface BoardService {
	
	//글쓰기
	public void insert(BoardVO vo) throws Exception;
			
	//제목 클릭 후 한 건에 대한 select
	public BoardVO select(BoardVO vo) throws Exception;
			
	//글 수정
	public void update(BoardVO vo) throws Exception;
		
	//글 삭제
	public void delete(BoardVO vo) throws Exception;
	
	//게시글 리스트(여러 건에 대한 select)
	public List<BoardVO> listAll() throws Exception;
	
	//게시글 리스트 페이징
	public List<BoardVO> listPage(Criteria cri) throws Exception;
	
	//페이징 처리를 위한 카운팅
	public int getTotalCount(Criteria cri) throws Exception;
	
	//BoardAttachVO에 있는 정보를 불러오는 서비스
	//여러개의 이미지 정보를 넘겨주기 위해 List 배열 타입
	public List<BoardAttachVO> getAttachlist(int bno);
	
					/*커뮤니티*/
	//커뮤니티 내 글 조회
	public String allmyPost(String writerid) throws Exception;
	
	//커뮤니티 글쓰기
	public void insertComm(BoardVO vo) throws Exception;
	
	//커뮤니티 상세페이지
	public BoardVO selectComm(BoardVO vo) throws Exception;
	
	//커뮤니티 수정
	public void updateCom(BoardVO vo) throws Exception;
	
	//커뮤니티 삭제
	public void deleteCom(BoardVO vo) throws Exception;

	//커뮤니티 리스트(여러 건에 대한 select)
	public List<BoardVO> commlistAll() throws Exception;
	
	//커뮤니티 리스트 페이징
	public List<BoardVO> commlistPage(Criteria cri) throws Exception;
	
	//커뮤니티 게시물 총 갯수
	public int comTotalcount(Criteria cri) throws Exception;
	
	//커뮤니티 베스트 게시물 list limit 5
	public List<BoardVO> bestList() throws Exception; 
	
	//공지사항 최신 게시물 5개 list limit 5
	public List<BoardVO> latestList() throws Exception;
	
}
