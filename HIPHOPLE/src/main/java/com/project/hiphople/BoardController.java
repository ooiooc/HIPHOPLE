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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import com.project.domain.Criteria;
import com.project.domain.MemberVO;
import com.project.domain.PageDTO;
import com.mysql.cj.Session;
import com.project.domain.BoardAttachVO;
//import com.myspring.domain.BoardAttachVO;
//import com.myspring.domain.PageDTO;
import com.project.domain.BoardVO;
import com.project.service.BoardService;
import com.project.service.MemberService;

@Controller
/* @RequestMapping("board") */

public class BoardController{

	@Autowired
 	private BoardService service;

	@Autowired
	private MemberService memservice;
	
 	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
 	
 	//게시글 좋아요 기능
 	@RequestMapping(value = "like.do", method = RequestMethod.POST)
 	public void likePost() throws Exception{
 		
 	}
 	
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
 		
 		board.setWriter("힙합엘이");
 		service.insert(board); //insert SQL
 		model.addAttribute("result", "success");
 			
 		return "redirect:/notice/list";

 	}
 
	//공지사항 리스트 화면 + 페이징
 	@RequestMapping(value = "notice/list", method = RequestMethod.GET)
	public void noticelistGet(Model model, Criteria cri) throws Exception{ //모델 안에 넣어주기 위해서(select된 내용을 화면에 보여주기) 위에 model 선언
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

	//Community 게시판 글쓰기 화면
	@GetMapping("community/write")
	public String boardWrite(MemberVO mem, Model model) {
		logger.info("summernote 확인");
		
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		String userid = authentication.getName(); //로그인된 username
		
		logger.info("current username : {}", userid);
		
		mem.setUserid(userid);
		model.addAttribute("member", memservice.memberInfo(mem));
		
		return "community/write";
	}
	
	//Community 글쓰기 처리
	 @RequestMapping(value="community/insertComm", method = RequestMethod.POST)
	 public String insertComm(BoardVO board, Model model) throws Exception{	 			
	 		logger.info("커뮤니티 글쓰기 post");
	 		logger.info("BoardVO에 저장되어 있는 값 :" + board);
	 		
	 		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
			String userid = authentication.getName();
	 		board.setWriterid(userid); //current user 저장
	 		
	 		service.insertComm(board); //insert SQL
	 		model.addAttribute("result", "success");
	 			
	 	return "redirect:/community/list";

	 }
	 
	//Community 상세페이지
	@RequestMapping(value = "community/view", method = RequestMethod.GET)
	public void viewComm(BoardVO board, @ModelAttribute("cri") Criteria cri, Model model) throws Exception{
		logger.info("상세글 페이지 get" + board);
		logger.info("상세글 페이지 get" + cri);
			model.addAttribute("view", service.selectComm(board));
	}
	
 	//Community 수정 화면
 	@RequestMapping(value="community/update", method = RequestMethod.GET)
 		public void modifyviewcomm(BoardVO board, @ModelAttribute("cri") Criteria cri, Model model) throws Exception{
 			logger.info("커뮤니티 수정 페이지");
 			model.addAttribute("update", service.selectComm(board));	
 	}
 	
 	//Community 수정 기능
 	@RequestMapping(value="community/update.do", method = RequestMethod.POST)
	public String modifyComm(BoardVO board, Criteria cri, RedirectAttributes rttr) throws Exception {
		logger.info("커뮤니티 글 수정" + board);
		service.updateCom(board);
		
		//수정했을때 아래의 내용 전송
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addFlashAttribute("msg", "SUCCESS!");
		return "redirect:/community/list"; 
	}
 	
	//community 삭제
 	@RequestMapping(value = "community/delete", method = RequestMethod.POST)
	public String removeComm(BoardVO board, Criteria cri, RedirectAttributes rttr) throws Exception{
		logger.info("삭제 post");
		service.deleteCom(board);
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addFlashAttribute("msg", "DSUCCESS!");
		return "redirect:/notice/list";
	}	
	 	
	//community 리스트 화면 페이징 o
 	@RequestMapping(value = "community/list", method = RequestMethod.GET)
	public void listComm(Model model, Criteria cri, BoardVO board) throws Exception{ //모델 안에 넣어주기 위해서(select된 내용을 화면에 보여주기) 위에 model 선언
		logger.info("리스트 get" + cri);
		model.addAttribute("list", service.commlistPage(cri));
		
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		String userid = authentication.getName(); 
		model.addAttribute("mypost", service.allmyPost(userid));
		
		model.addAttribute("pageMaker", new PageDTO(cri, service.getTotalCount(cri)));
 	}
 	
 	//community 내 글 리스트 조회
 	@RequestMapping(value = "viewall", method = RequestMethod.GET)
	public void listGet(@ModelAttribute("boardVO") BoardVO boardVO, Model model, Criteria cri, String userid) throws Exception{ //모델 안에 넣어주기 위해서(select된 내용을 화면에 보여주기) 위에 model 선언
 		logger.info("내가 작성한 글 전부 보기" + cri);
 		model.addAttribute("mypost", service.allmyPost(userid));
 	}
 	
	/*
	 * @RequestMapping(value="member/searchPwform", method=RequestMethod.GET) public
	 * void searchPwForm(){ logger.info("비밀번호 찾기 화면");
	 * 
	 * }
	 */
 	
 	//비디오 화면 모달 창 삽입
 	@RequestMapping(value="video/list", method = RequestMethod.GET)
		public void videoGet() throws Exception{
			logger.info("비디오 화면 이동 get");
			
	}
	
}
