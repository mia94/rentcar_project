package com.yi.rentcar_project.handler.rent;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yi.rentcar_project.model.Rent;
import com.yi.rentcar_project.mvc.CommandHandler;
import com.yi.rentcar_project.service.RentService;

public class RentIsReturnFalseHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		// TODO Auto-generated method stub
		if(req.getMethod().equalsIgnoreCase("get")){
			RentService service = RentService.getInstance();
			
			List<Rent> list = service.getIsReturnFalse();
			
			req.setAttribute("list", list);
			
			return "/WEB-INF/view/rent/rentList.jsp";
		}
		return null;
	}

}
