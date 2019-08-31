package com.engbaek.mapper;

import java.util.List;

import com.engbaek.domain.Criteria;
import com.engbaek.domain.NoticeVO;

public interface NoticeMapper {
	
	//공지사항 게시글 수
	public int getTotalCount(Criteria cri);
	
	//공지사항 페이징
	public List<NoticeVO> getListWithPaging(Criteria cri);
	
	//공지사항 수정
	public int update(NoticeVO notice);
	
	//공지사항 삭제
	public int delete(Long noticeNo);
	
	//공지사항 조회
	public NoticeVO read(Long noticeNo);
	
	//공지사항 등록
	public Integer insertSelectKey(NoticeVO notice);
	
	//공지사항 등록(without notice_bno)
	//public void insert(NoticeVO course);
	
	//공지사항 목록
	public List<NoticeVO> getList();
}
