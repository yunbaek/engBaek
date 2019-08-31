package com.engbaek.service;

import java.util.List;

import com.engbaek.domain.Criteria;
import com.engbaek.domain.RefundVO;

public interface RefundService {

	//환불 내역 총 게시물 수 
	public int getTotal(Criteria cri);
	
	//환불 내역 목록 
	public List<RefundVO> getList(Criteria cri);
	
	//환불 내역 등록 
	public void register(RefundVO refund);
	
	//환불 내역 상세 보기 
	public RefundVO get(Long bno);
	
	//환불 내역 수정
	public boolean modify(RefundVO refund);
	
	//환불 내역  삭제 
	public boolean remove(Long review_bno);
}
