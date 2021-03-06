package com.yi.rentcar_project.handler.rent;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yi.rentcar_project.model.CarModel;
import com.yi.rentcar_project.mvc.CommandHandler;
import com.yi.rentcar_project.service.RentService;

public class RentStepOneHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		// TODO Auto-generated method stub
		if(req.getMethod().equalsIgnoreCase("get")){
			return "/WEB-INF/view/rent/rentStepOne.jsp";
			
		} else if(req.getMethod().equalsIgnoreCase("post")){
			String start = req.getParameter("startDate");
			String startH = req.getParameter("startHour");
			String startM = req.getParameter("startMin");
			String end = req.getParameter("endDate");
			String endH = req.getParameter("endHour");
			String endM = req.getParameter("endMin");
			String carType = req.getParameter("selectCarType");
			String rentDate = req.getParameter("totalRentDate");
			
			//차량유형 선택
			RentService service = RentService.getInstance();
			List<CarModel> list = service.selectByCarType(carType);
					
			req.setAttribute("start", start);
			req.setAttribute("startH", startH);
			req.setAttribute("startM", startM);
			req.setAttribute("end", end);
			req.setAttribute("endH", endH);
			req.setAttribute("endM", endM);
			req.setAttribute("list", list);
			req.setAttribute("rentDate", rentDate);
			req.setAttribute("carType", carType);
			
			return "/WEB-INF/view/rent/rentStepOne.jsp";
		}
		
		return null;
	}

}
