package com.engbaek.mapper;

import java.util.List;

import com.engbaek.domain.Criteria;
import com.engbaek.domain.RefundVO;

public interface RefundMapper {
	
	// 환불내역 게시글 수
	public int getTotalCount(Criteria cri);

	// 환불내역 페이징
	public List<RefundVO> getListWithPaging(Criteria cri);

	// 환불내역 수정
	public int update(RefundVO course);

	// 환불내역 삭제
	public int delete(Long refund_bno);

	// 환불내역 조회
	public RefundVO read(Long refund_bno);

	// 환불내역 등록
	public Integer insertSelectKey(RefundVO course);

	// 환불내역 등록(without notice_bno)
	// public void insert(NoticeVO course);

	// 환불내역 목록
	public List<RefundVO> getList();
}
