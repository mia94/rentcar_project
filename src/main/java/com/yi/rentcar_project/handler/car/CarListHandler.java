package com.yi.rentcar_project.handler.car;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yi.rentcar_project.model.CarModel;
import com.yi.rentcar_project.mvc.CommandHandler;
import com.yi.rentcar_project.service.CarModelService;

public class CarListHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {

			CarModelService service = CarModelService.getInstance();
			List<CarModel> list = service.selectCarModelByAll();
			System.out.println(list);
			req.setAttribute("list", list);
			return "/WEB-INF/view/car/carlist.jsp";
		
	}

}
