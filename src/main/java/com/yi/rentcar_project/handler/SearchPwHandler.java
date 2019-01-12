package com.yi.rentcar_project.handler;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yi.rentcar_project.model.Customer;
import com.yi.rentcar_project.mvc.CommandHandler;
import com.yi.rentcar_project.service.CustomerService;
import com.yi.rentcar_project.service.SearchIdPwService;

public class SearchPwHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		// TODO Auto-generated method stub
		if (req.getMethod().equalsIgnoreCase("get")) {

			return "/WEB-INF/view/login/searchPw.jsp";
		} else if (req.getMethod().equalsIgnoreCase("post")) {

			try {
				String name = req.getParameter("name");
				String id = req.getParameter("id");
				String email1 = req.getParameter("email1");
				String email2 = req.getParameter("email2");

				CustomerService service = CustomerService.getInstance();
				SearchIdPwService searchService = SearchIdPwService.getInstance();

				Customer customer = new Customer();
				customer.setName(name);
				System.out.println();
				customer.setId(id);
				customer.setEmail(email1 + "@" + email2);
				Customer custome = service.selectCustomerById(customer);
				System.out.println(customer.getEmail());
				System.out.println(custome);
				if (custome.getName().equals(name) || custome.getEmail().equals(email1 + "@" + email2)) {

					String newPwd = searchService.getRandPw();
					customer.setPasswd(newPwd);

					searchService.changePw(customer);

					String newPw = customer.getPasswd();
					req.setAttribute("newPwd", newPw);
				}
			} catch (Exception e) {
				e.printStackTrace();
				String msg = "1";
				req.setAttribute("msg", msg);
				return "/WEB-INF/view/login/searchPw.jsp";
			}
			return "/WEB-INF/view/login/resultPw.jsp";
		}

		return null;
	}

}
