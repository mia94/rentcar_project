package com.yi.rentcar_project.handler.management;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yi.rentcar_project.model.Customer;
import com.yi.rentcar_project.mvc.CommandHandler;
import com.yi.rentcar_project.service.CustomerService;


public class PasswordHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		if (req.getMethod().equalsIgnoreCase("get")) {
			return "/WEB-INF/view/management/password.jsp";
		}else if(req.getMethod().equalsIgnoreCase("post")){
			String password = req.getParameter("password");
			String id =  (String) req.getSession().getAttribute("AUTH");
			
			Customer customer = new Customer(id, password);
			CustomerService service = CustomerService.getInstance();
			int sameResult = service.samePwd(customer);
			
			if(sameResult==1){ 
				res.sendRedirect("modify.do");
			}
			
		}
		
		return null;
	}
}
