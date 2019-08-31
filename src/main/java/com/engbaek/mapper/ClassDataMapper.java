package com.engbaek.mapper;

import java.util.List;

import com.engbaek.domain.ClassDataVO;
import com.engbaek.domain.Criteria;

public interface ClassDataMapper {

		public List<ClassDataVO> getList(Long courseCode);
		//수업자료&공지 총 게시물 수  
		public int getTotalCount(Criteria cri);
		
		//수업자료&공지 게시판 페이징 
		public List<ClassDataVO> getListWithPaging(Criteria cri);
		
		//수업자료&공지 수정 
		public int update(ClassDataVO classData);
		
		//수업자료&공지 삭제 
		public int delete(Long classDataNo);
		
		//수업자료&공지 읽기 
		public ClassDataVO read(Long classDataNo);
		
		//게시물 번호 사용자에게 보이게 하기 
		public Integer insertSelectKey(ClassDataVO classData);
		
		//강의중인 강좌목록
		public List<ClassDataVO> getClassList();
}
