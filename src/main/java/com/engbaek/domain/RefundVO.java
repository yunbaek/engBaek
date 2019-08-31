package com.engbaek.domain;

import java.util.Date;

import lombok.Data;

@Data
public class RefundVO {//환불내역
	
	private long refundNo; //환불번호
	private long paymentNo; //결제번호
	private long refundPrice; //환불금액
	private long courseCode; //강좌코드
	private Date refundDate; //환불일시
	private String studentId; //학생ID
	
}
