package com.engbaek.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.engbaek.service.InfoService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/teacher/*")
@Log4j
@AllArgsConstructor
public class TeacherController {
   private InfoService service;
   
   // 강사 정보 조회 or 수정 화면
   @GetMapping({"/info", "/modify"})
   public void get(@RequestParam("teacherId") String teacherId, Model model) {
      log.info("get info");
      model.addAttribute("teacher", service.getT(teacherId));
   }

}