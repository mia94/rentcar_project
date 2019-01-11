package com.yi.rentcar_project.handler.car;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yi.rentcar_project.model.Fuel;
import com.yi.rentcar_project.mvc.CommandHandler;
import com.yi.rentcar_project.service.FuelService;

public class FuelListHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		
		FuelService fuelService = FuelService.getInstance();
		List<Fuel> fuelList = fuelService.selectFuelByAll();
		req.setAttribute("fuelList", fuelList);
		
		return "/WEB-INF/view/car/fuellist.jsp";
	}

}
