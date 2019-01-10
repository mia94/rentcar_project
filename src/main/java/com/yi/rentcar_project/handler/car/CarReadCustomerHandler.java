package com.yi.rentcar_project.handler.car;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yi.rentcar_project.model.CarModel;
import com.yi.rentcar_project.mvc.CommandHandler;
import com.yi.rentcar_project.service.CarModelService;

public class CarReadCustomerHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {

		String code = req.getParameter("carCode");
		
		CarModel carmodel = new CarModel();
		carmodel.setCarCode(code);
		CarModelService service = CarModelService.getInstance();
		carmodel = service.selectCarModelByNo(carmodel);
		
		req.setAttribute("carmodel", carmodel);
		return "/WEB-INF/view/car/carreadcustomer.jsp";
	}

}
