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
import com.engbaek.domain.RefundInfoVO;

import lombok.AllArgsConstructor;

@Controller
@RequestMapping("/refundInfo/*")
@AllArgsConstructor
public class RefundInfoController {
   @GetMapping({ "/refundInfo" })
   public void refundInfo() {

   }
   
   // 환불 규정 상세 조회 or 수정 화면
   @GetMapping({ "/read", "/modify" })
   public void get(@RequestParam("RefundInfoNo") Long RefundInfoNo, @ModelAttribute("cri") Criteria cri, Model model) {

   }

   // 환불 규정 상세 수정
   @PostMapping("/modify")
   public String modify(RefundInfoVO refundInfo, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
      return "redirect:/refund_info/read";
   }
}