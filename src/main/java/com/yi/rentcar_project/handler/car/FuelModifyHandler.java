package com.yi.rentcar_project.handler.car;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yi.rentcar_project.model.Fuel;
import com.yi.rentcar_project.mvc.CommandHandler;
import com.yi.rentcar_project.service.FuelService;

public class FuelModifyHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		if(req.getMethod().equalsIgnoreCase("get")){
			String sNo = req.getParameter("code");
			
			Fuel fuel = new Fuel();
			fuel.setCode(sNo);
			
			FuelService service = FuelService.getInstance();
			fuel = service.selectFuelByNo(fuel);
			
			req.setAttribute("fuel", fuel);
			return "/WEB-INF/view/car/fuelmodify.jsp";
		}else if(req.getMethod().equalsIgnoreCase("post")){
			String sNo = req.getParameter("no");
			String code = req.getParameter("code");
			
			int no = Integer.parseInt(sNo);
			
			Fuel fuel = new Fuel();
			fuel.setNo(no);
			fuel.setCode(code);
			
			FuelService service = FuelService.getInstance();
			service.updateFuel(fuel);
			
			return "caroptionlist.do";
		}
		return null;
	}

}
