package com.liufeng.crud.test;

import java.util.UUID;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.liufeng.crud.bean.Department;
import com.liufeng.crud.bean.Employee;
import com.liufeng.crud.dao.DepartmentMapper;
import com.liufeng.crud.dao.EmployeeMapper;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations= {"classpath:applicationContext.xml"})
public class MapperTest {
	/**
	 * 测试DepartmentMapper
	 * 使用Spring的测试单元 自动注入需要的组件
	 * 1、pom中导入SpringTest模块
	 * 2.使用@ContextConfiguration指定Spring配置的位置
	 * 3.直接autowired要使用的组件即可
	 */
	@Autowired
	DepartmentMapper departmentMapper;
	
	@Autowired
	EmployeeMapper employeeMapper;
	
	@Autowired
	SqlSession sqlsession;
	
	@Test
	public void testCRUD() {
//		//1.创建SpringIOC容器
//		ApplicationContext ioc = new ClassPathXmlApplicationContext("applicationContext.xml");
//		
//		//2.从容器中获取mapper
//		DepartmentMapper bean = ioc.getBean(DepartmentMapper.class);
//	
//		
//		System.out.println(departmentMapper);
//		
//		departmentMapper.insertSelective(new Department(null,"IT开发部"));
//		departmentMapper.insertSelective(new Department(null,"IT产品"));
//		departmentMapper.insertSelective(new Department(null,"销售部门"));
////	
////	
////		employeeMapper.insertSelective(new Employee(null, "张三", "M", "1169555653@qq.com", 1));
//		
//		//批量插入的SQLsession 这个sqlsession就是或得到的特殊的批量插入session 如果使用原先的EmployeeMapper+for循环的话 效率很低
//		EmployeeMapper mapper = sqlsession.getMapper(EmployeeMapper.class);
//		long time1 = System.currentTimeMillis();
//		for(int i=0;i<1000;i++) {
//			String uid = UUID.randomUUID().toString().substring(0,5)+i;
//			mapper.insert(new Employee(null, uid, "M", uid+"@liufeng.com", 1));
//		}
//		long time2 = System.currentTimeMillis();
//		System.out.println("插入完成 使用批量插入的方法 用时"+(time2-time1)/1000+"s");//26
//		
//		
//		EmployeeMapper mapper2 = employeeMapper;
//		long time3 = System.currentTimeMillis();
//		for(int i=0;i<1000;i++) {
//			String uid = UUID.randomUUID().toString().substring(0,5)+i;
//			mapper2.insert(new Employee(null, uid, "F", uid+"@liufeng.com", 7));
//		}
//		long time4 = System.currentTimeMillis();
//		System.out.println("插入完成 使用原始插入的方法 用时"+(time4-time3)/1000+"s"); //23 [尴尬]
//		
//		EmployeeMapper mapper2 = sqlsession.getMapper(EmployeeMapper.class);
//		long time3 = System.currentTimeMillis();
//		for(int i=1000;i<2000;i++) {
//			
//			mapper2.deleteByPrimaryKey(i);
//		}
//		long time4 = System.currentTimeMillis();
//		System.out.println("删除完成 使用原始插入的方法 用时"+(time4-time3)/1000+"s"); 
		
		
//		employeeMapper.updateByPrimaryKeySelective(new Employee(2000, "MAND", "F", "sdf@dsf.com", 5));
//		
//		DepartmentMapper mapper = sqlsession.getMapper(DepartmentMapper.class);
//		
//		//mapper.insert(new Department(null, "达达2"));
//		//mapper.deleteByPrimaryKey(9);
//		mapper.updateByPrimaryKey(new Department(1, "办公室"));
//		mapper.updateByPrimaryKey(new Department(2, "后勤部"));
//		mapper.updateByPrimaryKey(new Department(3, "财务部"));
//		mapper.updateByPrimaryKey(new Department(4, "总务部"));
//		Department selectByPrimaryKey = mapper.selectByPrimaryKey(8);
//		System.out.println(selectByPrimaryKey.toString());
		
	}
}
