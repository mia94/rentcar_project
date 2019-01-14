package com.yi.rentcar_project.handler.login;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.yi.rentcar_project.mvc.CommandHandler;

public class LogoutHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		// TODO Auto-generated method stub
		HttpSession session = req.getSession(false);

		if (session != null) {
			session.invalidate(); // 세션삭제

		}
		res.sendRedirect("home.do");
		return null;
	}

	
	
	
}
