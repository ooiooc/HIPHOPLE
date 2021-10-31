package com.project.hiphople;

import java.security.Principal;
import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.project.domain.Criteria;
import com.project.service.ArticleService;
import com.project.service.BoardService;

/**
 * Handles requests for the application home page.
 */

@Controller
public class HomeController {
	
	@Autowired
	private BoardService service;
	
	@Autowired
 	private ArticleService articleservice;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model, Principal principal, Criteria cri) throws Exception {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate);
		model.addAttribute("notice", service.listPage(cri)); //notice
		model.addAttribute("list", articleservice.postlistPage(cri)); //article
		model.addAttribute("best", service.bestList()); //communtiny best list
		model.addAttribute("latest", service.latestList()); //notice latest list
		
		return "index";
	}
	
}
