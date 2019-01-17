package com.yi.rentcar_project.handler.rent;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yi.rentcar_project.model.CarModel;
import com.yi.rentcar_project.model.Rent;
import com.yi.rentcar_project.model.RentHour;
import com.yi.rentcar_project.mvc.CommandHandler;
import com.yi.rentcar_project.service.RentService;

public class RentHourCalculateHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		// TODO Auto-generated method stub
		if(req.getMethod().equalsIgnoreCase("post")){
			String carCode = req.getParameter("carCode");
			String rCode = req.getParameter("rCode");
			
			RentService service = RentService.getInstance();
			Rent r = new Rent();
			CarModel cm = new CarModel();
			cm.setCarCode(carCode);
			r.setCar_code(cm);
			r.setCode(rCode);
			
			Map<String, String> map = new HashMap<>();
			map.put("carCode", r.getCar_code().getCarCode());
			map.put("rCode", r.getCode());
			
			RentHour rh = service.selectRentHours(map);
			
			int overdue = rh.getAddPrice();
			
			req.setAttribute("overdue", overdue);
			
			return "/WEB-INF/view/rent/rentListRead.jsp";
		}
		return null;
	}

}
