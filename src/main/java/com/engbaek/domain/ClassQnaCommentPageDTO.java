package com.engbaek.domain;

import java.util.List;

import com.engbaek.domain.ClassQnaCommentVO;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;

@Data
@AllArgsConstructor
@Getter
public class ClassQnaCommentPageDTO {
	private int replyCnt;		//전체 댓글 갯수
	private List<ClassQnaCommentVO> list;	//댓글 목록
}
