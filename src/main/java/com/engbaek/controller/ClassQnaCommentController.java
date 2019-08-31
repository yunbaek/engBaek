package com.engbaek.controller;

import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.engbaek.domain.ClassQnaCommentVO;
import com.engbaek.domain.Criteria;
import com.engbaek.service.ClassQnaCommentService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@RequestMapping("/comments/")
@RestController
@Log4j
@AllArgsConstructor
public class ClassQnaCommentController {
	
	private ClassQnaCommentService service;
	
	//댓글등록
	@PostMapping(value = "/new",
			consumes = "application/json",
			produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> create(@RequestBody ClassQnaCommentVO classQnaComment){
			
		log.info("ClassQnaCommentVO: " + classQnaComment);
		
		int insertCount = service.register(classQnaComment);
		
		log.info("Comment INSERT COUNT: " + insertCount);
		
		return insertCount == 1
				? new ResponseEntity<>("success", HttpStatus.OK)
						: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
		
	}
	
	//특정 게시물 댓글 목록 가져오기 
	@GetMapping(value= "/pages/{classQnaNo}/{page}",
			produces  = {
				MediaType.APPLICATION_XML_VALUE,
				MediaType.APPLICATION_JSON_UTF8_VALUE
			})
	public ResponseEntity<List<ClassQnaCommentVO>> getList(
			@PathVariable("page") int page,
			@PathVariable("classQnaNo") Long classQnaNo){
		
		log.info("getList..............");
		Criteria cri = new Criteria(page,10);
		
		log.info(cri);
		return new ResponseEntity<>(service.getList(cri, classQnaNo), HttpStatus.OK);
	}
	
	//댓글 조회
	@GetMapping(value= "/{commentNo}",
			produces = { MediaType.APPLICATION_XML_VALUE,
						 MediaType.APPLICATION_JSON_UTF8_VALUE
			})
	public ResponseEntity<ClassQnaCommentVO> get(@PathVariable("commentNo") Long commentNo) {
		
		log.info("get: " + commentNo);
		
		return new ResponseEntity<>(service.get(commentNo), HttpStatus.OK);
	}
	
	//댓글 삭제
	@DeleteMapping(value="/{commentNo}", produces = {
			MediaType.TEXT_PLAIN_VALUE
	})
	public ResponseEntity<String> remove(@PathVariable("commentNo") Long commentNo){
		log.info("remove: " + commentNo);
		
		return service.remove(commentNo)==1
				? new ResponseEntity<>("success", HttpStatus.OK)
						: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	//댓글 수정
	@RequestMapping(method= {RequestMethod.PUT, RequestMethod.PATCH},
			value = "/{commentNo}",
			consumes = "application/json",
			produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> modify(
			@RequestBody ClassQnaCommentVO classQnaComment,
			@PathVariable("commentNo") Long commentNo){
		
		classQnaComment.setCommentNo(commentNo);
		log.info("commentNo: " + commentNo);
		
		log.info("modify: " + classQnaComment);
		
		return service.modify(classQnaComment) == 1 
				? new ResponseEntity<>("success", HttpStatus.OK)
						: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	
	
	
}
