package com.yi.rentcar_project.handler.car;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yi.rentcar_project.model.Brand;
import com.yi.rentcar_project.model.CarModel;
import com.yi.rentcar_project.model.CarType;
import com.yi.rentcar_project.model.Fuel;
import com.yi.rentcar_project.mvc.CommandHandler;
import com.yi.rentcar_project.service.BrandService;
import com.yi.rentcar_project.service.CarModelService;
import com.yi.rentcar_project.service.CarTypeService;
import com.yi.rentcar_project.service.FuelService;

public class CarUploadHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		if(req.getMethod().equalsIgnoreCase("get")){
			return "/WEB-INF/view/car/carupload.jsp";
		}else if(req.getMethod().equalsIgnoreCase("post")){
			String car_code = req.getParameter("car_code");
			String name = req.getParameter("name");
			String brandCode = req.getParameter("brand");
			String cartypeCode = req.getParameter("cartype");
			String fuelCode = req.getParameter("fuel_code");
			String color = req.getParameter("color");
			String gear = req.getParameter("gear");
			String basic = req.getParameter("basic_charge");
			String h6 = req.getParameter("hour6");
			String h10 = req.getParameter("hour10");
			String h12 = req.getParameter("hour12");
			String helse = req.getParameter("hour_else");
			//가격 int로 변환하기
			int basic_charge = Integer.parseInt(basic);
			int hour6 = Integer.parseInt(h6);
			int hour10 = Integer.parseInt(h10);
			int hour12 = Integer.parseInt(h12);
			int hour_else = Integer.parseInt(helse);
			//isRent, rentCnt 0으로 자동입력
			boolean is_rent = false;
			int rent_cnt = 0;
			//Brand, CarType, fuel selectByCode하기
			BrandService brandService = BrandService.getInstance();
			Brand brand = new Brand();
			brand.setNo(brandCode);
			brand = brandService.selectBrandByNo(brand);
			
			CarTypeService typeService = CarTypeService.getInstance();
			CarType type = new CarType();
			type.setCode(cartypeCode);
			type = typeService.selectCarTypeByNo(type);
			
			FuelService fuelService = FuelService.getInstance();
			Fuel fuel = new Fuel();
			fuel.setCode(fuelCode);
			fuel = fuelService.selectFuelByNo(fuel);
			
			//carModel생성하여 set
			CarModel carmodel = new CarModel(car_code, name, color, gear, brand, type, basic_charge, hour6, hour10, hour12, hour_else, fuel, is_rent, rent_cnt);
			CarModelService service = CarModelService.getInstance();
			service.insertCarModel(carmodel);
			
			return "carlist.do";
		}
		return null;
	}

}