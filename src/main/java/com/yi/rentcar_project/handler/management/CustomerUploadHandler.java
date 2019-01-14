package com.yi.rentcar_project.handler.management;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yi.rentcar_project.model.CustomEvent;
import com.yi.rentcar_project.model.Customer;
import com.yi.rentcar_project.model.Employee;
import com.yi.rentcar_project.model.Grade;
import com.yi.rentcar_project.mvc.CommandHandler;
import com.yi.rentcar_project.service.JoinService;

public class CustomerUploadHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		JoinService service = JoinService.getInstance();
		if (req.getMethod().equalsIgnoreCase("get")) {

			String nextCode = service.getNextCustomerCode();

			req.setAttribute("nextCode", nextCode);

			return "/WEB-INF/view/management/customerUpload.jsp";
		} else if (req.getMethod().equalsIgnoreCase("post")) {
			String id = req.getParameter("id");
			String name = req.getParameter("name");
			String passwd = req.getParameter("password");
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

			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			Date dobs = sdf.parse(dob);

			Employee employee = new Employee("E001");
			Grade grade = new Grade("G001");
			Customer customer = new Customer(id, passwd, name, zipcode, (address + " " + detailAddr),
					(phone + "-" + phone2 + "-" + phone3), dobs, (email1 + "@" + email2), employee, license, grade, 0);
			customer.setCode(service.getNextCustomerCode());
			CustomEvent customEvent = new CustomEvent("EVT1", customer.getCode(), false);
			service.joinCustomer(customer, customEvent);

			return "customerList.do";
		}
		return null;
	}

}
