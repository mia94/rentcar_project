package com.yi.rentcar_project.handler.management;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yi.rentcar_project.mvc.CommandHandler;
import com.yi.rentcar_project.service.CustomerService;

public class testReadHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		// TODO Auto-generated method stub
		String code = req.getParameter("code");
		
		CustomerService service = CustomerService.getInstance();
		Map<String, Object> map = service.readCustomerInfo(code);
		
		req.setAttribute("map", map);
		
		return "test.jsp";
	}

}
