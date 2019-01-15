package com.yi.rentcar_project.handler.carchart;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yi.rentcar_project.model.CarType;
import com.yi.rentcar_project.model.StateCar;
import com.yi.rentcar_project.mvc.CommandHandler;
import com.yi.rentcar_project.service.CarTypeService;
import com.yi.rentcar_project.service.StateCarService;

public class CarTypeChartHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		// TODO Auto-generated method stub
		StateCarService service = StateCarService.getInstance();
		List<StateCar> list = service.selectCountByCarType();
		req.setAttribute("list", list);
		//차종 이름나오게 하기
		CarTypeService typeService = CarTypeService.getInstance();
		List<CarType> tlist = typeService.selectCarTypeByAll();
		req.setAttribute("tlist", tlist);
		
		return "/WEB-INF/view/chart/cartypechart.jsp";
	}

}
