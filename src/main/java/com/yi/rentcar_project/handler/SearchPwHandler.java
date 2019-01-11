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
			/*String name = req.getParameter("name");
			String id= req.getParameter("id");
			String email1 = req.getParameter("email1");
			String email2 = req.getParameter("email2");
			
			Customer customer = new Customer();
			customer.setName(name);
			customer.setId(id);
			customer.setEmail(email1+"@"+email2);*/
			return "/WEB-INF/view/login/searchPw.jsp";
		} else if (req.getMethod().equalsIgnoreCase("post")) {
			String name = req.getParameter("name");
			String id =req.getParameter("id");
			String email1 = req.getParameter("email1");
			String email2 = req.getParameter("email2");
			
			SearchIdPwService searchService = SearchIdPwService.getInstance();
			
			Customer customer = new Customer();
			customer.setName(name);
			customer.setId(id);
			customer.setEmail(email1 + "@" + email2);
			
			String newPwd = searchService.getRandPw();
			customer.setPasswd(newPwd);
			
			searchService.changePw(customer);
			
			String newPw = customer.getPasswd();
			req.setAttribute("newPwd", newPw);

		}
		return "/WEB-INF/view/login/resultPw.jsp"; 
	}

}
