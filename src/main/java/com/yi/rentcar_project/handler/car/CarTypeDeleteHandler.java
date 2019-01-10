package com.yi.rentcar_project.handler.car;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yi.rentcar_project.model.CarType;
import com.yi.rentcar_project.mvc.CommandHandler;
import com.yi.rentcar_project.service.CarTypeService;

public class CarTypeDeleteHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		
		String code = req.getParameter("code");
		CarType cartype = new CarType();
		cartype.setCode(code);
		
		CarTypeService service = CarTypeService.getInstance();
		service.deleteCarType(cartype);
		
		return "caroptionlist.do";
	}

}
