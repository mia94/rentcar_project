package com.yi.rentcar_project.handler.management;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yi.rentcar_project.model.AUTH;
import com.yi.rentcar_project.model.Customer;
import com.yi.rentcar_project.mvc.CommandHandler;
import com.yi.rentcar_project.service.CustomerService;

public class ModifyHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		if (req.getMethod().equalsIgnoreCase("get")) {
			AUTH auth = (AUTH) req.getSession().getAttribute("AUTH");
			CustomerService service = CustomerService.getInstance();
			Customer customer = new Customer();
			customer.setId(auth.getId());
			Customer customId = service.selectCustomerById(customer);
			
			System.out.println(customId);
		
			req.setAttribute("custom", customId);

			return "/WEB-INF/view/management/customerModify.jsp";
		} else if (req.getMethod().equalsIgnoreCase("post")) {
			String name = req.getParameter("name");
			AUTH auth = (AUTH) req.getSession().getAttribute("AUTH");
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
				/*Employee employee = new Employee();
				Grade grade = new Grade();*/
				Customer custome = new Customer();
				custome.setId(auth.getId());
				
				Customer customer = service.selectCustomerById(custome);
				/*Grade grade = new Grade();
				Employee employee = new Employee();*/
				/*service.selectCustomerById(customer);*/
				customer.setId(auth.getId());
				customer.setName(name);
				
		
				customer.setDob(dobs);
				customer.setPhone((phone + "-" + phone2 + "-" + phone3));
				customer.setEmail((email1 + "@" + email2));
				customer.setLicense(license);
				customer.setZipCode(zipcode);
				customer.setAddress(address + " " + detailAddr);
				customer.setPasswd(password);
				

				System.out.println("==========>"+customer);

				service.updateCustomer(customer);

			}
			return "/WEB-INF/view/management/modifyResult.jsp";
			
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
