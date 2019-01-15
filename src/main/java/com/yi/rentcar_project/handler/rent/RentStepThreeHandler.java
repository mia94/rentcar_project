package com.yi.rentcar_project.handler.rent;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yi.rentcar_project.mvc.CommandHandler;

public class RentStepThreeHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		// TODO Auto-generated method stub
		if(req.getMethod().equalsIgnoreCase("post")){
			//대여일
			String sDate = req.getParameter("sDate");
			String sHour = req.getParameter("sHour");
			String sMin = req.getParameter("sMin");
			//반납일
			String eDate = req.getParameter("eDate");
			String eHour = req.getParameter("eHour");
			String eMin = req.getParameter("eMin");
			
			//차량
			String cName = req.getParameter("cName");
			String cCode = req.getParameter("cCode");
			
			req.setAttribute("sDate", sDate);
			req.setAttribute("sHour", sHour);
			req.setAttribute("sMin", sMin);
			
			req.setAttribute("eDate", eDate);
			req.setAttribute("eHour", eHour);
			req.setAttribute("eMin", eMin);
			
			req.setAttribute("cName", cName);
			req.setAttribute("cCode", cCode);
			
			return "/WEB-INF/view/rent/rentStepThree.jsp";
		}
		return null;
	}

}
