package com.yi.rentcar_project.service;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.yi.rentcar_project.dao.RentDao;
import com.yi.rentcar_project.model.CarModel;
import com.yi.rentcar_project.model.CarType;
import com.yi.rentcar_project.model.Customer;
import com.yi.rentcar_project.model.Insurance;
import com.yi.rentcar_project.mvc.MySqlSessionFactory;

public class RentService implements RentDao{
	//Singleton Pattern
	private static final RentService instance = new RentService();
	
	public static RentService getInstance(){
		return instance;
	}
	
	public RentService() {
		// TODO Auto-generated constructor stub
	}
	
	//Select
	//차량유형 선택해서 해당 차량에 속하는 모든 차량 이름, 브랜드, 연료종류 가지고오기
	public List<CarModel> selectByCarType(String name){
		SqlSession session = null;
		
		try {
			session = MySqlSessionFactory.openSession();
			
			RentDao dao = session.getMapper(RentDao.class);
			
			return dao.selectByCarType(name);
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			
		} finally {
			session.close();
		}
		return null;
	}

	
	//Select
	//고객 id 검색해서 id에 해당하는 고객 정보들 가지고오기
	@Override
	public List<Customer> selectById(String id) throws SQLException {
		// TODO Auto-generated method stub
		SqlSession session = null;
		
		try {
			session = MySqlSessionFactory.openSession();
			
			RentDao dao = session.getMapper(RentDao.class);
			
			return dao.selectById(id);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			
		} finally {
			session.close();
		}
		return null;
	}

	@Override
	public Insurance selectInsuranceByCarType(String carType) throws SQLException {
		// TODO Auto-generated method stub
		SqlSession session = null;
		
		try {
			session = MySqlSessionFactory.openSession();
			
			RentDao dao = session.getMapper(RentDao.class);
			
			return dao.selectInsuranceByCarType(carType);
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			
		} finally {
			session.close();
		}
		return null;
	}
}
