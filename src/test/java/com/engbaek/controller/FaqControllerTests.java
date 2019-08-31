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

//Test for Controller
@WebAppConfiguration

@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/root-context.xml",
					   "file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"})
@Log4j
public class FaqControllerTests {
	@Setter(onMethod_ = @Autowired)
	private WebApplicationContext ctx;
	
	//가짜 mvc
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
//								.get("/faq/list"))
//								.andReturn()
//								.getModelAndView()
//								.getModelMap());
//		
//	}
	
//	@Test 
//	public void testRegister() throws Exception {
//		String resultPage = mockMvc.perform(MockMvcRequestBuilders.post("/faq/register")
//											.param("faqTitle", "테스트 새 공지사항 제목")
//											.param("faqContent", "테스트 새 공지사항 내용")
//											.param("adminId", "admin1"))
//									        .andReturn().getModelAndView().getViewName();
//		
//		log.info(resultPage);
//	}
	
//	@Test
//	public void testGet() throws Exception {
//		log.info(mockMvc.perform(MockMvcRequestBuilders
//				.get("/faq/read")
//				.param("faqNo", "10"))
//				.andReturn()
//				.getModelAndView().getModelMap());
//	}
	
//	@Test
//	public void testModify() throws Exception {
//		String resultPage = mockMvc.perform(MockMvcRequestBuilders.post("/faq/modify")
//											.param("faqNo", "34")
//											.param("faqTitle", "modified title")
//											.param("faqContent", "modified content")
//											.param("adminId", "admin1"))
//											.andReturn().getModelAndView().getViewName();
//		log.info(resultPage);
//	}
	
//	@Test 
//	public void testRemove() throws Exception {
//		String resultPage = mockMvc.perform(MockMvcRequestBuilders.post("/faq/remove")
//							.param("faqNo", "20"))
//							.andReturn().getModelAndView().getViewName();
//		log.info(resultPage);
//	}
	
	@Test
	public void testListPaging() throws Exception {
		log.info(mockMvc.perform(MockMvcRequestBuilders.get("/faq/list")
				.param("pageNum", "3")
				.param("amount", "5"))
				.andReturn().getModelAndView().getModelMap());
	}

}
