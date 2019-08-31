package com.engbaek.domain;

import lombok.Data;

@Data
public class RefundInfoVO { //환불규정
	
	private long RefundInfoNo; //게시글 번호
	private String adminId; //관리자ID
	private String refundInfoContent; //환불규정 내용 
	
}
