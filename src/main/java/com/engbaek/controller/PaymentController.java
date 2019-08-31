package com.engbaek.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.engbaek.domain.Criteria;
import com.engbaek.domain.PaymentVO;
import com.engbaek.service.PaymentService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/payment/*")
@AllArgsConstructor
public class PaymentController {
	private PaymentService service;

	@GetMapping("/list")
	public void list(Model model) {
		log.info("list");
		model.addAttribute("list", service.getList());
		model.addAttribute("list2", service.getList2());
		log.info("list2");

	}

	@PostMapping("/remove")
	public String remove(@RequestParam("paymentNo") Long paymentNo, @ModelAttribute("cri") Criteria cri,
			RedirectAttributes rttr) {
		log.info("remove : " + paymentNo);
		if (service.remove(paymentNo)) {
			rttr.addFlashAttribute("result", "success");
		}

		return "redirect:/payment/list";
	}

	@PostMapping("/modify")
	public String modify(PaymentVO payment, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {

		log.info("modify:" + payment);
		if (service.modify(payment)) {
			rttr.addFlashAttribute("result", "success");
		}

		return "redirect:/payment/list";
	}

	@GetMapping("/payRegister")
	public void payRegister(Model model, HttpServletRequest request) {
		log.info("register ");
		System.out.println("67");
		String courseCode = request.getParameter("courseCode");
		model.addAttribute("courseCode", courseCode);
		String paymentPrice = request.getParameter("paymentPrice");
		model.addAttribute("paymentPrice", paymentPrice);
		String courseName = request.getParameter("courseName");
		model.addAttribute("courseName", courseName);
	}

	@PostMapping("/payRegister")
	public String payRegister(PaymentVO payment, RedirectAttributes rttr) {

		System.out.println("73");

		service.register(payment);
		rttr.addFlashAttribute("result", payment.getPaymentNo());
		return "redirect:/payment/list";

	}

}
