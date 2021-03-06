package com.yi.rentcar_project.handler.rent;

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.codehaus.jackson.map.ObjectMapper;

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
//			System.out.println("테스트");
			String carCode = req.getParameter("carCode");
			String rCode = req.getParameter("rCode");
//			System.out.println("carCode = " + carCode + "rCode" + rCode);
			
			RentService service = RentService.getInstance();
			Rent r = new Rent();
			CarModel cm = new CarModel();
			cm.setCarCode(carCode);
			r.setCar_code(cm);
			r.setCode(rCode);
			
			Map<String, String> map = new HashMap<>();
			map.put("carCode", r.getCar_code().getCarCode());
			map.put("rCode", r.getCode());
//			System.out.println("====> map : " + map);
			
			RentHour rh = service.selectRentHours(map);
//			System.out.println("====> rh : " + rh);
			
			int overdue = rh.getAddPrice();
//			System.out.println("======> overdue : " + overdue);
			
			//json
			ObjectMapper om = new ObjectMapper();
			String json = om.writeValueAsString(overdue);
			
			//브라우저 -> json 데이터 전송
			res.setContentType("application/json;charset=utf-8");
			PrintWriter pw = res.getWriter();
			pw.println(json);
			pw.flush();
		}
		return null;
	}

}
