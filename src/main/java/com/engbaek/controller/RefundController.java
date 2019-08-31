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
import com.engbaek.domain.RefundVO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/refund/*")
@AllArgsConstructor
public class RefundController {

	// 환불 내역 목록
	@GetMapping("/list")
	public void list(Model model, Criteria cri) {
		log.info("list");
	}

	// 환불 내역 등록 화면
	@GetMapping("/register")
	public void register() {

	}

	// 환불 내역 등록
	@PostMapping("/register")
	public String register(RefundVO refund, RedirectAttributes rttr) {
		return "redirect:/refund/list";

	}

	// 환불 내역 삭제
	@PostMapping("/remove")
	public String remove(@RequestParam("refundNo") Long refundNo, @ModelAttribute("cri") Criteria cri,
			RedirectAttributes rttr) {
		return "redirect:/refund/list";
	}

	// 환불 내역 상세 조회 or 수정 화면
	@GetMapping({ "/info", "/modify" })
	public void get(@RequestParam("refundNo") Long refundNo, @ModelAttribute("cri") Criteria cri, Model model) {

	}

	// 환불 내역 수정
	@PostMapping("/modify")
	public String modify(RefundVO refund, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
		return "redirect:/refund/info";
	}

}
