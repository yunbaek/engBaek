package com.engbaek.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.engbaek.domain.ClassQnaCommentVO;
import com.engbaek.domain.Criteria;


public interface ClassQnaCommentMapper {
	
	public int getCountByNo(Long classQnaNo);
	public int insert(ClassQnaCommentVO classQnaComment);
	public ClassQnaCommentVO read(Long commentNo); //댓글조회 
	public int delete(Long commentNo);
	public int update(ClassQnaCommentVO classQnaComment);
	public List<ClassQnaCommentVO> getListWithPaging(@Param("cri") Criteria cri, @Param("classQnaNo") Long classQnaNo);
	
}
