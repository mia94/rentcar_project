package com.yi.rentcar_project.handler.management;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yi.rentcar_project.model.Customer;
import com.yi.rentcar_project.mvc.CommandHandler;
import com.yi.rentcar_project.service.CustomerService;

public class CustomerModifyHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		if (req.getMethod().equalsIgnoreCase("get")) {
			String id = (String) req.getSession().getAttribute("AUTH");
			CustomerService service = CustomerService.getInstance();
			Customer customer = new Customer();
			customer.setId(id);
			Customer customId = service.selectCustomerById(customer);

			System.out.println(customId);

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

			if (password.equals(confirmPassword) == true) {
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
				Date dobs = sdf.parse(dob);
				CustomerService service = CustomerService.getInstance();

				Customer custome = new Customer();
				custome.setId(id);

				Customer customer = service.selectCustomerById(custome);

				customer.setId(id);
				customer.setName(name);

				customer.setDob(dobs);
				customer.setPhone((phone + "-" + phone2 + "-" + phone3));
				customer.setEmail((email1 + "@" + email2));
				customer.setLicense(license);
				customer.setZipCode(zipcode);
				customer.setAddress(address + " " + detailAddr);
				customer.setPasswd(password);

				service.updateCustomer(customer);

			}
			return "customerList.do";

		}

		return null;
	}

}
