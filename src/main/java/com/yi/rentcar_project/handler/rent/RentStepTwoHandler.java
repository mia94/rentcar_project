package com.yi.rentcar_project.handler.rent;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yi.rentcar_project.mvc.CommandHandler;

public class RentStepTwoHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		// TODO Auto-generated method stub
		if(req.getMethod().equalsIgnoreCase("post")){
			//id가 stepOne인 form에서 받아온 값들
			String sDate = req.getParameter("sDate");
			String sHour = req.getParameter("sHour");
			String sMin = req.getParameter("sMin");
			
			String eDate = req.getParameter("eDate");
			String eHour = req.getParameter("eHour");
			String eMin = req.getParameter("eMin");
			
			String rDate = req.getParameter("rDate");
			String carName = req.getParameter("carName");
			String carCode = req.getParameter("carCode");
			String basicPrice = req.getParameter("basicPrice");
			
			req.setAttribute("sDate", sDate);
			req.setAttribute("sHour", sHour);
			req.setAttribute("sMin", sMin);
			
			req.setAttribute("eDate", eDate);
			req.setAttribute("eHour", eHour);
			req.setAttribute("eMin", eMin);
			
			req.setAttribute("rDate", rDate);
			req.setAttribute("carName", carName);
			req.setAttribute("carCode", carCode);
			req.setAttribute("basicPrice", basicPrice);
			
			return "/WEB-INF/view/rent/rentStepTwo.jsp";
		}
		return null;
	}

}
