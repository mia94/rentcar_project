package com.yi.rentcar_project.handler.management;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yi.rentcar_project.model.AUTH;
import com.yi.rentcar_project.model.CustomEvent;
import com.yi.rentcar_project.model.Customer;
import com.yi.rentcar_project.model.Employee;
import com.yi.rentcar_project.model.Event;
import com.yi.rentcar_project.mvc.CommandHandler;
import com.yi.rentcar_project.service.CustomerService;

public class CustomerModifyHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		if (req.getMethod().equalsIgnoreCase("get")) {
			String code = req.getParameter("code");

			Customer customer = new Customer();
			customer.setCode(code);

			CustomerService service = CustomerService.getInstance();
			customer = service.selectCustomerByCode(customer);

			req.setAttribute("customer", customer);
			return "/WEB-INF/view/management/customerUpdate.jsp";
		} else if (req.getMethod().equalsIgnoreCase("post")) {
			String code = req.getParameter("code");
			String name = req.getParameter("name");
			String id = req.getParameter("id");
			String dob = req.getParameter("dob");
			String phone = req.getParameter("phone");
			String phone2 = req.getParameter("phone2");
			String phone3 = req.getParameter("phone3");
			String email1 = req.getParameter("email1");
			String email2 = req.getParameter("email2");
			String zipcode = req.getParameter("zipcode");
			String address = req.getParameter("address");
			String detailAddr = req.getParameter("detailAddr");
			String empCode = req.getParameter("empCode");
			String license = req.getParameter("license");
			String gradeCode = req.getParameter("gradeCode");
			String rentCnts = req.getParameter("rentCnt");
			
			// String events = req.getParameter("events");

			int rentCnt = Integer.parseInt(rentCnts);
			System.out.println(rentCnt);

			CustomerService service = CustomerService.getInstance();
			/* req.setAttribute("name", name); */
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			Date dobs = sdf.parse(dob);
			Customer customer = new Customer();
			customer.setCode(code);
			customer = service.selectCustomerByCode(customer);
			customer.setCode(code);
			customer.setName(name);
			customer.setId(id);
			customer.setDob(dobs);
			customer.setPhone((phone + "-" + phone2 + "-" + phone3));
			customer.setEmail((email1 + "@" + email2));
			customer.setZipCode(zipcode);
			customer.setAddress(address + " " + detailAddr);
			customer.getEmpCode().setCode(empCode);
			customer.setLicense(license);
			customer.getGradeCode().setCode(gradeCode);
			customer.setRentCnt(rentCnt);
			
			/*
			 * List<CustomEvent> list = customer.getEvents();
			 * customer.setEvents(events);
			 */

			service.updateCustomerInfo(customer);

			return "customerList.do";
		}

		return null;
	}

}
