package com.yi.rentcar_project.handler.carchart;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yi.rentcar_project.model.Brand;
import com.yi.rentcar_project.model.StateCar;
import com.yi.rentcar_project.mvc.CommandHandler;
import com.yi.rentcar_project.service.BrandService;
import com.yi.rentcar_project.service.StateCarService;

public class BrandChartHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		// TODO Auto-generated method stub
		StateCarService service = StateCarService.getInstance();
		List<StateCar> list = service.selectCountByBrand();
		req.setAttribute("list", list);
		
		//코드 브랜드 명으로 변경
		BrandService bservice = BrandService.getInstance();
		List<Brand> blist = bservice.selectBrandByAll();
		req.setAttribute("blist", blist);
		
		return "/WEB-INF/view/chart/brandchart.jsp";
	}

}
