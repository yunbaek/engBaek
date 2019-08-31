package com.engbaek.service;

import java.util.List;

import com.engbaek.domain.Criteria;
import com.engbaek.domain.FaqVO;

public interface FaqService {
	//notice 게시판 총 게시물 수 
	public int getTotal(Criteria cri);
	
	//notice 게시판 목록
	public List<FaqVO> getList(Criteria cri);
	
	//notice 게시판 목록
	public List<FaqVO> getList2();
	
	//notice 게시물 등록 
	public void register(FaqVO faq);
	
	//notice 게시물 상세 보기 
	public FaqVO get(Long faqNo);
	
	//notice 게시물 수정 
	public boolean modify(FaqVO faq);
	
	//notice 게시물 삭제 
	public boolean remove(Long faqNo);

}
