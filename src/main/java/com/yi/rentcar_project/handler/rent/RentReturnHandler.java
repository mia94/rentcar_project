package com.yi.rentcar_project.handler.rent;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yi.rentcar_project.mvc.CommandHandler;
import com.yi.rentcar_project.service.RentService;

public class RentReturnHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		// TODO Auto-generated method stub
		if(req.getMethod().equalsIgnoreCase("get")){
			//대여코드 넘어와야 함
			String code = req.getParameter("code");
			
			RentService service = RentService.getInstance();
			
			int isReturn = service.changeisReturn(code);
			if(isReturn < 0){
				System.out.println("수정에 실패했습니다. isReturn = " + isReturn );
			}
			
			req.setAttribute("isReturn", isReturn);
			res.sendRedirect("rentListRead.do?code=" + code);
		}
		return null;
	}

}
