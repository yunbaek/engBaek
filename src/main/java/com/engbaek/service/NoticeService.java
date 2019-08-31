package com.engbaek.service;

import java.util.List;

import com.engbaek.domain.Criteria;
import com.engbaek.domain.NoticeVO;

public interface NoticeService {
	
	//공지사항 총 게시물 수 
	public int getTotal(Criteria cri);
	
	//공지사항 게시판 목록
	public List<NoticeVO> getList(Criteria cri);
	
	//공지사항 게시물 등록 
	public void register(NoticeVO notice);
	
	//공지사항 게시물 상세보기 
	public NoticeVO get(Long noticeNo);
	
	//공지사항 게시물 수정
	public boolean modify(NoticeVO notice);
	
	//공지사항 게시물 삭제 
	public boolean remove(Long noticeNo);
	
}
