package com.engbaek.service;

import java.util.List;

import com.engbaek.domain.PaymentVO;

public interface PaymentService {

	// 수강 취소 가능한 결제 내역 목록
	public List<PaymentVO> getList();

	// 수강 취소 불가능 결제 내역 목록
	public List<PaymentVO> getList2();

	// 결제 내역 게시물 등록
	public void register(PaymentVO payment);

	// 결제 내역 게시물 상세 보기
	public PaymentVO read(Long paymentNo);

	public boolean modify(PaymentVO paymentNo);

	// 결제 내역 게시물 삭제
	public boolean remove(Long paymentNo);
}