package com.yi.rentcar_project.handler.rent;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.codehaus.jackson.map.ObjectMapper;

import com.yi.rentcar_project.model.Rent;
import com.yi.rentcar_project.model.RentDate;
import com.yi.rentcar_project.mvc.CommandHandler;
import com.yi.rentcar_project.service.RentService;

public class RentSearchDateListManageHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		// TODO Auto-generated method stub
		if(req.getMethod().equalsIgnoreCase("post")){
//			System.out.println("json 데이터 보내지는지 테스트");
			String searchStartDate1 = req.getParameter("searchStartDate1");
			String searchEndDate1 = req.getParameter("searchEndDate1");
			
			RentService service = RentService.getInstance();
			RentDate d = new RentDate();
			
			d.setChk_start_date(searchStartDate1);
			d.setChk_end_date(searchEndDate1);
			
			List<Rent> list = service.selectRentByAllWithDate(d);
			
			//json
			ObjectMapper om = new ObjectMapper();
			String json = om.writeValueAsString(list);
			
			//브라우저 -> json 데이터 전송
			res.setContentType("application/json;charset=utf-8");
			PrintWriter pw = res.getWriter();
			pw.println(json);
			pw.flush();
			
		}
		return null;
	}

}
