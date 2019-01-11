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
			String id = (String) req.getSession().getAttribute("AUTH");
			CustomerService service = CustomerService.getInstance();
			Customer customer = new Customer();
			customer.setId(id);
			Customer customId = service.selectCustomerById(customer);
			System.out.println("확인");
			// System.out.println(customId);
			
			/*
			 * 
			 * req.setAttribute("name", customId.getName());
			 * //System.out.println(name); req.setAttribute("id", id);
			 * req.setAttribute("dob", .dob); req.setAttribute("phone", phone);
			 * req.setAttribute("phone2", phone2); req.setAttribute("phone3",
			 * phone3); req.setAttribute("email1", email1);
			 * req.setAttribute("email2", email2); req.setAttribute("license",
			 * license); req.setAttribute("zipcode", zipcode);
			 * req.setAttribute("address", address);
			 * req.setAttribute("detailAddr", detailAddr);
			 */

			req.setAttribute("custom", customId);

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


			req.setAttribute("name", name);
			
		
			if (password.equals(confirmPassword)==true) {
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
				Date dobs = sdf.parse(dob);
				CustomerService service = CustomerService.getInstance();
				Employee employee = new Employee("E001");
				Grade grade = new Grade("G001");
				System.out.println("==========>"+grade);
				Customer customer = new Customer();
				customer.setName(name);
				customer.setId(id);
				customer.setDob(dobs);
				customer.setPhone((phone + "-" + phone2 + "-" + phone3));
				customer.setEmail((email1 + "@" + email2));
				customer.setLicense(license);
				customer.setZipCode(zipcode);
				customer.setAddress(address + " " + detailAddr);
				customer.setEmpCode(employee);
				customer.setGradeCode(grade);

				System.out.println("==========>"+customer);

				service.updateCustomer(customer);

			}
			return "test.jsp";
			//return "login.do";
		}
		
		/*
		 * req.setAttribute("name", name); System.out.println(name);
		 * req.setAttribute("id", id); req.setAttribute("dob", dob);
		 * req.setAttribute("phone", phone); req.setAttribute("phone2", phone2);
		 * req.setAttribute("phone3", phone3); req.setAttribute("email1",
		 * email1); req.setAttribute("email2", email2);
		 * req.setAttribute("license", license); req.setAttribute("zipcode",
		 * zipcode); req.setAttribute("address", address);
		 * req.setAttribute("detailAddr", detailAddr);
		 */

		// return "/WEB-INF/view/management/customerModify.jsp";
		return null;
	}

}
