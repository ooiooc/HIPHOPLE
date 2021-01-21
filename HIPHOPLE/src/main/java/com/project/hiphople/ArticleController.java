package com.project.hiphople;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.project.domain.ArticleVO;
import com.project.domain.BoardAttachVO;
import com.project.domain.Criteria;
import com.project.domain.MemberVO;
import com.project.domain.PageDTO;
import com.project.service.ArticleService;
import com.project.service.MemberService;

@Controller
@RequestMapping("contents")
public class ArticleController {

	@Autowired
 	private ArticleService service;
	
	@Autowired
	private MemberService meservice;

 	private static final Logger logger = LoggerFactory.getLogger(ArticleController.class);

	//contents 리스트 화면 + 페이징
	/*
	@RequestMapping(value = "list", method = RequestMethod.GET) public void
	listGet(Model model, Criteria cri) throws Exception{ //모델 안에 넣어주기 위해서(select된 내용을 화면에 보여주기) 위에 model 선언 
		logger.info("리스트 get" + cri);
		model.addAttribute("list", service.postlistPage(cri));
		model.addAttribute("pageMaker", new PageDTO(cri,service.getTotalCount(cri))); }
	*/ 
 	
	// contents 게시판 리스트 화면 (페이징 o)
	@RequestMapping(value="list", method = RequestMethod.GET)
	public void articleList(Model model, Criteria cri) throws Exception{ 
			logger.info("article list get");
			
			//List<ArticleVO> article= service.listAll();
			//
	 		//model.addAttribute("list", service.listAll());
			model.addAttribute("list", service.postlistPage(cri));	
			model.addAttribute("pageMaker", new PageDTO(cri, service.getTotalCount(cri)));
			model.addAttribute("category", service.categoryList());
			//model.addAttribute("upload", service.getAttachlist(bno));
			
	}
	
	// contents 게시물 상세페이지 화면 
	@RequestMapping(value="view", method = RequestMethod.GET)
	public void articleView(ArticleVO vo,  @ModelAttribute("cri") Criteria cri, Model model, MemberVO mem) throws Exception{ 
		logger.info("상세글 페이지 get" + vo);
		logger.info("상세글 페이지 get" + cri);
		
		
		// 현재 접속 중인 아이디를 불러와서 회원정보 조회 -> getUsername -> 댓글 작성자 set
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		String userid = authentication.getName(); //로그인된 username
		
		MemberVO userinfo = new MemberVO();
		
		if(userid != "anonymousUser") {
			logger.info("현재 접속중인 회원 아이디는" + userid + "입니다");
			userinfo.setUserid(userid);
			userinfo = meservice.memberInfo(userinfo);
			logger.info("현재 접속중인 회원정보 조회 : " + userinfo);
			model.addAttribute("writer", userinfo.getUsername());
			model.addAttribute("userid", userinfo.getUserid());
			}else {
				userinfo.setUsername("비회원");
				logger.info(userinfo.getUsername());
				model.addAttribute("user", userinfo.getUsername());
			}
		model.addAttribute("view", service.select(vo));
	}
	
	// contents 게시판 글쓰기 화면 
	@RequestMapping(value="write", method = RequestMethod.GET)
	public void writeView() throws Exception{ 
			logger.info("article 글쓰기");
	}

	// contents 글쓰기 기능
	@RequestMapping(value="insert", method = RequestMethod.POST)
	public String insertPost(ArticleVO vo, Model model) throws Exception{
	 		logger.info("article 게시판 글쓰기 post");
	 		logger.info("ArticleVO에 저장되어 있는 값 :" + vo);
	 		
 			vo.setWriter("힙합엘이");
	 		service.insert(vo); //insert SQL
	 		//model.addAttribute("result", "success");
	 			
	 		return "redirect:/contents/list";
	 	}
	
	// contents 수정
	@RequestMapping(value="update", method = RequestMethod.GET)
	 	public void modifyGet(ArticleVO vo, @ModelAttribute("cri") Criteria cri, Model model) throws Exception{
	 			logger.info("contents 업데이트 화면 get");
	 			model.addAttribute("update", service.select(vo));	
	 			logger.info("update get ::::: " + vo);
	 	}
	 
	// contents 수정 기능
	@RequestMapping(value="update.do", method = RequestMethod.POST)
		public String modifyPost(ArticleVO vo, Criteria cri, RedirectAttributes rttr) throws Exception {
			logger.info("update post" + vo);
			service.update(vo);
			
			//수정했을때 아래의 내용 전송
			rttr.addAttribute("pageNum", cri.getPageNum());
			rttr.addFlashAttribute("msg", "SUCCESS!");
			return "redirect:/contents/list"; 
		}
	 
	// 첨부파일 리스트 가져오기
	@RequestMapping(value = "getAttachlist", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public ResponseEntity<List<BoardAttachVO>> getAttachlist(int bno){
		logger.info("getAttachlist = " + bno);
		logger.info("service.getAttachlist(bno) = " + service.getAttachlist(bno));
		return new ResponseEntity<>(service.getAttachlist(bno), HttpStatus.OK);
	}
	
	// 글 삭제
	@RequestMapping(value = "delete", method = RequestMethod.POST)
	public String removeComm(ArticleVO board, Criteria cri, RedirectAttributes rttr) throws Exception{
		logger.info("contents delete post");
		service.delete(board);
		//rttr.addAttribute("pageNum", cri.getPageNum());
		//rttr.addFlashAttribute("msg", "DSUCCESS!");
		return "redirect:/contents/list";
	}	

}
