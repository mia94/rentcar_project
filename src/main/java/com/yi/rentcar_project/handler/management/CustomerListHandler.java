package com.yi.rentcar_project.handler.management;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yi.rentcar_project.model.Customer;
import com.yi.rentcar_project.mvc.CommandHandler;
import com.yi.rentcar_project.service.CustomerService;

public class CustomerListHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		// TODO Auto-generated method stub
		CustomerService customerService = CustomerService.getInstance();
		List<Customer> customerList = customerService.selectCustomerByAll();
		req.setAttribute("customerList", customerList);

		return "/WEB-INF/view/management/customerList.jsp";
	}

}
