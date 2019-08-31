package com.engbaek.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.engbaek.domain.Criteria;
import com.engbaek.service.ClassStudentService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/classStudent/*")
@AllArgsConstructor
public class ClassStudentController {
	
	private ClassStudentService service;
	
	//강의중인 강좌 조회
	@GetMapping("/student_class_list")
	public void classList(Model model, Criteria cri) {
		log.info("StudentClassList");
		model.addAttribute("studentClassList", service.getStudentClassList(cri));
	}
	
	//학생 명단 조회
	@GetMapping("/studentList")
	public void list(@RequestParam("courseCode") Long courseCode, Model model, Criteria cri) {
		log.info("studentList");
		model.addAttribute("studentList", service.getStudentList(courseCode, cri));
	}
}
