package com.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.domain.ArticleVO;
import com.project.mapper.BoardAttachMapper;
import com.project.mapper.ArticleMapper;

@Service
public class ArticleServiceImpl implements ArticleService{
	
	@Autowired
	private ArticleMapper mapper;
	
	//@Autowired
	//private BoardAttachMapper attachmapper;

	@Override
	public void insert(ArticleVO vo) throws Exception {
		//board 테이블에 insert
		mapper.insert(vo);
		
	}
	
	//게시물 조회
	@Override
	public ArticleVO select(ArticleVO vo) throws Exception {
		return mapper.select(vo);
	}

	//게시물 수정
	@Override
	public void update(ArticleVO vo) throws Exception {
		mapper.update(vo);
		
	}

	//게시물 삭제
	@Override
	public void delete(ArticleVO vo) throws Exception {
		mapper.delete(vo);
		
	}
	//전체 게시물 리스트 조회
	@Override
	public List<ArticleVO> listAll() throws Exception {
		return mapper.listAll();
	}

	
	
}
