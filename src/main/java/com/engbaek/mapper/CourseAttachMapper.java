package com.engbaek.mapper;

import java.util.List;

import com.engbaek.domain.CourseAttachVO;

public interface CourseAttachMapper {
	public void insert(CourseAttachVO courseAttach);
	public void delete(Long courseCode);
	public List<CourseAttachVO> findByCourseCode(Long courseCode);
	public void deleteAll(Long courseCode);
	public List<CourseAttachVO> getOldFIles();
}
