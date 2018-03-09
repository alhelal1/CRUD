package com.bjitgroup.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.bjitgroup.model.Employee;
import com.bjitgroup.service.EmployeeService;

@RestController
public class EmployeeController {
	
	@Autowired
	EmployeeService  empsrv;
	
	@GetMapping("/")
	public ModelAndView page(Model model)
	{
		//empsrv.delete(1);
		ModelAndView mv=new ModelAndView("index");
		return mv;
	}
	
	@PostMapping("/save")
	public String save( Employee emp)
	{
		System.out.println("hi all");
		System.out.println("Save............"+emp.getName()+"    "+emp.getEmail());
		
		
		empsrv.saveEmployee(emp);
		
		return "save_successfully";
		//return emp;
		
		
	}
	
	
	@GetMapping("/findAll")
	public List<Employee> findAll()
	{
		List<Employee> list=empsrv.findAll();
		return list;
		
	}
	@DeleteMapping("/deleteEmp/{id}")
	public void delete(@PathVariable Integer id)
	{
		empsrv.delete(id);
	}
	


}
