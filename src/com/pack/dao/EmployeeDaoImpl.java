package com.pack.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.pack.model.Employee;

@Repository
public class EmployeeDaoImpl implements EmployeeDao {
	
	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public void addEmployee(Employee e) {
		Session s = sessionFactory.getCurrentSession();
		s.save(e);

	}

	@Override
	public List<Employee> listEmployees() {
		
		return(sessionFactory.getCurrentSession().createQuery("from Employee").list());
	}

	@Override
	public void deleteEmployee(Integer id) {
		Session s = sessionFactory.getCurrentSession();
		Employee e = (Employee)s.get(Employee.class, id);
		
		if(e != null)
			s.delete(e);
		
		

	}

}
