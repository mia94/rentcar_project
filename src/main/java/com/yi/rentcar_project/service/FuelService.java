package com.yi.rentcar_project.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.yi.rentcar_project.dao.FuelDao;
import com.yi.rentcar_project.model.Fuel;
import com.yi.rentcar_project.mvc.MySqlSessionFactory;

public class FuelService implements FuelDao{
private static final FuelService instance = new FuelService();
	
	
	public static FuelService getInstance() {
		return instance;
	}

	private FuelService() {
		// TODO Auto-generated constructor stub
	}

	private static final String namespace = "com.yi.rentcar_project.dao.FuelMapper";
	
	@Override
	public Fuel selectFuelByNo(Fuel fuel) {
		try (SqlSession sqlSession = MySqlSessionFactory.openSession()) {
			return sqlSession.selectOne(namespace+".selectFuelByNo",fuel);
		}
		
	}

	@Override
	public List<Fuel> selectFuelByAll() {
		try (SqlSession sqlSession = MySqlSessionFactory.openSession()) {
			return sqlSession.selectList(namespace+".selectFuelByAll");
		}
	}

	@Override
	public int insertFuel(Fuel fuel) {
		try (SqlSession sqlSession = MySqlSessionFactory.openSession()) {
			int res = sqlSession.insert(namespace+".insertFuel",fuel);
			sqlSession.commit();
			return res;
		}
		
	}

	@Override
	public int deleteFuel(Fuel fuel) {
		try (SqlSession sqlSession = MySqlSessionFactory.openSession()) {
			int res = sqlSession.delete(namespace+".deleteFuel",fuel);
			sqlSession.commit();
			return res;
		}
		
	}

	@Override
	public int updateFuel(Fuel fuel) {
		try (SqlSession sqlSession = MySqlSessionFactory.openSession()) {
			int res = sqlSession.update(namespace+".updateFuel",fuel);
			sqlSession.commit();
			return res;
		}
		
	}

	@Override
	public int nextFuelNo() {
		try (SqlSession sqlSession = MySqlSessionFactory.openSession()) {
			return sqlSession.selectOne(namespace+".nextFuelNo");
		}
	}
}
