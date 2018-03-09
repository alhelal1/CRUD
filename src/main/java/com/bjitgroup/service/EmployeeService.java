package com.bjitgroup.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bjitgroup.model.Employee;
import com.bjitgroup.repository.EmployeeRepository;

@Service
public class EmployeeService {
	
	
	@Autowired
	EmployeeRepository employeeRepository;
	public void saveEmployee(Employee emp)
	{
		employeeRepository.save(emp);
	}
	
	public List<Employee>  findAll()
	{
		return employeeRepository.findAll();
	}
	
	public Employee findOne(int id)
	{
		return employeeRepository.findOne(id);
	}
	
	public void delete(Integer id)
	{
		employeeRepository.delete(id);
	}
	

	

}
