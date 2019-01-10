package com.yi.rentcar_project.handler.car;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yi.rentcar_project.model.CarModel;
import com.yi.rentcar_project.mvc.CommandHandler;
import com.yi.rentcar_project.service.CarModelService;

public class CarTypeSelectCustomerHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		String cartype = req.getParameter("cartype");
		
		CarModelService service = CarModelService.getInstance();
		Map<String, String> map = new HashMap<>();
		map.put("cartype", cartype);
		List<CarModel> list = service.SelectCarModelWithWhere(map);
		
		req.setAttribute("list", list);
		return "/WEB-INF/view/car/carlistcustomer.jsp";
	}

}
