package com.project.hiphople;

import java.security.Principal;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.project.domain.Criteria;
import com.project.domain.PageDTO;
import com.project.service.BoardService;
import com.project.service.MemberService;

@Controller
@RequestMapping("admin")
public class AdminController {
	/*
	@Autowired
	private adminService adminservice;*/
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@Autowired
 	private BoardService service;
	
	@Autowired
	private MemberService meservice;
	
	//관리자 페이지
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public void meminfoList(Model model, Criteria cri, Principal principal, RedirectAttributes rttr) throws Exception{ 

		logger.info("회원 목록 : " + cri);
		
		String currentUser = principal.getName();
		
		logger.info("현재 세션 사용자 : " + currentUser);
		

		model.addAttribute("list", meservice.memberList(cri)); // 회원 리스트		
		model.addAttribute("total", meservice.memberTotal()); // 총 회원 수
		model.addAttribute("pageMaker", new PageDTO(cri, meservice.meminfoCount(cri)));
		
		/*
		if(currentUser == "ooiooc") {
			logger.info("관리자 접속 중입니다");
			model.addAttribute("msg","관리자");
			}else {
				rttr.addFlashAttribute("msg", "회원");
		}*/
		}
}// end



