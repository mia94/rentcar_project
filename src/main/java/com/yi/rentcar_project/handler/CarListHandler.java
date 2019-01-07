package com.yi.rentcar_project.handler;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yi.rentcar_project.mvc.CommandHandler;

public class CarListHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		if(req.getMethod().equalsIgnoreCase("get")){
			return "/WEB-INF/view/car/carlist.jsp";
		}else if(req.getMethod().equalsIgnoreCase("post")){
			
		}
		return null;
	}

}
