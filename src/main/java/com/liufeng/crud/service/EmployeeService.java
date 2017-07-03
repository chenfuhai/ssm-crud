package com.liufeng.crud.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.liufeng.crud.bean.Employee;
import com.liufeng.crud.dao.EmployeeMapper;


@Service
public class EmployeeService {

	@Autowired
	EmployeeMapper employeeMapper;
	
	
	public List<Employee> getAll() {
		// TODO Auto-generated method stub
		return employeeMapper.selectByExampleWithDept(null);
	}

}
