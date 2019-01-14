package com.yi.rentcar_project.handler.management;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yi.rentcar_project.model.Employee;
import com.yi.rentcar_project.mvc.CommandHandler;
import com.yi.rentcar_project.service.EmployeeService;

public class EmployeeModifyHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		if (req.getMethod().equalsIgnoreCase("get")) {
			String code = req.getParameter("code");

			Employee employee = new Employee();
			employee.setCode(code);

			EmployeeService service = EmployeeService.getInstance();
			employee = service.selectEmployeeByNo(employee);

			req.setAttribute("employee", employee);
			return "/WEB-INF/view/management/employeeModify.jsp";
		} else if (req.getMethod().equalsIgnoreCase("post")) {

			String code = req.getParameter("code");
			String name = req.getParameter("name");
			String phone = req.getParameter("phone");
			String phone2 = req.getParameter("phone2");
			String phone3 = req.getParameter("phone3");
			String password = req.getParameter("password");

			Employee employee = new Employee();
			employee.setCode(code);
			employee.setName(name);
			employee.setPhone((phone + "-" + phone2 + "-" + phone3));
			employee.setPasswd(password);
			
			EmployeeService service = EmployeeService.getInstance();
			service.updateEmployee(employee);

			return "employeeList.do";
		}
		return null;
	}

}
