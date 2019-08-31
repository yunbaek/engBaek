package com.engbaek.mapper;

import java.util.List;

import com.engbaek.domain.Criteria;
import com.engbaek.domain.FaqVO;

public interface FaqMapper {
	
	// notice 총 게시물 수
	public int getTotalCount(Criteria cri);

	// notice 게시판 페이징
	public List<FaqVO> getListWithPaging(Criteria cri);

	public List<FaqVO> getList();

	// notice 수정
	public int update(FaqVO faq);

	// notice 삭제
	public int delete(Long faqNo);

	// notice 읽기
	public FaqVO read(Long faqNo);

	// 게시물 번호 사용자에게 보이게 하기
	public Integer insertSelectKey(FaqVO faq);

}
