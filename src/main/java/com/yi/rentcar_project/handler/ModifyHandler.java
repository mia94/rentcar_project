package com.yi.rentcar_project.handler;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yi.rentcar_project.mvc.CommandHandler;

public class ModifyHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		if (req.getMethod().equalsIgnoreCase("get")) {
			 return "/WEB-INF/view/management/customerModify.jsp";
		}else if(req.getMethod().equalsIgnoreCase("post")){
			String name = req.getParameter("name");
			String id =  (String) req.getSession().getAttribute("AUTH");
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
			String confirmPassword =req.getParameter("confirmPassword");
			
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			Date dobs = sdf.parse(dob);
			
			
		}
		   return "/WEB-INF/view/management/customerModify.jsp";
	}

}
