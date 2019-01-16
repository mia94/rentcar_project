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

public class CarUploadHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		if(req.getMethod().equalsIgnoreCase("get")){
			//다음번호 자동 추가
			CarModelService modelService = CarModelService.getInstance();
			String maxCode = modelService.nextCarCode();
			String sCode = maxCode.substring(1);
			int num = Integer.parseInt(sCode) + 1;//숫자로 출력 앞에 0 사라짐
			String nextCode = String.format("V%03d", num);
			
			req.setAttribute("nextCode", nextCode);
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
			
			return "/WEB-INF/view/car/carupload.jsp";
		}else if(req.getMethod().equalsIgnoreCase("post")){
			//사진추가
			String uploadPath = req.getRealPath("upload");
			
			File dir = new File(uploadPath);
			if(dir.exists()==false){//업로드 폴더가 없을때 만들어지도록
				dir.mkdirs();
			}
			
			try {
				
				MultipartRequest multi = new MultipartRequest(req, uploadPath, 1024*1024*10, "utf-8",new DefaultFileRenamePolicy());
				
				String file = multi.getFilesystemName("carImg");
				req.setAttribute("carImg", file);
				
				String car_code = multi.getParameter("car_code");
				//받아온 carcode로 이미지 파일명 변경
				String newfileName = car_code+".png";
				File oldFile = new File(uploadPath+"\\"+file);
				File newFile = new File(uploadPath+"\\"+newfileName);
				oldFile.renameTo(newFile);//결과물 : 폴더이름이 바뀜ㅠㅠ

				String name = multi.getParameter("name");
				String brandCode = multi.getParameter("brand");
				String cartypeCode = multi.getParameter("cartype");
				String fuelCode = multi.getParameter("fuel_code");
				String color = multi.getParameter("color");
				String gear = multi.getParameter("gear");
				String basic = multi.getParameter("basic_charge");
				String h6 = multi.getParameter("hour6");
				String h10 = multi.getParameter("hour10");
				String h12 = multi.getParameter("hour12");
				String helse = multi.getParameter("hour_else");
				
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
	
	/*public static String nullOrEmptyToReplaceString(String str, String replaceStr) {
		if (str == null || "".equals(str)) {
			System.out.println("nullOrEmptyToReplaceString if문 안에 들어옴");
			return replaceStr;
		}
		System.out.println("nullOrEmptyToReplaceString 실패");
		return null;
		}*/

}
