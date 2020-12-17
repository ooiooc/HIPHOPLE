package com.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.project.domain.ArticleVO;
import com.project.domain.BoardAttachVO;
import com.project.domain.BoardVO;
import com.project.domain.CategoriesVO;
import com.project.domain.Criteria;
import com.project.mapper.BoardAttachMapper;
import com.project.mapper.ArticleMapper;

@Service
public class ArticleServiceImpl implements ArticleService{
	
	@Autowired
	private ArticleMapper mapper;
	
	@Autowired
	private BoardAttachMapper attachmapper;

	@Override
	public void insert(ArticleVO vo) throws Exception {
		//board 테이블에 insert
		mapper.insert(vo);
		
		//upload 테이블에 insert 
		if(vo.getAttachList() != null)
			vo.getAttachList().forEach(upload->{
			upload.setBno(vo.getBno());
			attachmapper.continsert(upload);
		});
	}
	
	//게시물 상세페이지 (한 건 select)
	@Transactional
	@Override
	public ArticleVO select(ArticleVO vo) throws Exception {
		mapper.updateViewcnt(vo);
		return mapper.select(vo);
	}

	//게시물 수정
	@Override
	public void update(ArticleVO vo) throws Exception {
		mapper.update(vo);
		
	}

	//게시물 삭제
	@Transactional
	@Override
	public void delete(ArticleVO vo) throws Exception {
		mapper.delete(vo);
		
	}
	//전체 게시물 리스트 조회
	@Override
	public List<ArticleVO> listAll() throws Exception {
		return mapper.listAll();
	}
	
	@Override
	public List<ArticleVO> postlistPage(Criteria cri) throws Exception {
		return mapper.postlistPage(cri);
	}
	
	@Override
	public int getTotalCount(Criteria cri) throws Exception {
		return mapper.getTotalCount(cri);
	}

	@Override
	public List<CategoriesVO> categoryList() throws Exception {
		return mapper.categoryList();
	}

	@Override
	public List<BoardAttachVO> getAttachlist(int bno) {
		return attachmapper.contselect(bno);
	}

}
