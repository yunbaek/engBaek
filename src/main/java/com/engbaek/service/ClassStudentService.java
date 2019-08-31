package com.engbaek.service;

import java.util.List;

import com.engbaek.domain.ClassStudentVO;
import com.engbaek.domain.Criteria;

public interface ClassStudentService {
	
	//강의중인 강좌 목록
	public List<ClassStudentVO> getStudentClassList(Criteria cri);
	
	//학생명단 목록
	public List<ClassStudentVO> getStudentList(Long courseCode, Criteria cri);
}
