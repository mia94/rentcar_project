package com.yi.rentcar_project.handler.car;

import java.io.File;

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

public class CarUploadHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		if(req.getMethod().equalsIgnoreCase("get")){
			return "/WEB-INF/view/car/carupload.jsp";
		}else if(req.getMethod().equalsIgnoreCase("post")){
			//사진추가
			String uploadPath = req.getRealPath("upload");
			
			File dir = new File(uploadPath);
			if(dir.exists()==false){//업로드 폴더가 없을때 만들어지도록
				dir.mkdirs();
			}
			
			try {
				MultipartRequest multi = new MultipartRequest(req,
															uploadPath,//서버측 업로드
															1024*1024*10,//10M
															new DefaultFileRenamePolicy()
															);
				
				String file = multi.getFilesystemName("carImg");//file1의 키의 파일의 이름을 받아옴
				req.setAttribute("carImg", file);
				
				String car_code = multi.getParameter("car_code");
				String name = multi.getParameter("name");
				String brandCode = multi.getParameter("brand");
				String cartypeCode = multi.getParameter("cartype");
				String fuelCode = multi.getParameter("fuel_code");
				String color = multi.getParameter("color");
				String gear = multi.getParameter("gear");
				String basic = multi.getParameter("basic_charge").trim();
				String h6 = multi.getParameter("hour6").trim();
				String h10 = multi.getParameter("hour10").trim();
				String h12 = multi.getParameter("hour12").trim();
				String helse = multi.getParameter("hour_else").trim();
				
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
				
				
			} catch (Exception e) {
				e.printStackTrace();
			}			

			return "carlist.do";
		}
		return null;
	}

}
