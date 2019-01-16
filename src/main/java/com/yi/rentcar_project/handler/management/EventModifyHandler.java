package com.yi.rentcar_project.handler.management;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yi.rentcar_project.model.Event;
import com.yi.rentcar_project.mvc.CommandHandler;
import com.yi.rentcar_project.service.EventService;

public class EventModifyHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		if(req.getMethod().equalsIgnoreCase("get")){
			String code = req.getParameter("code");
			
			Event event = new Event();
			event.setCode(code);
			
			EventService service = EventService.getInstance();
			event = service.selectEventByNo(event);
			
			req.setAttribute("event", event);
			return "/WEB-INF/view/management/eventModify.jsp";
		}else if(req.getMethod().equalsIgnoreCase("post")){
		
			String code = req.getParameter("code");
			String name = req.getParameter("name");
			String sRate = req.getParameter("rate");
			
			int rate = Integer.parseInt(sRate);
		
			
			Event event = new Event();
			event.setCode(code);
			event.setName(name);
			event.setRate(rate);
			
			EventService service = EventService.getInstance();
			service.updateEvent(event);
			
			return "eventList.do";
		}
		return null;
	}

}
