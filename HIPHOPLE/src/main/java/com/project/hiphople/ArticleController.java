package com.project.hiphople;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.project.domain.ArticleVO;
import com.project.domain.BoardVO;
import com.project.domain.Criteria;
import com.project.domain.PageDTO;
import com.project.service.ArticleService;
import com.project.service.BoardService;

@Controller
@RequestMapping("interview")
public class ArticleController {

	@Autowired
 	private ArticleService service;

 	private static final Logger logger = LoggerFactory.getLogger(ArticleController.class);
 	
	//Interview 게시판 리스트 화면 (페이징 x)
	@RequestMapping(value="list", method = RequestMethod.GET)
	public void articleList(Model model, Criteria cri) throws Exception{ 
			logger.info("article list get");
			model.addAttribute("list", service.listAll());
	}
	
	//Interview 게시물 상세페이지 화면 
	@RequestMapping(value="view", method = RequestMethod.GET)
	public void articleView() throws Exception{ 
			logger.info("인터뷰 상세 페이지 get");
	}
	
	//Interview 게시판 글쓰기 화면 
	@RequestMapping(value="write", method = RequestMethod.GET)
	public void writeView() throws Exception{ 
			logger.info("article 글쓰기");
	}

	//공지사항 글쓰기 기능
	@RequestMapping(value="insert", method = RequestMethod.POST)
	public String insertPost(ArticleVO vo, Model model) throws Exception{
	 			
	 		logger.info("article 게시판 글쓰기 post");
	 		logger.info("ArticleVO에 저장되어 있는 값 :" + vo);
	 			
	 		service.insert(vo); //insert SQL
	 		model.addAttribute("result", "success");
	 			
	 		return "redirect:/interview/test";

	 	}
	
	//테스트 페이지 가져오기
	@RequestMapping(value="test", method = RequestMethod.GET)
	public void testGet() throws Exception{ 
			logger.info("동영상 삽입 메인페이지 up");
	}

}
