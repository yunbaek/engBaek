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
import com.engbaek.domain.PrivateQnaReplyVO;
import com.engbaek.domain.PrivateQnaVO;
import com.engbaek.service.PrivateQnaReplyService;
import com.engbaek.service.PrivateQnaService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/privateQna/*")
@AllArgsConstructor
public class PrivateQnaController {
	
	private PrivateQnaService service;
	private PrivateQnaReplyService replyservice;
	
	// 일대일 문의
	@GetMapping("/list") 
	public void list(Model model, Criteria cri) {
		log.info("list");
		model.addAttribute("list",service.getList(cri));
		model.addAttribute("replylist",replyservice.getList());
		int total = service.getTotal(cri);
	    log.info("total count : " + total);
	    model.addAttribute("pageMaker", new PageDTO(cri, total));
		
	}

	// 일대일 문의 상세 조회 or 수정 화면
	@GetMapping({ "/read", "/modify" })
	public void get(@RequestParam("privateQnaNo") Long privateQnaNo, @ModelAttribute("cri") Criteria cri, Model model) {
		log.info("privateQna get:"+privateQnaNo);
		model.addAttribute("privateQna",service.read(privateQnaNo));
	}

	// 일대일 문의 수정
	@PostMapping("/modify")
	public String modify(PrivateQnaVO privateQna, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {

		log.info("modify:"+ privateQna);
		if(service.modify( privateQna)) {
			rttr.addFlashAttribute("result", "success");
		}
		
		return "redirect:/privateQna/read?privateQnaNo="+privateQna.getPrivateQnaNo();
	}

	// 일대일 문의 삭제
	@PostMapping("/remove")
	public String remove(@RequestParam("privateQnaNo") Long privateQnaNo, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
		log.info("remove : " + privateQnaNo);
	      if(service.remove(privateQnaNo)) {
	         rttr.addFlashAttribute("result", "success");
	      }
	      
		return "redirect:/privateQna/list";
	}

	// 일대일 문의 등록 화면
	@GetMapping("/register")
	public void register() {
		
	}
	
	// 일대일 문의 등록
	@PostMapping("/register")
	public String register(PrivateQnaVO privateQna, RedirectAttributes rttr) {
		

		  log.info("register : " + privateQna);
	      service.register(privateQna);
	      rttr.addFlashAttribute("result",privateQna.getPrivateQnaNo());
	      
		return "redirect:/privateQna/list";

	}
	
	

	@GetMapping("/replyRegister")
	public void replyRegister(@RequestParam("privateQnaNo") Long privateQnaNo, Model model) {
		log.info("registerpage");
		model.addAttribute("privateQna",service.read(privateQnaNo));
	}


	@PostMapping("/replyRegister")
	public String replyRegister1 (@RequestParam("privateQnaNo") Long privateQnaNo ,PrivateQnaReplyVO privateQnaReply, RedirectAttributes rttr) {

		  log.info("register :");
		  //privateQnaReply.setPrivateQnaNo(privateQnaNo);
		  replyservice.register(privateQnaReply);
	      rttr.addFlashAttribute("result",privateQnaReply.getPrivateQnaReplyNo());
	      
		return "redirect:/privateQna/list";
	}
	


	// 일대일 문의 답변 상세 조회 or 수정
	@GetMapping({ "/replyRead", "/replyModify" })
	public void replyRead(@RequestParam("privateQnaReplyNo") Long privateQnaReplyNo, @ModelAttribute("cri") Criteria cri, Model model) {
		log.info("privateQna get:"+privateQnaReplyNo);
		model.addAttribute("privateQnaReply",replyservice.read(privateQnaReplyNo));
	}

	// 일대일 문의 답변 수정
	@PostMapping("/replymodify")
	public String replyModify(PrivateQnaReplyVO privateQnaReply, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
		
		log.info("modify:"+ privateQnaReply);
		if(replyservice.modify(privateQnaReply)) {
			rttr.addFlashAttribute("result", "success");
		}
		
		return "redirect:/privateQna/replyRead?privateQnaReplyNo="+privateQnaReply.getPrivateQnaReplyNo();
	}
	
	// 일대일 문의 답변 삭제
	@PostMapping("/replyRemove")
	
	public String replyRemove(@RequestParam("privateQnaReplyNo") Long privateQnaReplyNo, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
		log.info("remove : " + privateQnaReplyNo);
	      if(replyservice.remove(privateQnaReplyNo)) {
	         rttr.addFlashAttribute("result", "success");
	      }
	      
		return "redirect:/privateQna/list";
	}

	
}
