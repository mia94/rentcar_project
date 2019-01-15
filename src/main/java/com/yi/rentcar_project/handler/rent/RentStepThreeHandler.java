package com.yi.rentcar_project.handler.rent;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yi.rentcar_project.model.AUTH;
import com.yi.rentcar_project.model.Customer;
import com.yi.rentcar_project.mvc.CommandHandler;
import com.yi.rentcar_project.service.RentService;

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
			
			//가격정보
			String basicPrice = req.getParameter("basicPrice");
			String dPrice = req.getParameter("dPrice");
			String iPrice = req.getParameter("iPrice");
			String carOptPrice = req.getParameter("carOptPrice");
			String totalRentPrice = req.getParameter("totalRentPrice");
			
			//아이디
			AUTH auth = (AUTH) req.getSession().getAttribute("AUTH");
			
			RentService service = RentService.getInstance();
			List<Customer> list = service.selectById(auth.getId());
			
			req.setAttribute("sDate", sDate);
			req.setAttribute("sHour", sHour);
			req.setAttribute("sMin", sMin);
			
			req.setAttribute("eDate", eDate);
			req.setAttribute("eHour", eHour);
			req.setAttribute("eMin", eMin);
			
			req.setAttribute("cName", cName);
			req.setAttribute("cCode", cCode);
			
			req.setAttribute("basicPrice", basicPrice);
			req.setAttribute("dPrice", dPrice);
			req.setAttribute("iPrice", iPrice);
			req.setAttribute("carOptPrice", carOptPrice);
			req.setAttribute("totalRentPrice", totalRentPrice);
			
			req.setAttribute("list", list);
			
			return "/WEB-INF/view/rent/rentStepThree.jsp";
		}
		return null;
	}

}
