package com.yi.rentcar_project.handler.car;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yi.rentcar_project.model.CarOption;
import com.yi.rentcar_project.mvc.CommandHandler;
import com.yi.rentcar_project.service.CarOptionService;

public class CarOptionDeleteHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		String sNo = req.getParameter("no");
		int no = Integer.parseInt(sNo);
		
		CarOption option = new CarOption();
		option.setNo(no);
		
		CarOptionService service = CarOptionService.getInstance();
		service.deleteCarOption(option);
		
		return "caroptionlist.do";
	}

}
