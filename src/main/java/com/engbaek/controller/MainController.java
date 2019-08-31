package com.engbaek.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.AllArgsConstructor;

@Controller
@RequestMapping("/about/*")
@AllArgsConstructor
public class MainController {

	@GetMapping("/about")
	public void about() {
	}
	
	@GetMapping("/contact")
	public void contact() {
	}
	@GetMapping("/facilities")
	public void facilities() {
	}
	
	@GetMapping("/history")
	public void history() {
	}
	
	@GetMapping("/mypage")
	public void mypage() {
	}
}  
