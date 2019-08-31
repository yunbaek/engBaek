package com.engbaek.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.engbaek.domain.AdminVO;
import com.engbaek.domain.Criteria;
import com.engbaek.domain.TeacherVO;
import com.engbaek.service.InfoService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/admin/*")
@Log4j
@AllArgsConstructor
public class AdminController {
   private InfoService service;
   
   // 학생 정보 조회 or 수정 화면
   @GetMapping({"/info", "/modify"})
   public void getInfo(@RequestParam("adminId") String adminId, Model model) {
      log.info("get info");
      model.addAttribute("admin", service.getA(adminId));
   }
   
   //관리자 정보 수정
   @PostMapping("/modify")
   public String modify(AdminVO admin, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
      return "redirect:/admin/info";
   }
   
   //학생 목록
   @GetMapping("/stu_list")
   public void stuList(Model model, Criteria cri) {
      log.info("list");
   }
   
   //강사 목록
   @GetMapping("/tea_list")
   public void teadList(Model model, Criteria cri) {
      log.info("list");
   }
   
   //강사 권한 변경
   @PostMapping("/tea_auth")
   public String modify(TeacherVO teacher, RedirectAttributes rttr) {
      return "redirect:/admin/tea_auth";
   }
}