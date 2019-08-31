package com.engbaek.controller;

import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.engbaek.domain.CourseAttachVO;
import com.engbaek.domain.CourseVO;
import com.engbaek.domain.Criteria;
import com.engbaek.domain.PageDTO;
import com.engbaek.service.CourseService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/course/*")
@AllArgsConstructor
public class CourseController {

	private CourseService service;

	// 강좌소개 목록
	@GetMapping("/list")
	public void list(Model model, Criteria cri) {
		log.info("list");
		//cri = new Criteria(pageNum, 9);	//9개씩 출력
		log.info(cri);
		model.addAttribute("courseList", service.getList(cri));
		int total = service.getTotal(cri);
		log.info("total count : " + total);
		model.addAttribute("pageMaker", new PageDTO(cri, total));
	}

	// 강좌소개 등록 화면
	@GetMapping("/register")
	public void register() {

	}

	// 강좌소개 등록
	@PostMapping("/register")
	public String register(CourseVO course, RedirectAttributes rttr) {
		log.info("register : " + course);
		
		log.info("=============================");
		if(course.getAttachList() != null) {
		   course.getAttachList().forEach(attach -> log.info(attach));
		}
		log.info("=============================");
		
		service.register(course);
		rttr.addFlashAttribute("result", course.getCourseCode());

		return "redirect:/course/list";

	}

	// 강좌소개 상세 조회 or 수정 화면
	@GetMapping({ "/info", "/modify" })
	public void get(@RequestParam("courseCode") Long courseCode, @ModelAttribute("cri") Criteria cri, Model model) {
		log.info("get or modify : " + courseCode);
		model.addAttribute("course", service.get(courseCode));
	}

	// 강좌소개 수정
	@PostMapping("/modify")
	public String modify(CourseVO course, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
		log.info("modify : " + course);
		
		if (service.modify(course)) {
			rttr.addFlashAttribute("result", "success");
		}
		return "redirect:/course/info?courseCode=" + course.getCourseCode();
	}

	// 강좌소개 삭제
	@PostMapping("/remove")
	public String remove(@RequestParam("courseCode") Long courseCode, @ModelAttribute("cri") Criteria cri,
			RedirectAttributes rttr) {
		log.info("delete : " + courseCode);
		
		List<CourseAttachVO> attachList = service.getAttachList(courseCode);
		
		if (service.remove(courseCode)) {
			deleteFiles(attachList);
			rttr.addFlashAttribute("result", "success");
		}
		return "redirect:/course/list" + cri.getListLink();
	}

	// 회원 확인
	@ResponseBody
	@RequestMapping(value = "/idCheck", method = RequestMethod.POST)
	public int postIdCheck(HttpServletRequest req) throws Exception {
		log.info("post idCheck");

		String teacherId = req.getParameter("teacherId");
		int idCheck = service.idCheck(teacherId);

		int result = 0;

		if (idCheck == 1) {
			result = 1;
		}

		log.info(result);

		return result;

	}

	// 첨부파일 출력
	@GetMapping(value = "/getAttachList", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public ResponseEntity<List<CourseAttachVO>> getAttachList(Long courseCode) {
		log.info("getAttachList : " + courseCode);

		return new ResponseEntity<>(service.getAttachList(courseCode), HttpStatus.OK);
	}

	// 파일 삭제 처리
	private void deleteFiles(List<CourseAttachVO> attachList) {
		if (attachList == null || attachList.size() == 0) {
			return;
		}

		log.info("delete attach files.............");
		log.info(attachList);

		attachList.forEach(attach -> {
			try {
				Path file = Paths.get(
						"/Uesrs/bky/upload/" + attach.getUploadPath() + "\\" + attach.getCoursePictureUuid() + "_" + attach.getCoursePictureName());
				Files.deleteIfExists(file);

				if (Files.probeContentType(file).startsWith("image")) {
					Path thumbNail = Paths.get("/Uesrs/bky/upload/" + attach.getUploadPath() + "\\s_" + attach.getCoursePictureUuid() + "_"
							+ attach.getCoursePictureName());

					Files.delete(thumbNail);
				}
			} catch (Exception e) {
				e.printStackTrace();
			} // END catch

		});// END forEach

	}
}
