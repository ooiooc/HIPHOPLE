package com.project.hiphople;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import com.project.domain.BoardVO;
import com.project.mapper.BoardMapper;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")

public class BoardMapperTest {
	
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private BoardMapper boardmapper;
	
	@Test
	public void testInsert() throws Exception{
		
		BoardVO board = new BoardVO();
		
		board.setTitle("제목입니다");
		board.setContent("내용입니다");
		board.setWriter("새벽");
		
		boardmapper.insert(board);
	}
	
	@Test
	public void testSelect() throws Exception{
		BoardVO board = new BoardVO();
		board.setBno(1);
		logger.info("제목을 클릭한 후 select = " + boardmapper.select(board));
		
	}
	
	@Test
	public void testUpdate() throws Exception{
		BoardVO board = new BoardVO();
		boardmapper.update(board);
		
	}
	
	@Test
	public void testDelete() throws Exception{
		BoardVO board = new BoardVO();
		board.setBno(1);
		boardmapper.update(board);
		
	}
}
