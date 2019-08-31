package com.engbaek.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.engbaek.domain.ClassQnaVO;
import com.engbaek.domain.Criteria;
import com.engbaek.domain.PageDTO;
import com.engbaek.service.ClassQnaService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/classQna/*")
@AllArgsConstructor
public class ClassQnaController {
	
	private ClassQnaService service; 
	
	//Q&A 강의중인 강좌 조회
	@GetMapping("/qna_class_list")
	public void classList(Model model, Criteria cri) {
		log.info("QnaClassList");
		model.addAttribute("qnaClassList", service.getQnaClassList(cri));
	}
	
	// 강의별 Q&A 전체 목록
	@GetMapping("/list")
	public void list(@RequestParam("courseCode") Long courseCode, Model model, Criteria cri) {
		log.info("list");
		model.addAttribute("classQnaList", service.getList(courseCode, cri));
		int total = service.getTotal(cri);
		log.info("list total" + total);
		model.addAttribute("pageMaker",new PageDTO(cri,total));
	}
	
	// 강의별 Q&A 게시물 하나가져옴
	@GetMapping({ "/read", "/modify" })
	public void get(@RequestParam("classQnaNo") Long classQnaNo, @ModelAttribute("cri") Criteria cri, Model model) {
		log.info("Q&A 게시물 하나가져옴");
		model.addAttribute("classQna",service.get(classQnaNo));
	}
	// 강의별 Q&A 수정
	@PostMapping("/modify")
	public String modify(ClassQnaVO classQna, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
		log.info("modify: " + classQna);
		
		if(service.modify(classQna)) {
			rttr.addFlashAttribute("result","success");
		}
		return "redirect:/classQna/read?classQnaNo="+classQna.getClassQnaNo();
	}
	
	// 강의별 Q&A 삭제
	@PostMapping("/remove")
	public String remove(ClassQnaVO classQna,@RequestParam("classQnaNo") Long classQnaNo, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
		log.info("remove" + classQnaNo);
		
		if(service.remove(classQnaNo)) {
			rttr.addFlashAttribute("result","success");
		}		
		return "redirect:/classQna/list?courseCode="+classQna.getCourseCode();
	}
	
	// 강의별 Q&A 등록 화면 이동
	@GetMapping("/register")
	public void register() {} 
	
	// (학생)강의별 Q&A 등록하기
	@PostMapping("/register")
	public String register(ClassQnaVO classQna, RedirectAttributes rttr) { //등록후 다시 목록으로 가기위해 RedirectAttributes사용
		
		log.info("register: " + classQna);
		service.register(classQna);
		
		rttr.addFlashAttribute("result", classQna.getClassQnaNo()); //추가적으로 새롭게 등록되는 게시물 번호 같이 전달 
		
		return "redirect:/classQna/list?courseCode="+classQna.getCourseCode(); //redirect: 접두어는 스프링 mvc가 내부적으로 response.sendRedirect() 해주기 때문에 사용 
	}
}
