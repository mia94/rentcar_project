package com.yi.rentcar_project.handler.carchart;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yi.rentcar_project.model.Brand;
import com.yi.rentcar_project.model.StateCar;
import com.yi.rentcar_project.mvc.CommandHandler;
import com.yi.rentcar_project.service.BrandService;
import com.yi.rentcar_project.service.RentService;

public class CarLineChartHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {

		//브랜드 이름 가져오기
		BrandService brandService = BrandService.getInstance();
		/*List<Brand> brandlist = brandService.selectBrandByAll();
		String[] arrBrand = null;
		for(int i=0;i<brandlist.size();i++){
			arrBrand[i] = brandlist.get(i).getName();
		}*/
		String[] arrBrand = {"kia","hyundai","bmw","포드","쉐보레","르노삼성"};
		req.setAttribute("arrBrand", arrBrand);
		
		//월별 브랜드별 렌트 수 데이터 가져오기
		RentService rentService = RentService.getInstance();
		List<StateCar> kialist = rentService.selectCountRentByMonthWithBrand(arrBrand[0]);
		req.setAttribute("kialist", kialist);
		
		List<StateCar> hyunlist = rentService.selectCountRentByMonthWithBrand(arrBrand[1]);
		req.setAttribute("hyunlist", hyunlist);
		
		List<StateCar> bmwlist = rentService.selectCountRentByMonthWithBrand(arrBrand[2]);
		req.setAttribute("bmwlist", bmwlist);
		
		List<StateCar> fordlist = rentService.selectCountRentByMonthWithBrand(arrBrand[3]);
		req.setAttribute("fordlist", fordlist);
		
		List<StateCar> svrlist = rentService.selectCountRentByMonthWithBrand(arrBrand[4]);
		req.setAttribute("svrlist", svrlist);
		
		List<StateCar> samlist = rentService.selectCountRentByMonthWithBrand(arrBrand[5]);
		req.setAttribute("samlist", samlist);
		
		return "/WEB-INF/view/chart/carlinechart.jsp";
	}

}



















