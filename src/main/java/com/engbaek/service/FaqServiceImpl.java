
package com.engbaek.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.engbaek.domain.Criteria;
import com.engbaek.domain.FaqVO;
import com.engbaek.mapper.FaqMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class FaqServiceImpl implements FaqService {

	@Setter(onMethod_ = @Autowired)
	private FaqMapper mapper;

	// notice 게시판 총 게시물 수
	@Override
	public int getTotal(Criteria cri) {
		log.info("get total count");
		return mapper.getTotalCount(cri);
	}

	// notice 게시판 목록
	@Override
	public List<FaqVO> getList(Criteria cri) {
		log.info("getList with criteria : " + cri);
		return mapper.getListWithPaging(cri);
	}

	// notice 게시물 상세 보기
	@Override
	public FaqVO get(Long faqNo) {
		return mapper.read(faqNo);
	}

	// notice 게시물 등록
	@Override
	public void register(FaqVO faq) {
		log.info("register : " + faq);
		mapper.insertSelectKey(faq);
	}

	// notice 게시물 수정
	@Override
	public boolean modify(FaqVO faq) {
		log.info("modify : " + faq);
		boolean modifyResult = mapper.update(faq) == 1;
		return modifyResult;
	}

	// notice 게시물 삭제
	@Override
	public boolean remove(Long faqNo) {
		log.info("remove : " + faqNo);
		boolean removeResult = mapper.delete(faqNo) == 1;
		return removeResult;
	}

	@Override
	public List<FaqVO> getList2() {
		log.info("getList with criteria : ");
		return mapper.getList();
	}

}
