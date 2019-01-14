package com.yi.rentcar_project.handler.management;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yi.rentcar_project.model.Event;
import com.yi.rentcar_project.mvc.CommandHandler;
import com.yi.rentcar_project.service.EventService;

public class EventListHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		EventService eventService = EventService.getInstance();
		List<Event> eventList = eventService.selectEventByAll();
		req.setAttribute("eventList", eventList);
		return "/WEB-INF/view/management/eventList.jsp";
	}

}
