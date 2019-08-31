package com.engbaek.domain;

import java.util.Date;

import lombok.Data;

@Data
public class PaymentVO { //결제내역
	private long paymentNo; //결제 번호
	private long courseCode; //강좌 코드
	private String studentId; //학생 ID
	private String paymentMethod; //결제 수단
	private long paymentPrice; //결제 금액
	private String cardType; //카드종류
	private String cardNo; //카드번호
	private Date paymentDate; //결제일시
	private String paymentState; //결제 상태
	
}
