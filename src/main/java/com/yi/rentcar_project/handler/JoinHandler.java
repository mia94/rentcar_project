package com.yi.rentcar_project.handler;

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
			String name= req.getParameter("name");
			String password= req.getParameter("password");
			
			
			Customer customer = new Customer();
			CustomEvent customEvent = new CustomEvent();
			
			 JoinService service = JoinService.getInstance();
			service.joinCustomer(customer, customEvent);
			
			req.setAttribute("name", name);
			res.sendRedirect("login.do"); //method-get
			
			return null;
		}
		return null;

		
		
		
		
		
		
		
		
		
	
	}

}
