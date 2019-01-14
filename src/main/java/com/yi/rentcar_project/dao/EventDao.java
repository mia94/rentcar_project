package com.yi.rentcar_project.dao;



import java.util.List;

import com.yi.rentcar_project.model.Event;

public interface EventDao {
	Event selectEventByNo(Event event);
	List<Event> selectEventByAll();
	int insertEvent(Event event);
	int updateEvent(Event event);
	int deleteEvent(Event event);
	
	String nextCode();
}
