package com.yi.rentcar_project.handler.management;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yi.rentcar_project.model.CustomEvent;
import com.yi.rentcar_project.model.Customer;
import com.yi.rentcar_project.mvc.CommandHandler;
import com.yi.rentcar_project.service.CustomerService;

public class CustomerDeleteHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		String code = req.getParameter("code");

		Customer customer = new Customer();
		customer.setCode(code);

		CustomEvent customEvent = new CustomEvent();
		customEvent.setCustomCode(customer.getCode());
		
		CustomerService service = CustomerService.getInstance();
		service.deleteCustomerEvent(customer, customEvent);

		return "customerList.do";
	}

}
