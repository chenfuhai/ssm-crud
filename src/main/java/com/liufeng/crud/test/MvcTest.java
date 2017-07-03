package com.liufeng.crud.test;

import java.util.List;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mock.web.MockHttpServletRequest;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.MvcResult;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import com.github.pagehelper.PageInfo;
import com.liufeng.crud.bean.Employee;

/**
 * 使用Sprring测试模块提供的测试请求功能，测试crud请求的正确性 单元测试
 * Spring单元测试 需要用到这种标签 RunWith等。。。
 * Spring4 测试的时候需要servlet3.0的支持
 *  @ WebAppConfiguration 本来ioc容器里面的东西可以autowired 现在写这个标签 ioc容器可以autowired 
 * @author fuhai
 *
 */
@WebAppConfiguration
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations= {"classpath:applicationContext.xml","file:src/main/webapp/WEB-INF/dispatcherServlet-servlet.xml"})

public class MvcTest {
	//传入SpringMVC的ioc
	@Autowired
	WebApplicationContext context;
	//虚拟mvc
	MockMvc mockMvc;
	
	@Before
	public void initMokMvc() {
		
		mockMvc =MockMvcBuilders.webAppContextSetup(context).build();
	}
	@Test
	public void testPage() throws Exception {
		//模拟请求拿到返回值
		MvcResult result = mockMvc.perform(MockMvcRequestBuilders.get("/emps").param("pn", "150")).andReturn();
		//请求成功以后 在请求域中会有pageInfo 取出进行验证
		
		MockHttpServletRequest request = result.getRequest();
		PageInfo pi = (PageInfo) request.getAttribute("pageInfo");
		System.out.println("当前页码："+pi.getPageNum());
		System.out.println("总页码："+pi.getPages());
		System.out.println("总记录数："+pi.getTotal());
		int[] nums = pi.getNavigatepageNums();
		for(int i:nums) {
			System.out.println(""+i);
		}
		
		//获取员工数据
		
		List<Employee> list = pi.getList();
		for (Employee employee : list) {
			System.out.println(employee.toString());
		}
		
	}
}
