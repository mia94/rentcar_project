package com.yi.rentcar_project.handler.management;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yi.rentcar_project.model.Grade;
import com.yi.rentcar_project.mvc.CommandHandler;
import com.yi.rentcar_project.service.GradeService;

public class GradeListHandler implements CommandHandler{

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		// TODO Auto-generated method stub
		GradeService gradeService = GradeService.getInstance();
		List<Grade> gradeList = gradeService.selectGradeByAll();
		req.setAttribute("gradeList", gradeList);
		
		return "/WEB-INF/view/management/gradeList.jsp";
	}

}
