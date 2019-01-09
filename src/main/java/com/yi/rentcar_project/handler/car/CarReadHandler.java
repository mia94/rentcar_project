package com.yi.rentcar_project.handler.car;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yi.rentcar_project.model.CarModel;
import com.yi.rentcar_project.mvc.CommandHandler;
import com.yi.rentcar_project.service.CarModelService;

public class CarReadHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		if(req.getMethod().equalsIgnoreCase("get")){
			String code = req.getParameter("carCode");
			
			CarModel carmodel = new CarModel();
			carmodel.setCarCode(code);
			CarModelService service = CarModelService.getInstance();
			carmodel = service.selectCarModelByNo(carmodel);
			
			System.out.println(carmodel);//브랜드, 차종, 연료 null 출력
			
			req.setAttribute("carmodel", carmodel);
			return "/WEB-INF/view/car/carread.jsp";
		}else if(req.getMethod().equalsIgnoreCase("post")){
			
		}
		return null;
	}

}
