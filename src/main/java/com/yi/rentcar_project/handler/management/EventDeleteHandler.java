package com.yi.rentcar_project.handler.management;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yi.rentcar_project.model.Event;
import com.yi.rentcar_project.mvc.CommandHandler;
import com.yi.rentcar_project.service.EventService;

public class EventDeleteHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		String code = req.getParameter("code");

		Event event = new Event();
		event.setCode(code);

		EventService service = EventService.getInstance();
		service.deleteEvent(event);

		return "eventList.do";
	}

}
