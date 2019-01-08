package com.yi.rentcar_project.handler;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yi.rentcar_project.model.Customer;
import com.yi.rentcar_project.model.Employee;
import com.yi.rentcar_project.mvc.CommandHandler;
import com.yi.rentcar_project.service.LoginService;

public class LoginHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		if (req.getMethod().equalsIgnoreCase("get")) {
			return "/WEB-INF/view/login/loginForm.jsp";
		} else if (req.getMethod().equalsIgnoreCase("post")) {
			String id = req.getParameter("id");
			String passwd = req.getParameter("password");
			String checkManager = req.getParameter("checkManager");
			LoginService service = LoginService.getInstance();

			if (checkManager == null) {
				Customer customer = new Customer(id, passwd);
				try {
					service.selectCustomerByPw(customer);

					req.getSession().setAttribute("AUTH", id);
					return "home.do";
				} catch (Exception e) {
					e.printStackTrace();
					req.setAttribute("error", "아이디와 비밀번호를 확인해 주세요");
					return "/WEB-INF/view/login/loginForm.jsp";
				}

			} else {
				Employee employee = new Employee(id, null, null, passwd); // id=code
				try {
					service.selectEmployeeByPw(employee);

					req.getSession().setAttribute("AUTH", id);
					return "home.do";
				} catch (Exception e) {
					e.printStackTrace();
					req.setAttribute("error", "아이디와 비밀번호를 확인해 주세요");
					return "/WEB-INF/view/login/loginForm.jsp";
				}

			}

		}
		return null;
	}
}
