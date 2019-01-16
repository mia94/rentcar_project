package com.yi.rentcar_project.handler.rent;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yi.rentcar_project.model.AUTH;
import com.yi.rentcar_project.model.Customer;
import com.yi.rentcar_project.model.Rent;
import com.yi.rentcar_project.mvc.CommandHandler;
import com.yi.rentcar_project.service.RentService;

public class RentChkListHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		// TODO Auto-generated method stub
		if(req.getMethod().equalsIgnoreCase("get")){
			
			RentService service = RentService.getInstance();
			//아이디
			AUTH auth = (AUTH) req.getSession().getAttribute("AUTH");
			
			Customer c = service.getCustomercodeById(auth.getId());
			
			List<Rent> list = service.selectRentAllByCustomerCode(c.getCode());
			
			req.setAttribute("list", list);
			
			return "/WEB-INF/view/rent/rentChkList.jsp";
		}
		return null;
	}

}
