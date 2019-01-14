package com.yi.rentcar_project.handler.management;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yi.rentcar_project.model.Employee;
import com.yi.rentcar_project.mvc.CommandHandler;
import com.yi.rentcar_project.service.EmployeeService;

public class EmployeeUploadHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		EmployeeService service = EmployeeService.getInstance();
		if(req.getMethod().equalsIgnoreCase("get")){
			
			String nextCode = service.nextCode();
			
			req.setAttribute("nextCode", nextCode);
			
			return "/WEB-INF/view/management/employeeUpload.jsp";
		}else if(req.getMethod().equalsIgnoreCase("post")){
			String code = req.getParameter("code");
			String name = req.getParameter("name");
			String phone = req.getParameter("phone");
			String password = req.getParameter("password");
			
			Employee employee = new Employee();
			employee.setCode(code);
			employee.setName(name);
			employee.setPhone(phone);
			employee.setPasswd(password);
			
			service.insertEmployee(employee);
			
			return "employeeList.do";
		}
		return null;
	}

}
