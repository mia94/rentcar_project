package com.yi.rentcar_project.handler.management;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yi.rentcar_project.model.Grade;
import com.yi.rentcar_project.mvc.CommandHandler;
import com.yi.rentcar_project.service.GradeService;

public class GradeModifyHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		if(req.getMethod().equalsIgnoreCase("get")){
			String code = req.getParameter("code");
			
			Grade grade = new Grade();
			grade.setCode(code);
			
			GradeService service = GradeService.getInstance();
			grade = service.selectGradeByNo(grade);
			
			req.setAttribute("grade", grade);
			return "/WEB-INF/view/management/gradeModify.jsp";
		}else if(req.getMethod().equalsIgnoreCase("post")){
			
			String code = req.getParameter("code");
			String name = req.getParameter("name");
			String losal = req.getParameter("gLosal");
			String hisal = req.getParameter("gHisal");
			String sRate = req.getParameter("rate");
			
			int gHisal = Integer.parseInt(hisal);
			int gLosal = Integer.parseInt(losal);
			int rate = Integer.parseInt(sRate);
			
			Grade grade = new Grade();
			grade.setCode(code);
			grade.setName(name);
			grade.setgHisal(gHisal);
			grade.setgLosal(gLosal);
			grade.setRate(rate);
			
			GradeService service = GradeService.getInstance();
			service.updateGrade(grade);
			
			return "gradeList.do";
		}
		return null;
	}

}
