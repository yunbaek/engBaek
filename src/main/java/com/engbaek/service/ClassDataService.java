package com.engbaek.service;

import java.util.List;

import com.engbaek.domain.ClassDataAttachVO;
import com.engbaek.domain.ClassDataVO;
import com.engbaek.domain.Criteria;

public interface ClassDataService {
	
	   //수업자료&공지  총 게시물 수 
	   public int getTotal(Criteria cri);
	   
	   //수업자료&공지 게시판 목록
	   public List<ClassDataVO> getList(Long courseCode, Criteria cri);
	   
	   //강의중인 강좌 목록
	   public List<ClassDataVO> getClassList(Criteria cri);
	   
	   //수업자료&공지 게시물 등록 
	   public void register(ClassDataVO classData);
	   
	   //수업자료&공지 게시물 상세 정보 
	   public ClassDataVO get(Long classDataNo);
	   
	   //수업자료&공지 게시물 수정
	   public boolean modify(ClassDataVO classData);
	   
	   //수업자료&공지 게시물 삭제
	   public boolean remove(Long classDataNo);
	   
	   //수업자료&공지 첨부파일 목록 
	   public List<ClassDataAttachVO> getAttachList(Long classDataNo);
}
