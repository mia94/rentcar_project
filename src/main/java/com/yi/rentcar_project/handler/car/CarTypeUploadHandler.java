package com.yi.rentcar_project.handler.car;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yi.rentcar_project.model.CarType;
import com.yi.rentcar_project.mvc.CommandHandler;
import com.yi.rentcar_project.service.CarTypeService;

public class CarTypeUploadHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		CarTypeService service = CarTypeService.getInstance();
		
		if(req.getMethod().equalsIgnoreCase("get")){

			String maxCode = service.nextTypeCode();
			String sCode = maxCode.substring(1);
			int num = Integer.parseInt(sCode) + 1;//숫자로 출력 앞에 0 사라짐
			String nextCode = "S"+num;
			
			req.setAttribute("nextCode", nextCode);
			
			return "/WEB-INF/view/car/cartypeupload.jsp";
		}else if(req.getMethod().equalsIgnoreCase("post")){
			String code = req.getParameter("code");
			String type = req.getParameter("type");
			
			CarType cartype = new CarType();
			cartype.setCode(code);
			cartype.setType(type);

			service.insertCarType(cartype);
			
			return "caroptionlist.do";
		}
		return null;
	}

}
