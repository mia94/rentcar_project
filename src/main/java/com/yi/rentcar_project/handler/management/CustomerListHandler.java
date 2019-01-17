package com.yi.rentcar_project.handler.management;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.codehaus.jackson.map.ObjectMapper;

import com.yi.rentcar_project.model.Customer;
import com.yi.rentcar_project.mvc.CommandHandler;
import com.yi.rentcar_project.service.CustomerService;

public class CustomerListHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		// TODO Auto-generated method stub
		//System.out.println("test");
		CustomerService customerService = CustomerService.getInstance();
		List<Customer> customerList = customerService.selectCustomerByAll();
		
		ObjectMapper om = new ObjectMapper();
		String json = om.writeValueAsString(customerList);
		System.out.println(json);
		
		res.setContentType("application/json;charset=utf-8");
		PrintWriter pw = res.getWriter();
		pw.println(json);
		pw.flush();//고객에게 데이터를 보냄
		
		req.setAttribute("customerList", customerList);
		return "/WEB-INF/view/management/customerList.jsp";
	}

}
