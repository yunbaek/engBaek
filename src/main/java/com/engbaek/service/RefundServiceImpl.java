package com.engbaek.service;

import java.util.List;

import com.engbaek.domain.Criteria;
import com.engbaek.domain.RefundVO;

public class RefundServiceImpl implements RefundService{

	//환불 내역 총 게시물 수 
	@Override
	public int getTotal(Criteria cri) {
		return 0;
	}

	//환불 내역 목록 
	@Override
	public List<RefundVO> getList(Criteria cri) {
		return null;
	}

	//환불 내역 등록 
	@Override
	public void register(RefundVO refund) {
		
	}

	//환불 내역 상세 보기 
	@Override
	public RefundVO get(Long bno) {
		return null;
	}

	//환불 내역 수정
	@Override
	public boolean modify(RefundVO refund) {
		return false;
	}
	

	//환불 내역  삭제 
	@Override
	public boolean remove(Long review_bno) {
		return false;
	}

}
