package com.engbaek.mapper;

import java.text.SimpleDateFormat;
import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.engbaek.domain.CourseJoinVO;
import com.engbaek.domain.Criteria;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class CourseMapperTests {
	
	@Setter(onMethod_ = @Autowired)
	private CourseMapper mapper;
	
	SimpleDateFormat dt = new SimpleDateFormat("yyyy-mm-dd");
	
//	@Test
//	public void testGetList() {
//		mapper.getList().forEach(course -> log.info(course));
//	}
	
	@Test
	public void testPaging() {
		Criteria cri = new Criteria();
		
		//5개씩 2페이지
		cri.setPageNum(1);
		cri.setAmount(5);
		
		List<CourseJoinVO> list = mapper.getListWithPaging(cri);
		
		list.forEach(course -> log.info(course));
	}
	
//	@Test
//	public void testInsertSelectKey() throws ParseException {
//		
//		CourseVO course = new CourseVO();
//		
//		course.setTeacherId("tc3");
//		course.setClassroomNo(403L);
//		course.setCourseName("미쳐버린 토익");
//		course.setCourseType("toeic speacking");
//		course.setCourseLevel("850");
//		course.setCourseInfo("체고의 강의");
//		course.setCourseDay("화,수");
//		course.setCourseTime("11:00 - 13:00");
//		course.setCourseStart(dt.parse("2019-10-21"));
//		course.setCourseEnd(dt.parse("2019-10-25"));
//		course.setPrice(100000L);
//		
//		mapper.insertSelectKey(course);
//		
//		log.info(course);
//	}
	
//	@Test
//	public void testDelete() {
//		log.info("DELETE COURSE : " + mapper.delete(4L));
//	}
	
//	@Test
//	public void testUpdate() throws ParseException {
//		CourseVO course = new CourseVO();
//		course.setTeacherId("tc1");
//		course.setClassroomNo(401L);
//		course.setCourseName("미쳐버린 토스");
//		course.setCourseType("toeic speacking!!");
//		course.setCourseLevel("6");
//		course.setCourseInfo("체고의 강의!!");
//		course.setCourseDay("화,수,목");
//		course.setCourseTime("13:00 - 15:00");
//		course.setCourseStart(dt.parse("2019-10-21"));
//		course.setCourseEnd(dt.parse("2019-10-25"));
//		course.setPrice(100000L);
//		
//		int count = mapper.update(course);
//		
//		log.info(count);
//
//	}
	
//	@Test
//	public void testSearch() {
//		Criteria cri = new Criteria();
//		
//		cri.setKeyword("익");
//		cri.setType("c");
//		
//		List<CourseJoinVO> list = mapper.getListWithPaging(cri);
//		
//		list.forEach(course -> log.info(course));
//	}
	
	

}
