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
	
	//글쓰기
	@Transactional
	@Override
	public void insert(BoardVO vo) throws Exception {
		
		//board 테이블에 insert
		mapper.insert(vo);
		
		//upload테이블에 insert
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
}
