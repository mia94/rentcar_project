package com.yi.rentcar_project.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.yi.rentcar_project.dao.CarModelDao;
import com.yi.rentcar_project.model.CarModel;
import com.yi.rentcar_project.model.CarType;
import com.yi.rentcar_project.mvc.MySqlSessionFactory;

public class CarModelService implements CarModelDao{
private static final CarModelService instance = new CarModelService();
	
	public static CarModelService getInstance() {
		return instance;
	}
	
	private CarModelService() {}
	
	private static final String namespace = "com.yi.rentcar_project.dao.CarModelDao";

	@Override
	public CarModel selectCarModelByNo(CarModel carModel) {
		try (SqlSession sqlSession = MySqlSessionFactory.openSession()) {
			return sqlSession.selectOne(namespace+".selectCarModelByNo",carModel);
		}
	}

	@Override
	public List<CarModel> selectCarModelByAll() {
		try (SqlSession sqlSession = MySqlSessionFactory.openSession()) {
			return sqlSession.selectList(namespace+".selectCarModelByAll");
		}
	}

	@Override
	public int insertCarModel(CarModel carModel) {
		try (SqlSession sqlSession = MySqlSessionFactory.openSession()) {
			int res = sqlSession.insert(namespace+".insertCarModel",carModel);
			sqlSession.commit();
			return res;		
		}
		
	}

	@Override
	public int updateCarModel(CarModel carModel) {
		try (SqlSession sqlSession = MySqlSessionFactory.openSession()) {
			int res = sqlSession.update(namespace+".updateCarModel",carModel);
			sqlSession.commit();
			return res;
		}
	}

	@Override
	public int deleteCarModel(CarModel carModel) {
		try (SqlSession sqlSession = MySqlSessionFactory.openSession()) {
			int res = sqlSession.delete(namespace+".deleteCarModel",carModel);
			sqlSession.commit();
			return res;
		}
		
	}

	@Override
	public List<CarModel> selectCarModelWithCarOptionByAll() {
		try (SqlSession sqlSession = MySqlSessionFactory.openSession()) {
			return sqlSession.selectList(namespace+".selectCarModelWithCarOptionByAll");
		}
		
	}

	@Override
	public List<CarModel> selectCarModelWithCarOptionByCode(CarModel carModel) {
		try (SqlSession sqlSession = MySqlSessionFactory.openSession()) {
			return sqlSession.selectList(namespace+".selectCarModelWithCarOptionByCode",carModel);
		}
	}

	@Override
	public List<CarModel> selectCarModelByCarType(CarType carType) {
		try (SqlSession sqlSession = MySqlSessionFactory.openSession()) {
			return sqlSession.selectList(namespace+".selectCarModelByCarType", carType);
		}
	}

	@Override
	public List<CarModel> SelectCarModelWithWhere(Map<String, String> map) {
		try (SqlSession sqlSession = MySqlSessionFactory.openSession()) {
			return sqlSession.selectList(namespace+".SelectCarModelWithWhere",map);
		}
		
	}

	@Override
	public String nextCarCode() {
		try (SqlSession sqlSession = MySqlSessionFactory.openSession()) {
			return sqlSession.selectOne(namespace+".nextCarCode");
		}
	}

	@Override
	public int updateCarModelRent(CarModel carModel) {
		try (SqlSession sqlSession = MySqlSessionFactory.openSession()) {
			int res = sqlSession.update(namespace+".updateCarModelRent", carModel);
			sqlSession.commit();
			return res;
		}
	}

	@Override
	public List<CarModel> selectCarModel() {
		try (SqlSession sqlSession = MySqlSessionFactory.openSession();) {
			return sqlSession.selectList(namespace + ".selectCarModel");
		}
	}

	@Override
	public int updateCarModelRentReturn(CarModel carModel) {
		try (SqlSession sqlSession = MySqlSessionFactory.openSession()) {
			int res = sqlSession.update(namespace+".updateCarModelRentReturn", carModel);
			sqlSession.commit();
			return res;
		}
	}
}
