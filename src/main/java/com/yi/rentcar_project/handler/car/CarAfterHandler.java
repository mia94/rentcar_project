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
		String sCode = code.substring(1);
		int num = Integer.parseInt(sCode) + 1;//숫자로 출력 앞에 0 사라짐
		String afterCode = String.format("V%03d", num);
		
		CarModel model = new CarModel();
		model.setCarCode(afterCode);
		
		CarModelService service = CarModelService.getInstance();
		model = service.selectCarModelByNo(model);
		//해당 모델이 없으면 원래창으로 돌아가야함
		
		return "carreadcustomer.do?carCode="+afterCode;
	}

}
