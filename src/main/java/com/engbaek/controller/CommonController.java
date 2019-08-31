package com.engbaek.controller;

import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;


@Controller
@AllArgsConstructor
@RequestMapping("/member/*")
@Log4j
public class CommonController {		
	
	@RequestMapping(value = "/customLogin", method = RequestMethod.GET)
	public void loginInput(String error, String logout, Model model) {
		log.info("custom login...");
		log.info("error : " + error);
		log.info("logout : " + logout);
		
		if(error != null) {
			model.addAttribute("error", "로그인에 실패했습니다.");
		}
		if(logout != null) {
			model.addAttribute("logout", "로그아웃 되었습니다.");
		}
	}
	
	@RequestMapping(value="/accessError", method = RequestMethod.GET)
	public void accessDenied(Authentication auth, Model model) {
		log.info("access Denied : " + auth);
		model.addAttribute("msg", "권한이 없습니다");
	}

	@RequestMapping(value = "/customLogout", method = RequestMethod.GET)
	public void logoutGet() {
		log.info("logout");
	}
	
	@RequestMapping(value = "/customLogout", method = RequestMethod.POST)
	public void logoutPost() {
		log.info("logout POST");
	}
	
	
}
	