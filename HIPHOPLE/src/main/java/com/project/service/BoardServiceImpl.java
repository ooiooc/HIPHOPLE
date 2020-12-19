package com.project.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.project.domain.BoardAttachVO;
import com.project.domain.BoardVO;
import com.project.domain.Criteria;
import com.project.mapper.BoardAttachMapper;
//import com.project.mapper.BoardAttachMapper;
import com.project.mapper.BoardMapper;

@Service
public class BoardServiceImpl implements BoardService {

	@Autowired
	private BoardMapper mapper;
	
	@Autowired
	private BoardAttachMapper attachmapper;
	
	//공지사항 글쓰기
	@Transactional
	@Override
	public void insert(BoardVO vo) throws Exception {
		
		//board 테이블에 insert
		mapper.insert(vo);
		
		//upload 테이블에 insert 
		if(vo.getAttachList() != null)
			vo.getAttachList().forEach(upload->{
			upload.setBno(vo.getBno());
			attachmapper.insert(upload);
		});
		
		
	}
	//게시글 조회(한 건을 select)
	@Transactional
	@Override
	public BoardVO select(BoardVO vo) throws Exception {
		//mapper.select(vo);
		mapper.updateViewcnt(vo);
		return mapper.select(vo);
	}

	@Override
	public void update(BoardVO vo) throws Exception {
		mapper.update(vo);
		
	}
	
	@Transactional
	@Override
	public void delete(BoardVO vo) throws Exception {
		mapper.delete(vo);
	}

	@Override
	public List<BoardVO> listAll() throws Exception {
		return mapper.listAll();
	}
	@Override
	public List<BoardVO> listPage(Criteria cri) throws Exception {
		return mapper.listPage(cri);
	}
	@Override
	public int getTotalCount(Criteria cri) throws Exception {
		return mapper.getTotalCount(cri);
	}
	@Override
	public List<BoardAttachVO> getAttachlist(int bno) {
		return attachmapper.select(bno);
	}
	
	//커뮤니티 글쓰기
	@Override
	public void insertComm(BoardVO vo) throws Exception {
		mapper.insertComm(vo);
		
	}
	
	//커뮤니티 상세페이지
	@Transactional
	@Override
	public BoardVO selectComm(BoardVO vo) throws Exception {
		mapper.comViewcnt(vo);
		return mapper.selectComm(vo);
	}
	
	@Override
	public void updateCom(BoardVO vo) throws Exception {
		mapper.updateCom(vo);
		
	}
	
	@Transactional
	@Override
	public void deleteCom(BoardVO vo) throws Exception {
		mapper.deleteCom(vo);		
	}
	
	
	@Override
	public List<BoardVO> commlistAll() throws Exception {
		return mapper.commlistAll();
	}
	
	@Override
	public List<BoardVO> commlistPage(Criteria cri) throws Exception {
		return mapper.commlistPage(cri);
	}
	@Override
	public List<BoardVO> allmyPost(String userid) throws Exception {
		return mapper.allmyPost(userid);
	}
	// 메인 커뮤니티 베스트 게시글
	@Override
	public List<BoardVO> bestList() throws Exception {
		return mapper.bestList();
	}
	
	// 메인 최신 공지사항 게시글
	@Override
	public List<BoardVO> latestList() throws Exception {
		return mapper.latestList();
	}
	
}
