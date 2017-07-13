package com.liufeng.crud.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.liufeng.crud.bean.Department;
import com.liufeng.crud.dao.DepartmentMapper;

@Service
public class DepartmentService {
	@Autowired
	DepartmentMapper departmentMapper;
	
	public List<Department> getAll() {
		// TODO Auto-generated method stub
		return departmentMapper.selectByExample(null);
	}

	
}
