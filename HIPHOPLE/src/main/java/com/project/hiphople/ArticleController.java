package com.project.hiphople;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.project.domain.ArticleVO;
import com.project.domain.BoardAttachVO;
import com.project.domain.BoardVO;
import com.project.domain.Criteria;
import com.project.domain.PageDTO;
import com.project.service.ArticleService;
import com.project.service.BoardService;

@Controller
//@RequestMapping("interview")
public class ArticleController {

	@Autowired
 	private ArticleService service;

 	private static final Logger logger = LoggerFactory.getLogger(ArticleController.class);

	//Interview 리스트 화면 + 페이징
	
	@RequestMapping(value = "list", method = RequestMethod.GET) public void
	listGet(Model model, Criteria cri) throws Exception{ //모델 안에 넣어주기 위해서(select된 내용을 화면에 보여주기) 위에 model 선언 
		logger.info("리스트 get" + cri);
		model.addAttribute("list", service.postlistPage(cri));
		model.addAttribute("pageMaker", new PageDTO(cri,
		service.getTotalCount(cri))); }
	 
 	
	//Interview 게시판 리스트 화면 (페이징 x)
	@RequestMapping(value="interview/list", method = RequestMethod.GET)
	public void articleList(Model model, Criteria cri) throws Exception{ 
			logger.info("article list get");
			/* model.addAttribute("list", service.listAll()); */
			model.addAttribute("list", service.postlistPage(cri));	
			model.addAttribute("pageMaker", new PageDTO(cri, service.getTotalCount(cri)));
 	}
	
	//Interview 게시물 상세페이지 화면 
	@RequestMapping(value="interview/view", method = RequestMethod.GET)
	public void articleView(ArticleVO vo,  @ModelAttribute("cri") Criteria cri, Model model) throws Exception{ 
		logger.info("상세글 페이지 get" + vo);
		logger.info("상세글 페이지 get" + cri);
			model.addAttribute("view", service.select(vo));
	}
	
	//Interview 게시판 글쓰기 화면 
	@RequestMapping(value="interview/write", method = RequestMethod.GET)
	public void writeView() throws Exception{ 
			logger.info("article 글쓰기");
	}

	//interview 글쓰기 기능
	@RequestMapping(value="interview/insert", method = RequestMethod.POST)
	public String insertPost(ArticleVO vo, Model model) throws Exception{
	 			
	 		logger.info("article 게시판 글쓰기 post");
	 		logger.info("ArticleVO에 저장되어 있는 값 :" + vo);
	 			
	 		service.insert(vo); //insert SQL
	 		model.addAttribute("result", "success");
	 			
	 		return "redirect:/interview/list";

	 	}
	

	//첨부파일 리스트 가져오기
	/*
	@RequestMapping(value = "notice/getAttachlist", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public ResponseEntity<List<BoardAttachVO>> getAttachlist(int bno){
		logger.info("getAttachlist = " + bno);
		logger.info("service.getAttachlist(bno) = " + service.getAttachlist(bno));
		return new ResponseEntity<>(service.getAttachlist(bno), HttpStatus.OK);
	}
	*/
	
	//테스트 페이지 가져오기
	@RequestMapping(value="test", method = RequestMethod.GET)
	public void testGet() throws Exception{ 
			logger.info("동영상 삽입 메인페이지 up");
	}
	

}
