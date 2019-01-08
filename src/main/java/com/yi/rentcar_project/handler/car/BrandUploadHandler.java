package com.yi.rentcar_project.handler.car;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yi.rentcar_project.mvc.CommandHandler;

public class BrandUploadHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		if(req.getMethod().equalsIgnoreCase("get")){
			
			
			return "/WEB-INF/view/car/brandupload.jsp";
		}else if(req.getMethod().equalsIgnoreCase("post")){
			
			return "/caroptionlist.do";
		}
		return null;
	}

}
