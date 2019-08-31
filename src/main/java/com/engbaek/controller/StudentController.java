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
import com.engbaek.domain.StudentVO;
import com.engbaek.service.InfoService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequestMapping("/student/*")
@AllArgsConstructor
public class StudentController {
   private InfoService service;
   
   // 학생 정보 조회 or 수정 화면
   @GetMapping({"/info", "/modify"})
   public void getInfo(@RequestParam("studentId") String studentId, Model model) {
      log.info("get info");
      model.addAttribute("student", service.getS(studentId));
   }
      
   @PostMapping("/info")
   public void postInfo(@RequestParam("studentId") String studentId, Model model) {
      log.info("post info");
      
   }
   
   // 학생 정보 수정
   @PostMapping("/modify")
   public String modify(StudentVO student, RedirectAttributes rttr) {
      return "redirect:/student/info";
   }
   
   // 학생 회원 탈퇴
   @PostMapping("/delete")
   public String remove(StudentVO student, RedirectAttributes rttr) {
      return "redirect:/";
   }
   
   // 수강중인 강의 목록
   @GetMapping("/class_list")
   public void classList(@RequestParam("student_id") Long student_id, @ModelAttribute("cri") Criteria cri, Model model) {
      
   }
}