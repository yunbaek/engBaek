package com.engbaek.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class NoticeMapperTests {
	
	@Setter(onMethod_ = @Autowired)
	private NoticeMapper mapper;
	
//	@Test
//	public void testGetList() {
//		mapper.getList().forEach(notice -> log.info(notice));
//	}
	
//	
//	@Test
//	public void testInsertSelectKey() {
//		NoticeVO notice = new NoticeVO();
//		notice.setNoticeTitle("Notice Test");
//		notice.setAdminId("admin1");
//		notice.setNoticeContent("notice test contents");
//		
//		mapper.insertSelectKey(notice);
//		
//		log.info(notice);
//	}
//	
//	@Test
//	public void testRead() {
//		NoticeVO notice = mapper.read(4L);
//		
//		log.info(notice);
//	}
	
	@Test
	public void testDelete() {
		log.info("delete " + mapper.delete(15L));
	}
	
//	@Test 
//	public void testUpdate() {
//		NoticeVO notice = new NoticeVO();
//		//실행 전 존재하는 번호인지 확인
//		notice.setNoticeNo(3L);
//		notice.setNoticeTitle("modified notice title");
//		notice.setNoticeContent("modified notice content");
//		
//		int count = mapper.update(notice);
//		
//		log.info(count);
//	}
	
//	@Test
//	public void testPaging() {
//		Criteria cri = new Criteria();
//		
//		//5개씩 2페이지
//		cri.setPageNum(1);
//		cri.setAmount(5);
//		
//		List<NoticeVO> list = mapper.getListWithPaging(cri);
//		
//		list.forEach(notice -> log.info(notice));
//	}
	
//	@Test
//	public void testSearch() {
//		Criteria cri = new Criteria();
//		
//		cri.setKeyword("modified");
//		cri.setType("TWC");
//		
//		List<NoticeVO> list = mapper.getListWithPaging(cri);
//		
//		list.forEach(notice -> log.info(notice));
//	}

}
