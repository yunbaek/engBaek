package com.engbaek.domain;

import com.engbaek.domain.Criteria;

import lombok.Getter;
import lombok.ToString;

@Getter
@ToString
public class PageDTO {

	private int startPage; // 시작 페이지 번호
	private int endPage; // 끝 페이지 번호
	private boolean prev, next; // 이전, 이후
	private int total; // 전체 데이터 개수
	private Criteria cri; // 페이지 번호, 한 페이지 당 데이터 출력 개수

	public PageDTO(Criteria cri, int total) {
		this.cri = cri;
		this.total = total;

		// 끝 페이지 계산 - 한 화면에 10개씩 페이지 번호를 출력한다고 가정
		this.endPage = (int) (Math.ceil(cri.getPageNum() / 5.0)) * 5;

		// 시작 페이지 계산
		this.startPage = this.endPage - 4;

		// 전체 데이터 수를 반영한 실제 끝 페이지 계산
		int realEnd = (int) (Math.ceil((total * 1.0) / cri.getAmount()));

		// 끝 페이지가 실제 페이지보다 큰 경우
		if (realEnd <= this.endPage) {
			this.endPage = realEnd;
		}

		// 이전 페이지
		this.prev = this.startPage > 1;

		// 다음 페이지
		this.next = this.endPage < realEnd;
	}
}
