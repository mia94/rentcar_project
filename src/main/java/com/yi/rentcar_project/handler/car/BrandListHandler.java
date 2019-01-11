package com.yi.rentcar_project.handler.car;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yi.rentcar_project.model.Brand;
import com.yi.rentcar_project.mvc.CommandHandler;
import com.yi.rentcar_project.service.BrandService;

public class BrandListHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		BrandService brandService = BrandService.getInstance();
		List<Brand> brandList = brandService.selectBrandByAll();
		req.setAttribute("brandList", brandList);
		
		return "/WEB-INF/view/car/brandlist.jsp";
	}

}
