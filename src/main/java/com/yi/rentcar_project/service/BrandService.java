package com.yi.rentcar_project.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.yi.rentcar_project.dao.BrandDao;
import com.yi.rentcar_project.model.Brand;
import com.yi.rentcar_project.model.StateCar;
import com.yi.rentcar_project.mvc.MySqlSessionFactory;

public class BrandService implements BrandDao {
	private static final BrandService instance = new BrandService();//자기자신 생성
	//get,set
	public static BrandService getInstance() {
		return instance;
	}
	
	private BrandService() {}

	private static final String namespace = "com.yi.rentcar_project.dao.BrandDao";

	@Override
	public Brand selectBrandByNo(Brand brand) {
		try (SqlSession sqlSession = MySqlSessionFactory.openSession()) {
			return sqlSession.selectOne(namespace + ".selectBrandByNo", brand);
		}
	}

	@Override
	public List<Brand> selectBrandByAll() {
		try (SqlSession sqlSession = MySqlSessionFactory.openSession()) {
			return sqlSession.selectList(namespace + ".selectBrandByAll");
		}
	}

	@Override
	public int insertBrand(Brand brand) {
		try (SqlSession sqlSession = MySqlSessionFactory.openSession()) {
			int res = sqlSession.insert(namespace+".insertBrand",brand);
			sqlSession.commit();
			return res;
		}
		
	}

	@Override
	public int updateBrand(Brand brand) {
		try (SqlSession sqlSession = MySqlSessionFactory.openSession()) {
			int res = sqlSession.update(namespace+".updateBrand", brand);
			sqlSession.commit();
			return res;
		}
	}

	@Override
	public int deleteBrand(Brand brand) {
		try (SqlSession sqlSession = MySqlSessionFactory.openSession()) {
			int res = sqlSession.delete(namespace+".deleteBrand", brand);
			sqlSession.commit();
			return res;
		}
	}

	@Override
	public List<StateCar> selectCountByBrand() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String nextBrandNo() {
		try (SqlSession sqlSession = MySqlSessionFactory.openSession()) {
			return sqlSession.selectOne(namespace+".nextBrandNo");
		}
		
	}
}


























