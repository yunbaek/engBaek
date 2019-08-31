package com.engbaek.mapper;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.engbaek.domain.Criteria;
import com.engbaek.domain.FaqVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class FaqMapperTests {
	
	@Setter(onMethod_ = @Autowired)
	private FaqMapper mapper;
	
	@Test
	public void testGetList() {
		mapper.getList().forEach(faq -> log.info(faq));
	}
	
//	@Test
//	public void testInsertSelectKey() {
//		FaqVO faq = new FaqVO();
//		faq.setfaqTitle("faq TEST");
//		faq.setAdminId("admin1");
//		faq.setfaqContent("test contents");
//		
//		mapper.insertSelectKey(faq);
//		
//		log.info(faq);
//	}
//	
//	@Test
//	public void testRead() {
//		//존재하는 게시물 번호로 테스트
//		FaqVO faq = mapper.read(1L);
//		
//		log.info(faq);
//	}
//	
//	@Test
//	public void testDelete() {
//		log.info("DELETE COUNT : " + mapper.delete(3L));
//	}
	
//	@Test 
//	public void testUpdate() {
//		FaqVO faq = new FaqVO();
//		//실행 전 존재하는 번호인지 확인
//		faq.setfaqNo(7L);
//		faq.setfaqTitle("modified title");
//		faq.setfaqContent("modified contents");
//		
//		int count = mapper.update(faq);
//		
//		log.info(count);
//	}
	
	@Test
	public void testPaging() {
		Criteria cri = new Criteria();
		
		//5개씩 2페이지
		cri.setPageNum(1);
		cri.setAmount(5);
		
		List<FaqVO> list = mapper.getListWithPaging(cri);
		
		list.forEach(faq -> log.info(faq));
	}
	
//	@Test
//	public void testSearch() {
//		Criteria cri = new Criteria();
//		
//		cri.setKeyword("modified");
//		cri.setType("TWC");
//		
//		List<FaqVO> list = mapper.getListWithPaging(cri);
//		
//		list.forEach(faq -> log.info(faq));
//	}

}
