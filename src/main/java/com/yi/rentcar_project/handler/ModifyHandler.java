package com.yi.rentcar_project.handler;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yi.rentcar_project.mvc.CommandHandler;

public class ModifyHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		// TODO Auto-generated method stub
		   return "/WEB-INF/view/join/customerModify.jsp";
	}

}