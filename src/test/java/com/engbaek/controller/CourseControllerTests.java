package com.engbaek.controller;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/root-context.xml",
"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"})
@Log4j
public class CourseControllerTests {

	@Setter(onMethod_ = @Autowired)
	private WebApplicationContext ctx;
	
	private MockMvc mockMvc;
	
	@Before
	public void setup() {
		this.mockMvc = MockMvcBuilders.webAppContextSetup(ctx).build();
	}
	
//	@Test
//	public void testList() throws Exception {
//		
//		log.info(
//				mockMvc.perform(MockMvcRequestBuilders
//								.get("/course/list"))
//								.andReturn()
//								.getModelAndView()
//								.getModelMap());
//	}
	
//	@Test
//	public void testRemove() throws Exception {
//		String resultPage = mockMvc.perform(MockMvcRequestBuilders.post("/course/remove")
//								   .param("courseCode", "14"))
//								   .andReturn().getModelAndView().getViewName();
//		
//		log.info(resultPage);
//	}
	
//	@Test
//	public void testRegister() throws Exception {
//		String resultPage = mockMvc.perform(MockMvcRequestBuilders.post("/course/register")
//											.param("teacherId", "tc3")
//											.param("classroomNo", "403")
//											.param("courseName", "hoho")
//											.param("courseType", "토익")
//											.param("courseLevel", "700")
//											.param("courseInfo", "haha")
//											.param("courseDay", "월,수")
//											.param("courseTime", "11:00-13:00")
//											.param("courseStart", "19-08-11")
//											.param("courseEnd", "19-08-30")
//											.param("price", "100000"))
//											.andReturn().getModelAndView().getViewName();
//		log.info(resultPage);
//		
//	}
	
//	@Test
//	public void testGet() throws Exception {
//		log.info(mockMvc.perform(MockMvcRequestBuilders
//								 .get("/profile/info")
//								 .param("teacherPno", "1"))
//								 .andReturn()
//								 .getModelAndView().getModelMap());
//	}
	
	@Test
	public void testModify() throws Exception {
		String resultPage = mockMvc.perform(MockMvcRequestBuilders.post("/course/modify")
											.param("courseCode", "2")
											.param("teacherId", "tc1")
											.param("classroomNo", "401")
											.param("courseName", "하하토익")
											.param("courseType", "토익")
											.param("courseLevel", "550")
											.param("courseInfo", "hahahahaha")
											.param("courseDay", "월,화,수")
											.param("courseTime", "11:00 - 13:00")
											.param("courseStart", "19-08-12")
											.param("courseEnd", "19-08-16")
											.param("price", "100000"))
											.andReturn().getModelAndView().getViewName();
		
		log.info(resultPage);
	}
	
//	@Test
//	public void testListPaging() throws Exception {
//		log.info(mockMvc.perform(MockMvcRequestBuilders.get("/course/list")
//				 .param("pageNum", "1")
//				 .param("amount", "3"))
//				 .andReturn().getModelAndView().getModelMap());
//	}

}
