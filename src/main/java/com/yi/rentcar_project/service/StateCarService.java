package com.yi.rentcar_project.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.yi.rentcar_project.dao.StateCarDao;
import com.yi.rentcar_project.model.StateCar;
import com.yi.rentcar_project.mvc.MySqlSessionFactory;

public class StateCarService implements StateCarDao {
private static final StateCarService instance = new StateCarService();
	
	public static StateCarService getInstance() {
		return instance;
	}

	public StateCarService() {

	}

	private static final String namespace = "com.yi.rentcar_project.dao.StateCarDao";

	@Override
	public List<StateCar> selectCountByCarType() {
		try (SqlSession sqlSession = MySqlSessionFactory.openSession()) {
			return sqlSession.selectList(namespace+".selectCountByCarType");
		}
	}

	@Override
	public List<StateCar> selectCountByBrand() {
		try (SqlSession sqlSession = MySqlSessionFactory.openSession()) {
			return sqlSession.selectList(namespace+".selectCountByBrand");
		}
	}

}
