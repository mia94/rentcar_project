package com.yi.rentcar_project.handler.car;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yi.rentcar_project.model.CarModel;
import com.yi.rentcar_project.mvc.CommandHandler;
import com.yi.rentcar_project.service.CarModelService;

public class CarAfterHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		String code = req.getParameter("carCode");
		//해당모델이 없으면 원래화면 유지
		CarModelService service = CarModelService.getInstance();
		String maxCode = service.nextCarCode();
		if(code.equals(maxCode)){
			return "carreadcustomer.do?carCode="+code;
		}
		
		String sCode = code.substring(1);
		int num = Integer.parseInt(sCode) + 1;//숫자로 출력 앞에 0 사라짐
		String afterCode = String.format("V%03d", num);
		return "carreadcustomer.do?carCode="+afterCode;
	}

}
