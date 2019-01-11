package com.yi.rentcar_project.handler;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yi.rentcar_project.model.Customer;
import com.yi.rentcar_project.mvc.CommandHandler;
import com.yi.rentcar_project.service.SearchIdPwService;

public class SearchPwHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		// TODO Auto-generated method stub
		if (req.getMethod().equalsIgnoreCase("get")) {
			return "/WEB-INF/view/login/searchPw.jsp";
		} else if (req.getMethod().equalsIgnoreCase("post")) {
			String name = req.getParameter("name");
			String id =req.getParameter("id");
			String email1 = req.getParameter("email1");
			String email2 = req.getParameter("email2");
				
			Customer customer = new Customer();
			customer.setName(name);
			customer.setId(id);
			customer.setEmail(email1 + "@" + email2);
			
			try {
				SearchIdPwService searchService = SearchIdPwService.getInstance();
				String newPwd = searchService.getRandPw();
				customer.setPasswd(newPwd);
				searchService.changePw(customer);
	
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			String newPwd = customer.getPasswd();
			req.setAttribute("newPwd", newPwd);

		}
		return "/WEB-INF/view/login/resultPw.jsp"; 
	}

}
