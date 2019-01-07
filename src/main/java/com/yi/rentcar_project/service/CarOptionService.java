package com.yi.rentcar_project.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.yi.rentcar_project.dao.CarOptionDao;
import com.yi.rentcar_project.model.CarOption;
import com.yi.rentcar_project.mvc.MySqlSessionFactory;

public class CarOptionService implements CarOptionDao{
	private static final CarOptionService instance = new CarOptionService();

	public static CarOptionService getInstance() {
		return instance;
	}

	private CarOptionService() {
		// TODO Auto-generated constructor stub
	}

	private static final String namespace = "com.yi.rentcar_project.dao.CarOptionDao";

	@Override
	public CarOption selectCarOptionByNo(CarOption carOption) {
		try (SqlSession sqlSession = MySqlSessionFactory.openSession()) {
			return sqlSession.selectOne(namespace + ".selectCarOptionByNo", carOption);
		}
	}

	@Override
	public List<CarOption> selectCarOptionByAll() {
		try (SqlSession sqlSession = MySqlSessionFactory.openSession()) {
			return sqlSession.selectList(namespace + ".selectCarOptionByAll");
		}

	}

	@Override
	public int insertCarOption(CarOption carOption) {
		try (SqlSession sqlSession = MySqlSessionFactory.openSession()) {
			int res = sqlSession.insert(namespace + ".insertCarOption", carOption);
			sqlSession.commit();
			return res;
		}
	}

	@Override
	public int updateCarOption(CarOption carOption) {
		try (SqlSession sqlSession = MySqlSessionFactory.openSession()) {
			int res = sqlSession.update(namespace + ".updateCarOption", carOption);
			sqlSession.commit();
			return res;
		}
	}

	@Override
	public int deleteCarOption(CarOption carOption) {
		try (SqlSession sqlSession = MySqlSessionFactory.openSession()) {
			int res = sqlSession.delete(namespace + ".deleteCarOption", carOption);
			sqlSession.commit();
			return res;
		}

	}

	@Override
	public int nextOptionNo() {
		try (SqlSession sqlSession = MySqlSessionFactory.openSession()) {
			return sqlSession.selectOne(namespace+".nextOptionNo");
		}
	}
}
