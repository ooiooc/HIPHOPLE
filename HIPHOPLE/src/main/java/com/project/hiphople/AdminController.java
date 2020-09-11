package com.project.hiphople;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("admin")
public class AdminController {
	/*
	@Autowired
	private adminService adminservice;*/
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	//관리자 페이지
	@RequestMapping(value = "admin_login", method = RequestMethod.GET)
	    public String adminindex() {
	        return "admin/adminLogin";
	    }
	}



