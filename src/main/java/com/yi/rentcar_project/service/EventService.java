package com.yi.rentcar_project.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.yi.rentcar_project.dao.EventDao;
import com.yi.rentcar_project.model.Event;
import com.yi.rentcar_project.mvc.MySqlSessionFactory;

public class EventService implements EventDao {

	private static final EventService instance = new EventService();

	public static EventService getInstance() {
		return instance;
	}

	private EventService() {
	}

	private static final String namespace = "com.yi.rentcar_project.dao.EventDao";

	@Override
	public Event selectEventByNo(Event event) {
		try (SqlSession sqlSession = MySqlSessionFactory.openSession();) {
			return sqlSession.selectOne(namespace + ".selectEventByNo", event);
		}
	}

	@Override
	public List<Event> selectEventByAll() {
		try (SqlSession sqlSession = MySqlSessionFactory.openSession();) {
			return sqlSession.selectList(namespace + ".selectEventByAll");
		}
	}

	@Override
	public int insertEvent(Event event) {
		try (SqlSession sqlSession = MySqlSessionFactory.openSession();) {
			int res = sqlSession.insert(namespace + ".insertEvent", event);
			sqlSession.commit();
			return res;
		}
	}

	@Override
	public int updateEvent(Event event) {
		try (SqlSession sqlSession = MySqlSessionFactory.openSession();) {
			int res = sqlSession.update(namespace + ".updateEvent", event);
			sqlSession.commit();
			return res;
		}
	}

	@Override
	public int deleteEvent(Event event) {
		try (SqlSession sqlSession = MySqlSessionFactory.openSession();) {
			int res = sqlSession.delete(namespace + ".deleteEvent", event);
			sqlSession.commit();
			return res;
		}
	}

	@Override
	public String nextCode() {
		try (SqlSession sqlSession = MySqlSessionFactory.openSession();) {
			return sqlSession.selectOne(namespace + ".nextCode");
		}
	}

}
