package com.yi.rentcar_project.handler.carchart;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yi.rentcar_project.model.StateCar;
import com.yi.rentcar_project.mvc.CommandHandler;
import com.yi.rentcar_project.service.StateCarService;

public class CarTypeChartHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		// TODO Auto-generated method stub
		StateCarService service = StateCarService.getInstance();
		List<StateCar> list = service.selectCountByCarType();
		
		req.setAttribute("list", list);
		
		return "/WEB-INF/view/chart/cartypechart.jsp";
	}

}
