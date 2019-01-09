package com.yi.rentcar_project.handler.car;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yi.rentcar_project.model.CarType;
import com.yi.rentcar_project.mvc.CommandHandler;
import com.yi.rentcar_project.service.CarTypeService;

public class CarTypeUploadHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		if(req.getMethod().equalsIgnoreCase("get")){
			return "/WEB-INF/view/car/cartypeupload.jsp";
		}else if(req.getMethod().equalsIgnoreCase("post")){
			String code = req.getParameter("code");
			String type = req.getParameter("type");
			
			CarType cartype = new CarType();
			cartype.setCode(code);
			cartype.setType(type);
			
			CarTypeService service = CarTypeService.getInstance();
			service.insertCarType(cartype);
			
			return "caroptionlist.do";
		}
		return null;
	}

}
