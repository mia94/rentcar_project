package com.yi.rentcar_project.handler;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.JOptionPane;

import com.yi.rentcar_project.model.Customer;
import com.yi.rentcar_project.mvc.CommandHandler;
import com.yi.rentcar_project.service.SearchIdPwService;

public class SearchIdHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		// TODO Auto-generated method stub
		if (req.getMethod().equalsIgnoreCase("get")) {
			return "/WEB-INF/view/login/searchId.jsp";
		}
		if (req.getMethod().equalsIgnoreCase("post")) {
			String name = req.getParameter("name");
			String email1 = req.getParameter("email1");
			String email2 = req.getParameter("email2");

			SearchIdPwService searchService = SearchIdPwService.getInstance();
			Customer customer = new Customer();
			customer.setName(name);
			customer.setEmail(email1 + "@" + email2);

			try {
				customer = searchService.searchId(customer);
			} catch (Exception e) {
				e.printStackTrace();
			}

			
			String id = customer.getId();
		
			req.setAttribute("id", id);

		}
		return "/WEB-INF/view/login/resultId.jsp"; 
	}

}
