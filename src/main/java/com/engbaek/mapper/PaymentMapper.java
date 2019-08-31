package com.engbaek.mapper;

import java.util.List;

import com.engbaek.domain.PaymentVO;

public interface PaymentMapper {


	//결제내역 총 게시물 수  
	//public int getTotalCount(Criteria cri);
	
	//결제내역 게시판 페이징 
	//public List<PaymentVO> getListWithPaging(Criteria cri);
	
	//결제 내역 조회 (취소 불가능)
	
		public List<PaymentVO>getList();
		
	//결제 내역 조회 (취소 가능)
	
	public List<PaymentVO>getList2();
	//결제내역 수정 
	public int update(PaymentVO paymentNo);
		
	//결제내역 삭제 
	public int delete(Long paymentNo);
	
	//결제내역 읽기 
	public PaymentVO read(Long paymentNo);
	
	//게시물 번호 사용자에게 보이게 하기 
	public Integer insertSelectKey(PaymentVO payment);
}
