package com.pack.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.pack.dao.EmployeeDao;
import com.pack.model.Employee;

@Service
public class EmployeeServiceImpl implements EmployeeService {
	
	@Autowired
	private EmployeeDao employeeDao;

	@Transactional
	public void addEmployee(Employee e) {
		employeeDao.addEmployee(e);
		
	}

	@Transactional
	public List<Employee> listEmployees() {
		List<Employee> l = employeeDao.listEmployees();
		
		return l;
	}

	@Transactional
	public void deleteEmployee(Integer id) {
		employeeDao.deleteEmployee(id);
		
		
	}

	

}
