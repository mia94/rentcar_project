package com.yi.rentcar_project.handler.car;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yi.rentcar_project.model.CarOption;
import com.yi.rentcar_project.mvc.CommandHandler;
import com.yi.rentcar_project.service.CarOptionService;

public class TotalOptionHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		
		return "/WEB-INF/view/car/totaloptionlist.jsp";
	}

}
