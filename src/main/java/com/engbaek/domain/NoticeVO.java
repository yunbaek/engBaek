package com.engbaek.domain;

import java.util.Date;

import lombok.Data;

@Data
public class NoticeVO { //공지사항 

	private long noticeNo; //공지사항번호
	private String adminId; //관리자ID
	private String noticeTitle; //공지사항 제목
	private String noticeContent; //공지사항 내용
	private Date noticeRegdate; //공지사항 작성일
	
}
