package com.yi.rentcar_project.handler.car;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yi.rentcar_project.model.Fuel;
import com.yi.rentcar_project.mvc.CommandHandler;
import com.yi.rentcar_project.service.FuelService;

public class FuelDeleteHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		String sNo = req.getParameter("no");
		int no = Integer.parseInt(sNo);
		
		Fuel fuel = new Fuel();
		fuel.setNo(no);
		
		FuelService service = FuelService.getInstance();
		service.deleteFuel(fuel);
		
		return "caroptionlist.do";
	}

}
