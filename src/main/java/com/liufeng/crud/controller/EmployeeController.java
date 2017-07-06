package com.liufeng.crud.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.liufeng.crud.bean.Employee;
import com.liufeng.crud.service.EmployeeService;

/**
 * 处理员工的CRUD请求
 * @author fuhai
 *
 */
@Controller
public class EmployeeController {
	@Autowired
	EmployeeService employeeService;
	
	/**
	 * 新的处理emps的方法 ， @ResponseBody能把返回的对象转化为JSON
	 * @ResponseBody需要导入jackjson包
	 * @param pn
	 * @return
	 */
	@RequestMapping("/emps")
	@ResponseBody
	public PageInfo getEmpsWithJson(@RequestParam(value="pn",defaultValue="1")Integer pn) {
		//查询的所有东西
				//引入pageHelper分页插件
				//在查询之前 ，只需要调用
				PageHelper.startPage(pn, 5);
				//后面紧跟着查询就是一个分页查询。。
				List<Employee> emps = employeeService.getAll();
				//使用pageInfo来包装查出的列表 讲pageinfo交给页面就好了 连续显示的页数
				PageInfo page = new PageInfo(emps,5);
				
				
				return page;
	}
	
	
	/**
	 * 查询员工数据（分页查询）
	 * @return
	 */
	//@RequestMapping("/emps")
	public String getEmps(@RequestParam(value="pn",defaultValue="1")Integer pn,Model model) {
		//查询的所有东西
		//引入pageHelper分页插件
		//在查询之前 ，只需要调用
		PageHelper.startPage(pn, 5);
		//后面紧跟着查询就是一个分页查询。。
		List<Employee> emps = employeeService.getAll();
		//使用pageInfo来包装查出的列表 讲pageinfo交给页面就好了 连续显示的页数
		PageInfo page = new PageInfo(emps,5);
		model.addAttribute("pageInfo",page);
		//写完进行单元测试
		return "list";
	}
}
