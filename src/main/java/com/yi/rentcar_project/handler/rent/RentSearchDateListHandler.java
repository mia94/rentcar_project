package com.yi.rentcar_project.handler.rent;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.codehaus.jackson.map.ObjectMapper;

import com.yi.rentcar_project.model.AUTH;
import com.yi.rentcar_project.model.Customer;
import com.yi.rentcar_project.model.Rent;
import com.yi.rentcar_project.model.RentDate;
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
			
			RentDate d = new RentDate();
			d.setChk_start_date(searchStartDate);
			d.setChk_end_date(searchEndDate);
			
			//아이디
			AUTH auth = (AUTH) req.getSession().getAttribute("AUTH");		
			d.setChk_id(auth.getId());
			
			List<Rent> list = service.getRentList(d);
			
			//json
			ObjectMapper om = new ObjectMapper();
			String json = om.writeValueAsString(list);
			
			//브라우저로 json 데이터 전송
			res.setContentType("application/json;charset=utf-8");
			PrintWriter pw = res.getWriter();
			pw.println(json);
			pw.flush();
						
		}
		return null;
	}

}
