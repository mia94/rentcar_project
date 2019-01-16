package com.yi.rentcar_project.handler.rent;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yi.rentcar_project.mvc.CommandHandler;
import com.yi.rentcar_project.service.RentService;

public class RentChkListReadHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		// TODO Auto-generated method stub
		if(req.getMethod().equalsIgnoreCase("get")){
			//리스트 클릭했을 때 대여코드 받아오기
			String code = req.getParameter("code");
			String name = req.getParameter("name");
			
			RentService service = RentService.getInstance();
			Map<String, Object> map = service.readRentInfo(code);
			
			req.setAttribute("map", map);
			req.setAttribute("name", name);
			
			return "/WEB-INF/view/rent/rentChkListRead.jsp";
		}
		return null;
	}

}
