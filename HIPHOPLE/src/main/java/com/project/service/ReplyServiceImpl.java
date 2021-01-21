package com.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.domain.Criteria;
import com.project.domain.ReplyPageVO;
import com.project.domain.ReplyVO;
import com.project.mapper.ReplyMapper;

@Service
public class ReplyServiceImpl implements ReplyService{

	@Autowired
	private ReplyMapper remapper;
	
	public ReplyPageVO list (int bno, Criteria cri) throws Exception{
		//cri 에 pageNum, amount 
		System.out.println("service bno = " + bno);
		return new ReplyPageVO(remapper.list(bno, cri), remapper.getCountByBno(bno));
	}

	@Override
	public void insert(ReplyVO vo) throws Exception {
		remapper.insert(vo);
	}

	@Override
	public void update(ReplyVO vo) throws Exception {
		remapper.update(vo);
		
	}

	@Override
	public void delete(int rno) throws Exception {
		remapper.delete(rno);
	}

	
	
}
