package com.yi.rentcar_project.handler.management;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yi.rentcar_project.model.Employee;
import com.yi.rentcar_project.mvc.CommandHandler;
import com.yi.rentcar_project.service.EmployeeService;

public class EmployeeListHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		// TODO Auto-generated method stub
				EmployeeService employeeService = EmployeeService.getInstance();
				List<Employee> employeeList = employeeService.selectEmployeeByAll();
				req.setAttribute("employeeList", employeeList);
				
		return "/WEB-INF/view/management/employeeList.jsp";
	}

}
