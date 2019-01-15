package com.yi.rentcar_project.handler.login;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yi.rentcar_project.model.AUTH;
import com.yi.rentcar_project.model.Customer;
import com.yi.rentcar_project.model.Employee;
import com.yi.rentcar_project.model.Grade;
import com.yi.rentcar_project.mvc.CommandHandler;
import com.yi.rentcar_project.service.LoginService;

public class LoginHandler implements CommandHandler {
	public static Customer loginCusotmer;
	public static Employee loginEmployee;
	public static Grade loginGrade;
	
	public static LoginHandler login;
	
	

	public static LoginHandler getLogin() {
		return login;
	}


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

					AUTH AUTH = new AUTH(id, false);
					req.getSession().setAttribute("AUTH", AUTH);
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
					
					AUTH AUTH = new AUTH(id, true);
					req.getSession().setAttribute("AUTH", AUTH);  
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
