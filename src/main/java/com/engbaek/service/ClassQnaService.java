package com.engbaek.service;

import java.util.List;

import com.engbaek.domain.ClassQnaVO;
import com.engbaek.domain.Criteria;

public interface ClassQnaService {
	
	//강의별 Q&A 총 게시물 수 
	public int getTotal(Criteria cri);
	//강의별 Q&A 목록 
	public List<ClassQnaVO> getList(Long courseCode, Criteria cri);
	//강의별 Q&A 등록 
	public void register(ClassQnaVO classQna);
	//강의별 Q&A 상세조회 
	public ClassQnaVO get(Long classQnaNo);
	//강의별 Q&A 수정 
	public boolean modify(ClassQnaVO classQna);
	//강의별 Q&A 삭제 
	public boolean remove(Long classQnaNo);
	
	//강의중인 강좌 목록
	public List<ClassQnaVO> getQnaClassList(Criteria cri);
}
