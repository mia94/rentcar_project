package com.yi.rentcar_project.handler.management;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yi.rentcar_project.model.Grade;
import com.yi.rentcar_project.mvc.CommandHandler;
import com.yi.rentcar_project.service.GradeService;

public class GradeDeleteHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		String code = req.getParameter("code");


		Grade grade = new Grade();
		grade.setCode(code);

		GradeService service = GradeService.getInstance();
		service.deleteGrade(grade);

		return "gradeList.do";
	}

}
