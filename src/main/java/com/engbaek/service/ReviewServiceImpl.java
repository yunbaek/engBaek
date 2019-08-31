package com.engbaek.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.engbaek.domain.CourseHistoryJoinVO;
import com.engbaek.domain.Criteria;
import com.engbaek.domain.ReviewJoinVO;
import com.engbaek.domain.ReviewVO;
import com.engbaek.mapper.ReviewMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class ReviewServiceImpl implements ReviewService {
	
	@Setter(onMethod_ = @Autowired)
	private ReviewMapper mapper;
	// 수강 후기 게시물 개수
	@Override
	public int getTotal(Criteria cri) {
		log.info("getTotal");
		return mapper.getTotalCount(cri);
	}
	
	// 수강 후기 목록
	@Override
	public List<ReviewVO> getList(Criteria cri) {
		log.info("getList with criteria : " + cri);
		return mapper.getListWithPaging(cri);
	}
	
	// 수강 후기 등록
	@Override
	public void register(ReviewVO review) {
		log.info("register : " + review);
		mapper.insertSelectKey(review);
	}

	// 수강 후기 조회
	@Override
	public ReviewJoinVO read(Long reviewNo) {
		return mapper.read(reviewNo);
	}

	// 수강 후기 수정
	@Override
	public boolean modify(ReviewVO review) {
		log.info("modify : " + review);
		boolean modifyResult = mapper.update(review) == 1;
		return modifyResult;
	}

	// 수강 후기 삭제
	@Override
	public boolean remove(Long reviewNo) {
		log.info("remove : " + reviewNo);
		boolean removeResult = mapper.delete(reviewNo) == 1;
		return removeResult;
	}

	//수강후기 강의
	@Override
	public List<ReviewJoinVO> getReviewClassList(Criteria cri) {
		log.info("get Review Class List");
		return mapper.getReviewClassList();
	}
	

	@Override
	public List<CourseHistoryJoinVO> andCourse() {
		log.info("getList end List :");
	      return mapper.andCourse();
	}

}
