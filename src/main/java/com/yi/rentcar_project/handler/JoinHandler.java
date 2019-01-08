package com.yi.rentcar_project.handler;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yi.rentcar_project.model.CustomEvent;
import com.yi.rentcar_project.model.Customer;
import com.yi.rentcar_project.mvc.CommandHandler;
import com.yi.rentcar_project.service.JoinService;

public class JoinHandler implements CommandHandler{

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		// TODO Auto-generated method stub
		if(req.getMethod().equalsIgnoreCase("get")){
			
			   return "/WEB-INF/view/join/joinForm.jsp";
		}else if(req.getMethod().equalsIgnoreCase("post")){
			
			String id = req.getParameter("id");
			System.out.println(id);
			String name= req.getParameter("name");
			System.out.println(name);
			String passwd= req.getParameter("password");
			System.out.println(passwd);
			String dob = req.getParameter("dob");
			System.out.println(dob);
			String phone = req.getParameter("phone");
			String phone2 = req.getParameter("phone2");
			String phone3 = req.getParameter("phone3");
			System.out.println(phone+phone2);
			String email1 = req.getParameter("email1");
			System.out.println(email1);
			String email2 = req.getParameter("email2");
			System.out.println(email2);
			String license = req.getParameter("license");
			System.out.println(license);
			String zipcode = req.getParameter("zipcode");
			System.out.println(zipcode);
			String address = req.getParameter("address");
			System.out.println(address);
			
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			Date dobs = sdf.parse(dob);
			 JoinService service = JoinService.getInstance();
			String code = service.getNextCustomerCode();
			/*Customer customer = new Customer();*/
			Customer customer = new Customer(code, id, passwd, name, zipcode, address, phone3, dobs, (email1+email2), null, license, null, 0);
			System.out.println(customer);
			CustomEvent customEvent = new CustomEvent("EVT1", customer.getCode(), false);
			
			
			service.joinCustomer(customer, customEvent);
			
			req.setAttribute("name", name);
			res.sendRedirect("login.do"); //method-get
			
			return null;
		}
		return null;

		
		
		
		
		
		
		
		
		
	
	}

}
