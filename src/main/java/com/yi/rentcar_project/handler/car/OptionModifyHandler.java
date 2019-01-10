package com.yi.rentcar_project.handler.car;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yi.rentcar_project.model.CarOption;
import com.yi.rentcar_project.mvc.CommandHandler;
import com.yi.rentcar_project.service.CarOptionService;

public class OptionModifyHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		if(req.getMethod().equalsIgnoreCase("get")){
			String sNo = req.getParameter("no");
			int no = Integer.parseInt(sNo);
			
			CarOption option = new CarOption();
			option.setNo(no);
			
			CarOptionService service = CarOptionService.getInstance();
			option = service.selectCarOptionByNo(option);
			
			req.setAttribute("option", option);
			return "/WEB-INF/view/car/caroptionmodify.jsp";
			
		}else if(req.getMethod().equalsIgnoreCase("post")){
			String sNo = req.getParameter("no");
			String name = req.getParameter("name");
			String sPrice = req.getParameter("price");
			
			int no = Integer.parseInt(sNo);
			int price = Integer.parseInt(sPrice);
			
			CarOption option = new CarOption();
			option.setNo(no);
			option.setName(name);
			option.setPrice(price);
			
			CarOptionService service = CarOptionService.getInstance();
			service.updateCarOption(option);
			
			return "caroptionlist.do";
		}
		return null;
	}

}
