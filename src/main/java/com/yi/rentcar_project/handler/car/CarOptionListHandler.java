package com.yi.rentcar_project.handler.car;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yi.rentcar_project.model.Brand;
import com.yi.rentcar_project.model.CarOption;
import com.yi.rentcar_project.model.CarType;
import com.yi.rentcar_project.model.Fuel;
import com.yi.rentcar_project.mvc.CommandHandler;
import com.yi.rentcar_project.service.BrandService;
import com.yi.rentcar_project.service.CarOptionService;
import com.yi.rentcar_project.service.CarTypeService;
import com.yi.rentcar_project.service.FuelService;

public class CarOptionListHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		if(req.getMethod().equalsIgnoreCase("get")){
			BrandService brandService = BrandService.getInstance();
			CarOptionService optionservice = CarOptionService.getInstance();
			FuelService fuelService = FuelService.getInstance();
			CarTypeService typeService = CarTypeService.getInstance();
			
			List<Brand> brandList = brandService.selectBrandByAll();
			List<CarOption> optionList = optionservice.selectCarOptionByAll();
			List<Fuel> fuelList = fuelService.selectFuelByAll();
			List<CarType> typeList = typeService.selectCarTypeByAll();
			
			req.setAttribute("brandList", brandList);
			req.setAttribute("optionList", optionList);
			req.setAttribute("fuelList", fuelList);
			req.setAttribute("typeList", typeList);
			
			return "/WEB-INF/view/car/caroptionlist.jsp";
			
		}else if(req.getMethod().equalsIgnoreCase("post")){
			
		}
		return null;
	}

}
