package com.yi.rentcar_project.dao;

import java.util.List;

import com.yi.rentcar_project.model.Employee;

public interface EmployeeDao {
	Employee selectEmployeeByNo(Employee employee);
	List<Employee> selectEmployeeByAll();
	
	int insertEmployee(Employee employee);
	int deleteEmployee(Employee employee);
	int updateEmployee(Employee employee);
	
	int selectEmployeeById(Employee employee);
	Employee selectEmployeeByPw(Employee employee);
}
