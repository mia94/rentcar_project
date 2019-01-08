package com.yi.rentcar_project.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.yi.rentcar_project.dao.CustomEventDao;
import com.yi.rentcar_project.model.CustomEvent;
import com.yi.rentcar_project.model.Rent;
import com.yi.rentcar_project.mvc.MySqlSessionFactory;

public class CustomEventService implements CustomEventDao{
	private static final CustomEventService instance = new CustomEventService();
	
	public static CustomEventService getInstance() {
		return instance;
	}
	
	
	private CustomEventService() {}
	
	private static final String namespace = "com.yi.rentcar_project.dao.CustomEventDao";
	@Override
	public int insertCustomEvent(CustomEvent customEvent) {
		try (SqlSession sqlSession = MySqlSessionFactory.openSession();) {
			int res = sqlSession.insert(namespace + ".insertCustomEvent", customEvent);
			sqlSession.commit();
			return res;
		}
	}

	@Override
	public List<CustomEvent> selectCustomEventByCustomCode(String customCode) {
		try (SqlSession sqlSession = MySqlSessionFactory.openSession()) {
			return sqlSession.selectList(namespace + ".selectCustomEventByCustomCode", customCode);
		}
	}

	@Override
	public int deleteCustomEvent(CustomEvent customEvent) {
		try (SqlSession sqlSession = MySqlSessionFactory.openSession();) {
			int res = sqlSession.delete(namespace + ".deleteCustomEvent", customEvent);
			sqlSession.commit();
			return res;
		}
	}

	@Override
	public int updateSetUse(Rent rent) {
		try (SqlSession sqlSession = MySqlSessionFactory.openSession();) {
			int res = sqlSession.update(namespace + ".updateSetUse", rent);
			sqlSession.commit();
			return res;
		}
	}

}
