package com.liufeng.crud.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.liufeng.crud.bean.Employee;
import com.liufeng.crud.bean.EmployeeExample;
import com.liufeng.crud.bean.EmployeeExample.Criteria;
import com.liufeng.crud.dao.EmployeeMapper;


@Service
public class EmployeeService {

	@Autowired
	EmployeeMapper employeeMapper;
	
	
	public List<Employee> getAll() {
		// TODO Auto-generated method stub
		return employeeMapper.selectByExampleWithDept(null);
	}


	public void saveEmp(Employee employee) {
		// TODO Auto-generated method stub
		employeeMapper.insertSelective(employee);
	}

	public boolean checkUser(String userName) {
		EmployeeExample example = new EmployeeExample();
		Criteria c = example.createCriteria();
		c.andEmpNameEqualTo(userName);
		long count = employeeMapper.countByExample(example);
		return count == 0;
	}


	public Employee getEmp(Integer id) {
		Employee employee = employeeMapper.selectByPrimaryKey(id);
		return employee;
		
	}



}
