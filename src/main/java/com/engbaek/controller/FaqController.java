package com.engbaek.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.engbaek.domain.Criteria;
import com.engbaek.domain.FaqVO;
import com.engbaek.domain.PageDTO;
import com.engbaek.service.FaqService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/faq/*")
@AllArgsConstructor
public class FaqController {
	private FaqService service;

	// FAQ 목록
	@GetMapping("/list")
	public void list(Model model, Criteria cri) {
		log.info("list");
		model.addAttribute("faqList", service.getList(cri));
		//model.addAttribute("faqList", service.getList2());
		int total = service.getTotal(cri);
		log.info("total count : " + total);
		model.addAttribute("pageMaker", new PageDTO(cri, total));
		
	}

	// FAQ 상세 조회 or 수정 화면
	@GetMapping({ "/read", "/modify" })
	public void get(@RequestParam("faqNo") Long faqNo, @ModelAttribute("cri") Criteria cri, Model model) {
		log.info("get or modify " + faqNo);
		model.addAttribute("faq", service.get(faqNo));
	}

	// FAQ 수정
	@PostMapping("/modify")
	public String modify(FaqVO faq, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
		log.info("modify : " + faq);
		if (service.modify(faq)) {
			rttr.addFlashAttribute("result", "success");
		}
		return "redirect:/faq/read?faqNo=" + faq.getFaqNo();
	}

	// FAQ 삭제
	@PostMapping("/remove")
	public String remove(@RequestParam("faqNo") Long faqNo, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
		log.info("remove : " + faqNo);
		if(service.remove(faqNo)) {
			rttr.addFlashAttribute("result", "success");
		}
		return "redirect:/faq/list";
	}

	// FAQ 등록 화면
	@GetMapping("/register")
	public void register() {

	}

	// FAQ 등록
	@PostMapping("/register")
	public String register(FaqVO faq, RedirectAttributes rttr) {
		log.info("register : " + faq);
		service.register(faq);
		rttr.addFlashAttribute("result", faq.getFaqNo());
		
		return "redirect:/faq/list";

	}
}
