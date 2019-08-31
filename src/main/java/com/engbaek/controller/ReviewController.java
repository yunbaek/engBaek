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
import com.engbaek.domain.PageDTO;
import com.engbaek.domain.ReviewVO;
import com.engbaek.service.ReviewService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/review/*")
@AllArgsConstructor
public class ReviewController {
private ReviewService service;
	
	//수강중인 강좌 조회
	@GetMapping("/review_class_list")
	public void classList(Model model, Criteria cri) {
		log.info("reviewClassList");
		model.addAttribute("reviewClassList", service.getReviewClassList(cri));
	}
	// 후기 목록
	@GetMapping("/list")
	public void list(Model model, Criteria cri) {
		 log.info("list");
	      model.addAttribute("list", service.getList(cri));
	      int total = service.getTotal(cri);
	      log.info("total count : " + total);
	      model.addAttribute("pageMaker", new PageDTO(cri, total));
	
	}

	// 후기 상세 조회 or 수정 화면
	@GetMapping({ "/read", "/modify" })
	public void get(@RequestParam("reviewNo") Long review_bno, @ModelAttribute("cri") Criteria cri, Model model) {
		log.info("review get:"+review_bno);
		model.addAttribute("review",service.read(review_bno));
	}
	
	// 후기 수정
	@PostMapping("/modify")
	public String modify(ReviewVO review, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
		
		log.info("modify:"+review);
		if(service.modify(review)) {
			rttr.addFlashAttribute("result", "success");
		}
		return "redirect:/review/read?reviewNo="+review.getReviewNo();
	}

	@PostMapping("/remove")
	public String remove(@RequestParam("reviewNo") Long review_bno, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
		log.info("remove : " + review_bno);
	      if(service.remove(review_bno)) {
	         rttr.addFlashAttribute("result", "success");
	      }
		
		return "redirect:/review/list";
	}

	// 후기 등록 화면, 등록 화면만 출력
	@GetMapping("/register")
	public void register() {

	}

	// 후기 등록
	@PostMapping("/register")
	public String register(ReviewVO review, RedirectAttributes rttr) {
		
		  log.info("register : " + review);
	      service.register(review);
	      rttr.addFlashAttribute("result",review.getReviewNo());
		
		return "redirect:/review/list";

	}
}
