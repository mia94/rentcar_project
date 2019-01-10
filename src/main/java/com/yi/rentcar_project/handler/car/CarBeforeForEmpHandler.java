package com.yi.rentcar_project.handler.car;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yi.rentcar_project.model.CarModel;
import com.yi.rentcar_project.mvc.CommandHandler;
import com.yi.rentcar_project.service.CarModelService;

public class CarBeforeForEmpHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		String code = req.getParameter("carCode");
		String sCode = code.substring(1);
		int num = Integer.parseInt(sCode) - 1;//숫자로 출력 앞에 0 사라짐
		String beforeCode = String.format("V%03d", num);
		
		CarModel model = new CarModel();
		model.setCarCode(beforeCode);
		
		CarModelService service = CarModelService.getInstance();
		if(beforeCode.equals("V000")){
			return "carreadcustomer.do?carCode="+code;
		}
		model = service.selectCarModelByNo(model);
		
		return "carread.do?carCode="+beforeCode;
	}

}
