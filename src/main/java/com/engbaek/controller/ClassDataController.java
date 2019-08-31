package com.engbaek.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.engbaek.domain.ClassDataVO;
import com.engbaek.domain.Criteria;
import com.engbaek.service.ClassDataService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/class/*")
@AllArgsConstructor
public class ClassDataController {
	
	private ClassDataService service;
	
	//강의중인 강좌 목록 
	@GetMapping("/classData_class_list")
	public void classList(Model model, Criteria cri) {
		log.info("classList");
		model.addAttribute("classDataClassList", service.getClassList(cri));
	}
	// 강의 공지사항 & 수업자료 목록
	@GetMapping("/list")
	public void list(@RequestParam("courseCode") Long courseCode, Model model, Criteria cri) {
		log.info("list");
		model.addAttribute("classDataList", service.getList(courseCode, cri));
		//int total = service.getTotal(cri);
		//log.info("list total" + total);
		//model.addAttribute("pageMaker",new PageDTO(cri,total));
	}
	
	// 강의 공지사항 & 수업자료 상세 조회 or 수정 화면
	@GetMapping({ "/read", "/modify" })
	public void get(@RequestParam("classDataNo") Long classDataNo, @ModelAttribute("cri") Criteria cri, Model model) {
		log.info("수업자료 및 공지사항 게시물 하나가져옴");
		model.addAttribute("classData", service.get(classDataNo));
	}
	
	// 강의 공지사항 & 수업자료 수정
	@PostMapping("/modify")
	public String modify(ClassDataVO classData, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
			log.info("modify: " + classData);
		
		if(service.modify(classData)) {
			rttr.addFlashAttribute("result","success");
		}
		return "redirect:/class/read?classDataNo="+classData.getClassDataNo();
	}
	
	// 강의 공지사항 & 수업자료 삭제
	@PostMapping("/remove")
	public String remove(ClassDataVO classData, @RequestParam("classDataNo") Long classDataNo, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
		
		log.info("remove" + classDataNo);
		
		if(service.remove(classDataNo)) {
			rttr.addFlashAttribute("result","success");
		}	
		return "redirect:/class/list?courseCode="+classData.getCourseCode();
	}
	
	// 강의 공지사항 & 수업자료 등록 화면
	@GetMapping("/register")
	public void register() {}
	
	// 강의 공지사항 & 수업자료 등록
	@PostMapping("/register")
	public String register(ClassDataVO classData, RedirectAttributes rttr) {
		
		log.info("register" + classData);
		service.register(classData);
		
		rttr.addFlashAttribute("result", classData.getClassDataNo());
		return "redirect:/class/list?courseCode=" + classData.getCourseCode();

	}
}
