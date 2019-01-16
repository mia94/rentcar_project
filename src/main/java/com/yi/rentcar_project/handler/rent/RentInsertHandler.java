package com.yi.rentcar_project.handler.rent;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yi.rentcar_project.model.CarModel;
import com.yi.rentcar_project.model.Customer;
import com.yi.rentcar_project.model.Insurance;
import com.yi.rentcar_project.model.Rent;
import com.yi.rentcar_project.mvc.CommandHandler;
import com.yi.rentcar_project.service.RentService;

public class RentInsertHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		// TODO Auto-generated method stub
		if(req.getMethod().equalsIgnoreCase("post")){
			//값 받아오기
			String startTime = req.getParameter("startTime");
			String startDate = req.getParameter("startDate");
			String endDate = req.getParameter("endDate");
			String endTime = req.getParameter("endTime");
			
			String isReturn = req.getParameter("isReturn");
			int numIsReturn = Integer.parseInt(isReturn);
			
			String bp = req.getParameter("basicPrice");
			int price = Integer.parseInt(bp);
			
			String cCode = req.getParameter("cCode");
			String cstmCode = req.getParameter("cstmCode");
			String iCode = req.getParameter("iCode");
			String eCode = req.getParameter("eCode");
			
			String optionPrice = req.getParameter("optionPrice");
			int optPrice = Integer.parseInt(optionPrice);
			
			RentService service = RentService.getInstance();
			Rent r = new Rent();
			r.setStart_date(startDate);
			r.setStart_time(startTime);
			r.setEnd_date(endDate);
			r.setEnd_time(endTime);
			r.setIs_return(numIsReturn == 0 ? false : true);
			r.setBasic_price(price);
			r.setCar_code(new CarModel(cCode));
			
			Customer c = new Customer();
			c.setCode(cstmCode);
			r.setCustomer_code(c);
			
			r.setInsurance_code(new Insurance(iCode));
			r.setE_code(eCode);
			r.setOpt_price(optPrice);
			
			int isInsert = service.insert(r);
			
			if(isInsert < 0){
				System.out.println("추가에 실패했습니다. isInsert " + isInsert);
			}
			
			req.setAttribute("isInsert", isInsert);
			
			return "/WEB-INF/view/rent/rentSuccess.jsp";
		}
		return null;
	}

}
