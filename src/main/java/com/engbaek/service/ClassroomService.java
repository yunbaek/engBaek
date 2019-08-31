package com.engbaek.service;

import java.util.List;
import com.engbaek.domain.ClassroomVO;
import com.engbaek.domain.Criteria;

public interface ClassroomService {
	//강의실 게시판 총 게시물 수 
	public int getTotal(Criteria cri);
	//강의실 목록 조회 
	public List<ClassroomVO> getList(Long classroomNo,Criteria cri);

}
