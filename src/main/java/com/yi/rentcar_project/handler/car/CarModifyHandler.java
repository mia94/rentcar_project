package com.yi.rentcar_project.handler.car;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
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
			//브랜드 자동 추가
			BrandService brandService = BrandService.getInstance();
			List<Brand> brandList = brandService.selectBrandByAll();
			req.setAttribute("brandList", brandList);
			//차종 자동추가
			CarTypeService typeService = CarTypeService.getInstance();
			List<CarType> typeList = typeService.selectCarTypeByAll();
			req.setAttribute("typeList", typeList);
			//연료 자동추가
			FuelService fuelService = FuelService.getInstance();
			List<Fuel> fuelList = fuelService.selectFuelByAll();
			req.setAttribute("fuelList", fuelList);
			
			return "/WEB-INF/view/car/carmodify.jsp";
		}else if(req.getMethod().equalsIgnoreCase("post")){
			//사진추가
			String uploadPath = req.getRealPath("upload");
			
			File dir = new File(uploadPath);
			if(dir.exists()==false){//업로드 폴더가 없을때 만들어지도록
				dir.mkdirs();
			}
			
			try {
			MultipartRequest multi = new MultipartRequest(req, uploadPath, 1024*1024*10, "utf-8",new DefaultFileRenamePolicy());
			
			String file = multi.getFilesystemName("carImg");//file1의 키의 파일의 이름을 받아옴
			req.setAttribute("carImg", file);
			
			String code = multi.getParameter("car_code");
			String name = multi.getParameter("name");
			String sBrand = multi.getParameter("brand");
			String sCartype = multi.getParameter("cartype");
			String fuel_code = multi.getParameter("fuel_code");
			String gear = multi.getParameter("gear");
			String color = multi.getParameter("color");
			String sBasic = multi.getParameter("basic_charge");
			String h6 = multi.getParameter("hour6");
			String h10 = multi.getParameter("hour10");
			String h12 = multi.getParameter("hour12");
			String hElse = multi.getParameter("hour_else");
			String is_rent = multi.getParameter("isRent");
			String rent_cnt = multi.getParameter("rentCnt");
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
			
			//가격, rentCnt String int로 변환
			int basic_charge = Integer.parseInt(sBasic);
			int hour6 = Integer.parseInt(h6);
			int hour10 = Integer.parseInt(h10);
			int hour12 = Integer.parseInt(h12);
			int hourElse = Integer.parseInt(hElse);
			int rentCnt = Integer.parseInt(rent_cnt);
			//String boolean으로 변환
			boolean isRent = false;
			if(is_rent.equalsIgnoreCase("true")){
				isRent = true;
			}
			
			CarModelService service = CarModelService.getInstance();
			//carModel 수정, isrent, rentCnt처리 미완성
			CarModel model = new CarModel(code, name, color, gear, brand, cartype, basic_charge, hour6, hour10, hour12, hourElse, fuel, isRent, rentCnt);
			
			service.updateCarModel(model);
			return "carread.do?carCode="+code;
			
			} catch (Exception e) {
				e.printStackTrace();
			}			

		}
		return null;
	}

}





















