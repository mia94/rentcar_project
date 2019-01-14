package com.yi.rentcar_project.handler.carchart;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yi.rentcar_project.mvc.CommandHandler;
import com.yi.rentcar_project.service.StateCarService;

public class CarLineChartHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		// TODO Auto-generated method stub
		StateCarService service = StateCarService.getInstance();
		
		return "/WEB-INF/view/chart/carlinechart.jsp";
	}

}
