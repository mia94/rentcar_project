package com.yi.rentcar_project.handler;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yi.rentcar_project.model.Customer;
import com.yi.rentcar_project.model.Employee;
import com.yi.rentcar_project.model.Grade;
import com.yi.rentcar_project.mvc.CommandHandler;
import com.yi.rentcar_project.service.CustomerService;

public class ModifyHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		if (req.getMethod().equalsIgnoreCase("get")) {
			return "/WEB-INF/view/management/customerModify.jsp";
		} else if (req.getMethod().equalsIgnoreCase("post")) {
			String name = req.getParameter("name");
			String id = (String) req.getSession().getAttribute("AUTH");
			String dob = req.getParameter("dob");
			String phone = req.getParameter("phone");
			String phone2 = req.getParameter("phone2");
			String phone3 = req.getParameter("phone3");
			String email1 = req.getParameter("email1");
			String email2 = req.getParameter("email2");
			String license = req.getParameter("license");
			String zipcode = req.getParameter("zipcode");
			String address = req.getParameter("address");
			String detailAddr = req.getParameter("detailAddr");
			String password = req.getParameter("password");
			String confirmPassword = req.getParameter("confirmPassword");

			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			Date dobs = sdf.parse(dob);

			try {
				if (password == confirmPassword) {
					CustomerService service = CustomerService.getInstance();
					Employee employee = new Employee("E001");
					Grade grade = new Grade("G001");

					Customer customer = new Customer(id, password, name, zipcode, (address + " " + detailAddr),
							(phone + "-" + phone2 + "-" + phone3), dobs, (email1 + "@" + email2), employee, license,
							grade, 0);

					service.updateCustomer(customer);
				}
			} catch (Exception e) {
				e.printStackTrace();
			}

		}
		return "/WEB-INF/view/management/customerModify.jsp";
	}

}
