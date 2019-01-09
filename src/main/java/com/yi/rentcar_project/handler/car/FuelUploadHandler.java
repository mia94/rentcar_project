package com.yi.rentcar_project.handler.car;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yi.rentcar_project.model.Fuel;
import com.yi.rentcar_project.mvc.CommandHandler;
import com.yi.rentcar_project.service.FuelService;

public class FuelUploadHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		if(req.getMethod().equalsIgnoreCase("get")){
			
			return "/WEB-INF/view/car/fuelupload.jsp";
		}else if(req.getMethod().equalsIgnoreCase("post")){
			String sNo = req.getParameter("no");//숫자로 변환 필요
			String code = req.getParameter("code");
			int no = Integer.parseInt(sNo);
			
			Fuel fuel = new Fuel();
			fuel.setNo(no);
			fuel.setCode(code);
			
			FuelService service = FuelService.getInstance();
			service.insertFuel(fuel);
			
			return "caroptionlist.do";
		}
		return null;
	}

}
