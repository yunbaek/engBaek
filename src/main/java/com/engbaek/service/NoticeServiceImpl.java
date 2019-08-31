package com.engbaek.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.engbaek.domain.Criteria;
import com.engbaek.domain.NoticeVO;
import com.engbaek.mapper.NoticeMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class NoticeServiceImpl implements NoticeService {
	
	@Setter(onMethod_ = @Autowired)
	private NoticeMapper mapper;

	//공지사항 총 게시물 수 
	@Override
	public int getTotal(Criteria cri) {
		log.info("get total count");
		return mapper.getTotalCount(cri);
	}

	//공지사항 게시판 목록
	@Override
	public List<NoticeVO> getList(Criteria cri) {
		log.info("getList with criteria : " + cri);
		return mapper.getListWithPaging(cri);
	}
	
	//공지사항 게시물 상세보기 
	@Override
	public NoticeVO get(Long noticeNo) {
		log.info("get : " + noticeNo);
		return mapper.read(noticeNo);
	}
	
	//공지사항 게시물 등록 
	@Override
	public void register(NoticeVO notice) {
		log.info("register : " + notice);
		mapper.insertSelectKey(notice);
	}

	//공지사항 게시물 수정
	@Override
	public boolean modify(NoticeVO notice) {
		log.info("modify : " + notice);
		boolean modifyResult = mapper.update(notice) == 1;
		return modifyResult;
	}

	//공지사항 게시물 삭제 
	@Override
	public boolean remove(Long noticeNo) {
		log.info("remove : " + noticeNo);
		boolean removeResult = mapper.delete(noticeNo) == 1;
		return removeResult;
	}

}
