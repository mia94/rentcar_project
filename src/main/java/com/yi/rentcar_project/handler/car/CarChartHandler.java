package com.yi.rentcar_project.handler.car;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yi.rentcar_project.model.CarModel;
import com.yi.rentcar_project.mvc.CommandHandler;
import com.yi.rentcar_project.service.CarModelService;

public class CarChartHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		
		CarModelService service = CarModelService.getInstance();
		List<CarModel> list = service.selectCarModelByAll();

		int[] line = new int[list.size()];
		for(int i =0;i<list.size();i++){
			int a = list.get(i).getRentCnt();
			line[i] = a;
		}
		
		req.setAttribute("list", list);
		req.setAttribute("line", line);
		
		return "/WEB-INF/view/car/carchart.jsp";
	}

}
