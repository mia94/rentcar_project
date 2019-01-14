package com.yi.rentcar_project.handler.management;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yi.rentcar_project.model.Employee;
import com.yi.rentcar_project.mvc.CommandHandler;
import com.yi.rentcar_project.service.EmployeeService;

public class EmployeeDeleteHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		String code = req.getParameter("code");

		Employee employee = new Employee();
		employee.setCode(code);

		EmployeeService service = EmployeeService.getInstance();
		service.deleteEmployee(employee);

		return "employeeList.do";
	}

}
