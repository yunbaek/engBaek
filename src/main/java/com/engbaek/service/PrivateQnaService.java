package com.engbaek.service;

import java.util.List;

import com.engbaek.domain.Criteria;
import com.engbaek.domain.PrivateQnaVO;

public interface PrivateQnaService {
	
	
	//1:1문의 총 게시물 수 
	public int getTotal(Criteria cri);

	//1:1문의 게시판 목록
	public List<PrivateQnaVO> getList(Criteria cri);

	//1:1문의 게시물 등록 
	public void register(PrivateQnaVO privateQna);

	//1:1문의 게시물 상세 보기 
	public PrivateQnaVO read(Long privateQna_bno);

	//1:1문의 게시물 수정
	public boolean modify(PrivateQnaVO privateQna);

	//1:1문의 게시물 삭제 
	public boolean remove(Long privateQna_bno);
}
