package com.engbaek.mapper;

import java.util.List;

import com.engbaek.domain.CourseAttachVO;
import com.engbaek.domain.CourseJoinVO;
import com.engbaek.domain.CourseVO;
import com.engbaek.domain.Criteria;

public interface CourseMapper {
	
	//강좌 소개 게시글 수
	public int getTotalCount(Criteria cri);
	
	//강좌 소개 목록 with 페이징
	public List<CourseJoinVO> getListWithPaging(Criteria cri);
	
	//강좌 소개 수정
	public int update(CourseVO course);
	
	//강좌 소개 삭제
	public int delete(Long courseCode);
	
	//강좌 소개 조회
	public CourseJoinVO read(Long courseCode);
	
	//
	public Integer insertSelectKey(CourseVO course);
	//public void insert(CourseVO course);
	
	public List<CourseJoinVO> getList();
	
	public int idCheck(String teacherId);
	
	public List<CourseAttachVO> findByCourseCode(Long courseCode);
	
}
