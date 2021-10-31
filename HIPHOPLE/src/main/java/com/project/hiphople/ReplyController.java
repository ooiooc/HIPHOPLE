package com.project.hiphople;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.project.domain.Criteria;
import com.project.domain.ReplyPageVO;
import com.project.domain.ReplyVO;
import com.project.service.ReplyService;

@RestController
@RequestMapping("replies")
public class ReplyController {

	@Autowired
 	private ReplyService reservice;
	private static final Logger logger = LoggerFactory.getLogger(ReplyController.class);
	
	//댓글 목록 리스트
	@RequestMapping(value = "all/{bno}/{page}", method = RequestMethod.GET)
	public ResponseEntity<ReplyPageVO> list(@PathVariable("bno") int bno, @PathVariable("page") int page) throws Exception{
		System.out.println("bno=" + bno);
		Criteria cri = new Criteria(page,10);
		return new ResponseEntity<>(reservice.list(bno, cri), HttpStatus.OK);
	}
	
	//댓글 작성
	@RequestMapping(value="", method = RequestMethod.POST)
	public ResponseEntity<String> list(@RequestBody ReplyVO vo) throws Exception{
		logger.info("reply create post" + vo);	
		ResponseEntity<String> entity = null;
		
		try {
			reservice.insert(vo);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
			
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	//댓글 수정
	@RequestMapping(value="{rno}", method = RequestMethod.PUT)
	public ResponseEntity<String> update(@PathVariable("rno") int rno, @RequestBody ReplyVO vo) throws Exception{
		
		ResponseEntity<String> entity = null;
		
		try {
			vo.setRno(rno);
			reservice.update(vo);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	//댓글 삭제
	@RequestMapping(value="{rno}", method = RequestMethod.DELETE)
	public ResponseEntity<String> delete(@PathVariable("rno") int rno) throws Exception{
		
		ResponseEntity<String> entity = null;
		
		try {
		
			reservice.delete(rno);
			
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
}
