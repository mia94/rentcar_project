package com.yi.rentcar_project.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.yi.rentcar_project.dao.RentDao;
import com.yi.rentcar_project.model.CarModel;
import com.yi.rentcar_project.model.CarType;
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
}
