package com.engbaek.service;

import com.engbaek.domain.RefundInfoVO;

public interface RefundInfoService {

	//환불 규정 조회 
	public RefundInfoVO get(Long bno);
	//환불 규정 등록 
	public int register(RefundInfoVO refundInfo);
	//환불 규정 수정 
	public int modify(RefundInfoVO refundInfo);
}
