package com.yi.rentcar_project.handler.car;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yi.rentcar_project.model.CarOption;
import com.yi.rentcar_project.mvc.CommandHandler;
import com.yi.rentcar_project.service.CarOptionService;

public class CaroptionUploadHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		if(req.getMethod().equalsIgnoreCase("get")){
			return "/WEB-INF/view/car/caroptionupload.jsp";
		}else if(req.getMethod().equalsIgnoreCase("post")){
			String sCode = req.getParameter("code");
			String name = req.getParameter("name");
			String sPrice = req.getParameter("price");
			
			int code = Integer.parseInt(sCode);
			int price = Integer.parseInt(sPrice);
			
			CarOption option = new CarOption();
			option.setNo(code);
			option.setName(name);
			option.setPrice(price);
			
			CarOptionService service = CarOptionService.getInstance();
			service.insertCarOption(option);
			
			return "caroptionlist.do";
		}
		return null;
	}

}
