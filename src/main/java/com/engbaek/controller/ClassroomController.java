package com.engbaek.controller;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.engbaek.domain.Criteria;
import com.engbaek.domain.PageDTO;
import com.engbaek.service.ClassroomService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/classroom/*")
@Log4j
@AllArgsConstructor
public class ClassroomController {
	
	private ClassroomService service;
		//강의실 현황 목록 조회
		@GetMapping("/list")
		public void list(Long classroomNo, Model model, Criteria cri) {
			log.info("list");			
			model.addAttribute("classroomList", service.getList(classroomNo,cri));		
			model.addAttribute("pageMaker", new PageDTO(cri,123));
		}

}
