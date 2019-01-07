package com.yi.rentcar_project.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.yi.rentcar_project.dao.CarTypeDao;
import com.yi.rentcar_project.model.CarType;
import com.yi.rentcar_project.mvc.MySqlSessionFactory;

public class CarTypeService implements CarTypeDao{
private static final CarTypeService instance = new CarTypeService();
	
	public static CarTypeService getInstance() {
		return instance;
	}

	private CarTypeService() {}
	
	private static final String namespace = "com.yi.rentcar_project.dao.CarTypeDao";
	
	
	@Override
	public CarType selectCarTypeByNo(CarType carType) {
		try (SqlSession sqlSession = MySqlSessionFactory.openSession();) {
			return sqlSession.selectOne(namespace+".selectCarTypeByNo", carType);
		}
	}

	@Override
	public List<CarType> selectCarTypeByAll() {
		try (SqlSession sqlSession = MySqlSessionFactory.openSession();) {
			return sqlSession.selectList(namespace+".selectCarTypeByAll");
		}
	}

	@Override
	public int insertCarType(CarType carType) {
		try (SqlSession sqlSession = MySqlSessionFactory.openSession();) {
			int res = sqlSession.insert(namespace+".insertCarType",carType);
			sqlSession.commit();
			return res;
		}
	}

	@Override
	public int updateCarType(CarType carType) {
		try (SqlSession sqlSession = MySqlSessionFactory.openSession();) {
			int res = sqlSession.update(namespace+".updateCarType",carType);
			sqlSession.commit();
			return res;
		}
	}

	@Override
	public int deleteCarType(CarType carType) {
		try (SqlSession sqlSession = MySqlSessionFactory.openSession();) {
			int res = sqlSession.delete(namespace+".deleteCarType",carType);
			sqlSession.commit();
			return res;
		}
	}

	@Override
	public String nextTypeCode() {
		try (SqlSession sqlSession = MySqlSessionFactory.openSession();) {
			return sqlSession.selectOne(namespace+".nextTypeCode");
		}
	}

}
