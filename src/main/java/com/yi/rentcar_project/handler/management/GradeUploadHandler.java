package com.yi.rentcar_project.handler.management;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yi.rentcar_project.model.Grade;
import com.yi.rentcar_project.mvc.CommandHandler;
import com.yi.rentcar_project.service.GradeService;

public class GradeUploadHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		GradeService service = GradeService.getInstance();
		if(req.getMethod().equalsIgnoreCase("get")){
			
			String nextCode = service.nextCode();
			/*String nextCode = maxCode + 1;//숫자로 출력 앞에 0 사라짐
*/			
			req.setAttribute("nextCode", nextCode);
			
			return "/WEB-INF/view/management/gradeUpload.jsp";
		}else if(req.getMethod().equalsIgnoreCase("post")){
			String code = req.getParameter("code");
			String name = req.getParameter("name");
			String hisal = req.getParameter("gHisal");
			String losal = req.getParameter("gLosal");
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
			
			service.insertGrade(grade);
			
			return "gradeList.do";
		}
		return null;
	}

}
