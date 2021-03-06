package com.yi.rentcar_project.handler.carchart;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yi.rentcar_project.model.Brand;
import com.yi.rentcar_project.model.CarModel;
import com.yi.rentcar_project.model.CarType;
import com.yi.rentcar_project.model.StateCar;
import com.yi.rentcar_project.mvc.CommandHandler;
import com.yi.rentcar_project.service.BrandService;
import com.yi.rentcar_project.service.CarModelService;
import com.yi.rentcar_project.service.CarTypeService;
import com.yi.rentcar_project.service.RentService;
import com.yi.rentcar_project.service.StateCarService;

public class CarMainChartHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		/////////////////////////브랜드
		StateCarService service = StateCarService.getInstance();
		List<StateCar> cblist = service.selectCountByBrand();
		req.setAttribute("cblist", cblist);
		
		//코드 브랜드 명으로 변경
		BrandService bservice = BrandService.getInstance();
		List<Brand> blist = bservice.selectBrandByAll();
		req.setAttribute("blist", blist);
		
		/////////////////////////type
		List<StateCar> tclist = service.selectCountByCarType();
		req.setAttribute("tclist", tclist);
		//차종 이름나오게 하기
		CarTypeService typeService = CarTypeService.getInstance();
		List<CarType> tlist = typeService.selectCarTypeByAll();
		req.setAttribute("tlist", tlist);
		
		/////////////////////////line
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
		
		///////////////////////////////////bar
		CarModelService mService = CarModelService.getInstance();
		List<CarModel> list = mService.selectCarModelByAll();

		int[] line = new int[list.size()];
		for(int i =0;i<list.size();i++){
			line[i] = list.get(i).getRentCnt();
		}
		
		req.setAttribute("list", list);
		req.setAttribute("line", line);
		
		return "/WEB-INF/view/chart/chartmain.jsp";
	}

}
