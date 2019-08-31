package com.engbaek.service;

import java.util.List;

import com.engbaek.domain.ClassQnaCommentPageDTO;
import com.engbaek.domain.ClassQnaCommentVO;
import com.engbaek.domain.Criteria;

public interface ClassQnaCommentService {

	// 댓글 개수
	public ClassQnaCommentPageDTO getListPage(Criteria cri, Long ClassQnaNo);

	// 댓글 수정
	public int modify(ClassQnaCommentVO classQnaComment);

	// 댓글 조회
	public ClassQnaCommentVO get(Long commentNo);

	// 댓글 삭제
	public int remove(Long commentNo);

	// 댓글 등록
	public int register(ClassQnaCommentVO classQnaComment);

	// 댓글 목록
	public List<ClassQnaCommentVO> getList(Criteria cri, Long classQnaNo);
}
