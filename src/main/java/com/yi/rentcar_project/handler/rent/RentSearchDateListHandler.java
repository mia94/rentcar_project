package com.yi.rentcar_project.handler.rent;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yi.rentcar_project.model.AUTH;
import com.yi.rentcar_project.model.Customer;
import com.yi.rentcar_project.model.Rent;
import com.yi.rentcar_project.mvc.CommandHandler;
import com.yi.rentcar_project.service.RentService;

public class RentSearchDateListHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		// TODO Auto-generated method stub
		if(req.getMethod().equalsIgnoreCase("post")){
			String searchStartDate = req.getParameter("searchStartDate");
			String searchEndDate = req.getParameter("searchEndDate");
			
			RentService service = RentService.getInstance();
			
			List<Rent> list = service.getRentList(searchStartDate, searchEndDate);
			
			req.setAttribute("list", list);
			
			return "/WEB-INF/view/rent/rentChkList.jsp";
			
		}
		return null;
	}

}
