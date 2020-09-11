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
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import com.project.domain.Criteria;
import com.project.domain.PageDTO;
import com.project.domain.BoardAttachVO;
//import com.myspring.domain.BoardAttachVO;
//import com.myspring.domain.PageDTO;
import com.project.domain.BoardVO;
import com.project.service.BoardService;

@Controller
/* @RequestMapping("board") */

public class BoardController{

	@Autowired
 	private BoardService service;

 	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
 	
 	//공지사항 글쓰기 화면
 	@RequestMapping(value="notice/write", method = RequestMethod.GET)
 		public void insertGET() throws Exception{
 			logger.info("글쓰기 화면 이동 get");
 			
 	}

 	//공지사항 글쓰기 기능
 	@RequestMapping(value="notice/insert", method = RequestMethod.POST)
 		public String insertPost(BoardVO board, Model model) throws Exception{
 			
 			logger.info("글쓰기 post");
 			logger.info("BoardVO에 저장되어 있는 값 :" + board);
 			
 			service.insert(board); //insert SQL
 			model.addAttribute("result", "success");
 			
 			return "redirect:/notice/list";

 	}
 
	//공지사항 리스트 화면 + 페이징
 	@RequestMapping(value = "notice/list", method = RequestMethod.GET)
	public void listGet(Model model, Criteria cri) throws Exception{ //모델 안에 넣어주기 위해서(select된 내용을 화면에 보여주기) 위에 model 선언
		logger.info("리스트 get" + cri);
		model.addAttribute("list", service.listPage(cri));		
		model.addAttribute("pageMaker", new PageDTO(cri, service.getTotalCount(cri)));
 	}
 	
 	//게시글 목록 화면 with no페이징
 	/*
 	@RequestMapping(value = "list", method = RequestMethod.GET)
	public void listGet(@ModelAttribute("boardVO") BoardVO boardVO, Model model, Criteria cri) throws Exception{ //모델 안에 넣어주기 위해서(select된 내용을 화면에 보여주기) 위에 model 선언
 		logger.info("페이징 되지않은 리스트 get" + cri);
 		model.addAttribute("list", service.listAll());
 	}*/
 	
 	//공지사항 상세 페이지
 	@RequestMapping(value = "notice/view", method = RequestMethod.GET)
	public void viewGet(BoardVO board, @ModelAttribute("cri") Criteria cri, Model model) throws Exception{
		logger.info("상세글 페이지 get" + board);
		logger.info("상세글 페이지 get" + cri);
		model.addAttribute("view", service.select(board));
 	}
 	
 	//공지사항 수정 화면
 	@RequestMapping(value="notice/update", method = RequestMethod.GET) //수정은 화면이 필요하기 때문에 GET
 		public void modifyGet(BoardVO board, @ModelAttribute("cri") Criteria cri, Model model) throws Exception{
 			logger.info("업데이트 get");
 			model.addAttribute("update", service.select(board));
 			
 		}
 	
 	//공지사항 수정 기능
 	@RequestMapping(value="notice/update", method = RequestMethod.POST)
	public String modifyPost(BoardVO board, Criteria cri, RedirectAttributes rttr) throws Exception {
		logger.info("update post" + board);
		service.update(board);
		
		//수정했을때 아래의 내용 전송
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addFlashAttribute("msg", "SUCCESS!");
		return "redirect:/notice/list"; 
	}

 	
 	//공지사항 삭제
 	@RequestMapping(value = "notice/delete", method = RequestMethod.POST)
	public String removePost(BoardVO board, Criteria cri, RedirectAttributes rttr) throws Exception{
		logger.info("삭제 post");
		service.delete(board);	
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addFlashAttribute("msg", "DSUCCESS!");
		return "redirect:/notice/list";
	}	
 	
	//첨부파일 리스트 가져오기
	@RequestMapping(value = "notice/getAttachlist", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public ResponseEntity<List<BoardAttachVO>> getAttachlist(int bno){
		logger.info("getAttachlist = " + bno);
		logger.info("service.getAttachlist(bno) = " + service.getAttachlist(bno));
		return new ResponseEntity<>(service.getAttachlist(bno), HttpStatus.OK);
	
	}

	
	
	
	
}
