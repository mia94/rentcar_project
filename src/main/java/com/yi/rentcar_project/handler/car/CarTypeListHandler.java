package com.yi.rentcar_project.handler.car;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yi.rentcar_project.model.CarType;
import com.yi.rentcar_project.mvc.CommandHandler;
import com.yi.rentcar_project.service.CarTypeService;

public class CarTypeListHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		CarTypeService typeService = CarTypeService.getInstance();
		List<CarType> typeList = typeService.selectCarTypeByAll();
		req.setAttribute("typeList", typeList);
		
		return "/WEB-INF/view/car/cartypelist.jsp";
	}

}
