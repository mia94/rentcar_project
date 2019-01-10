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

public class CarModifyHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		if(req.getMethod().equalsIgnoreCase("get")){
			String code = req.getParameter("carCode");
			
			CarModel carmodel = new CarModel();
			carmodel.setCarCode(code);
			
			CarModelService service = CarModelService.getInstance();
			carmodel =  service.selectCarModelByNo(carmodel);
			
			req.setAttribute("carmodel", carmodel);
			return "/WEB-INF/view/car/carmodify.jsp";
		}else if(req.getMethod().equalsIgnoreCase("post")){
			String code = req.getParameter("car_code");
			String name = req.getParameter("name");
			String sBrand = req.getParameter("brand");
			String sCartype = req.getParameter("cartype");
			String fuel_code = req.getParameter("fuel_code");
			String gear = req.getParameter("gear");
			String color = req.getParameter("color");
			String sBasic = req.getParameter("basic_charge");
			String h6 = req.getParameter("hour6");
			String h10 = req.getParameter("hour10");
			String h12 = req.getParameter("hour12");
			String hElse = req.getParameter("hour_else");
			//브랜드, 차종, 연료
			Brand brand = new Brand();
			brand.setNo(sBrand);
			BrandService brandService = BrandService.getInstance();
			brand = brandService.selectBrandByNo(brand);
			
			CarType cartype = new CarType();
			cartype.setCode(sCartype);
			CarTypeService typeService = CarTypeService.getInstance();
			cartype = typeService.selectCarTypeByNo(cartype);
			
			Fuel fuel = new Fuel();
			fuel.setCode(fuel_code);
			FuelService fuelService = FuelService.getInstance();
			fuel = fuelService.selectFuelByNo(fuel);
			
			//가격 String int로 변환
			int basic_charge = Integer.parseInt(sBasic);
			int hour6 = Integer.parseInt(h6);
			int hour10 = Integer.parseInt(h10);
			int hour12 = Integer.parseInt(h12);
			int hourElse = Integer.parseInt(hElse);
			
			CarModelService service = CarModelService.getInstance();
			//carModel 수정, isrent, rentCnt처리 미완성
			CarModel model = new CarModel(code, name, color, gear, brand, cartype, basic_charge, hour6, hour10, hour12, hourElse, fuel, false, 0);
			
			service.updateCarModel(model);
			
			return "carread.do?carCode="+code;
		}
		return null;
	}

}





















