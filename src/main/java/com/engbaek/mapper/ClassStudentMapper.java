package com.engbaek.mapper;

import java.util.List;

import com.engbaek.domain.ClassStudentVO;

public interface ClassStudentMapper {
	
	public List<ClassStudentVO> getStudentClassList();
	
	public List<ClassStudentVO> getStudentList(Long courseCode);
}
