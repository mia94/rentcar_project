package com.yi.rentcar_project.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.yi.rentcar_project.dao.RentDao;
import com.yi.rentcar_project.model.CarModel;
import com.yi.rentcar_project.model.Customer;
import com.yi.rentcar_project.model.Grade;
import com.yi.rentcar_project.model.RentDate;
import com.yi.rentcar_project.model.RentHour;
import com.yi.rentcar_project.model.Insurance;
import com.yi.rentcar_project.model.Rent;
import com.yi.rentcar_project.model.StateCar;
import com.yi.rentcar_project.mvc.MySqlSessionFactory;

public class RentService implements RentDao{
	//namespace
	private static final String namespace = "com.yi.rentcar_project.dao.RentDao";
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

	@Override
	public List<StateCar> selectCountRentByMonthWithBrand(String brand) {
		try(SqlSession sqlSession = MySqlSessionFactory.openSession()){
			return sqlSession.selectList(namespace+".selectCountRentByMonthWithBrand", brand);
		}
	}

	//대여코드
	@Override
	public String getNextRentNo() {
		try (SqlSession sqlSession = MySqlSessionFactory.openSession()) {
			return sqlSession.selectOne(namespace + ".getNextRentNo");
		}
	}

	//추가(0:성공, -1: 실패)
	@Override
	public int insert(Rent rent) throws SQLException {
		// TODO Auto-generated method stub
		SqlSession session = null;
		
		try {
			session = MySqlSessionFactory.openSession();
			RentDao dao = session.getMapper(RentDao.class);
			
			//
			String custom_namespace = "com.yi.rentcar_project.dao.CustomerDao";
			Customer customer = rent.getCustomer_code();
			session.update(custom_namespace + ".updateCustomerRentCnt", customer);
			String gradeCode = session.selectOne(custom_namespace+".selectGradeCustomer", customer);
			customer.setGradeCode(new Grade(gradeCode));
			session.update(custom_namespace + ".updateCustomerGrade",  customer);
			session.update("com.yi.rentcar_project.dao.CarModelDao.updateCarModelRent", rent.getCar_code());	
			session.update("com.yi.rentcar_project.dao.CustomEventDao.updateSetUse", rent);
			//
			rent.setCode(getNextRentNo());
			dao.insert(rent);
			
			session.commit();
			return 0;
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			session.close();
		}
		
		return -1;
	}

	@Override
	public List<Rent> selectRentAllByCustomerCode(String customerCode) throws SQLException {
		try(SqlSession sqlSession = MySqlSessionFactory.openSession()){
			return sqlSession.selectList(namespace + ".selectRentAllByCustomerCode", customerCode);
		}
	}

	@Override
	public Customer getCustomercodeById(String id) throws SQLException {
		try (SqlSession sqlSession = MySqlSessionFactory.openSession()) {
			return sqlSession.selectOne(namespace + ".getCustomercodeById", id);
		}
	}

	@Override
	public Rent getRentInfoByRentCode(String code) throws SQLException {
		try (SqlSession sqlSession = MySqlSessionFactory.openSession()) {
			return sqlSession.selectOne(namespace + ".getRentInfoByRentCode", code);
		}
	}

	//상세정보
	public Map<String, Object> readRentInfo(String rentCode){
		SqlSession session = null;
		
		try {
			session = MySqlSessionFactory.openSession();
			
			RentDao dao = session.getMapper(RentDao.class);
			Rent rent = dao.getRentInfoByRentCode(rentCode);
			
			Map<String, Object> map = new HashMap<>();
			map.put("rent", rent);
			
			return map;
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			session.close();
		}
		return null;
	}

	//대여관리 상세정보
	public Map<String, Object> readRentInfoManage(String rentCode){
		SqlSession session = null;
		
		try {
			session = MySqlSessionFactory.openSession();
			
			RentDao dao = session.getMapper(RentDao.class);
			Rent rentInfo = dao.selectInfoRentByAll(rentCode);
			
			Map<String, Object> maps = new HashMap<>();
			maps.put("rentInfo", rentInfo);
			
			return maps;
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			session.close();
		}
		return null;
	}
	
	@Override
	public List<Rent> getRentList(RentDate date) throws SQLException {
		// TODO Auto-generated method stub
		SqlSession session = null;
		
		try {
			session = MySqlSessionFactory.openSession();
			RentDao dao = session.getMapper(RentDao.class);
			
			List<Rent> list = dao.getRentList(date);
			
			return list;
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			session.close();
		}
		return null;
	}

	@Override
	public List<Rent> selectRentByAllWithDate(RentDate date) throws SQLException {
		// TODO Auto-generated method stub
		SqlSession session = null;
		
		try {
			session = MySqlSessionFactory.openSession();
			RentDao dao = session.getMapper(RentDao.class);
			
			List<Rent> list = dao.selectRentByAllWithDate(date);
			
			return list;
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			session.close();
		}
		return null;
	}
	
	@Override
	public List<Rent> selectRentByAll() {
		try(SqlSession sqlSession = MySqlSessionFactory.openSession()){
			return sqlSession.selectList(namespace + ".selectRentByAll");
		}
	}

	@Override
	public List<Rent> getIsReturnFalse() throws SQLException {
		try(SqlSession sqlSession = MySqlSessionFactory.openSession()){
			return sqlSession.selectList(namespace + ".getIsReturnFalse");
		}
	}

	@Override
	public List<Rent> getIsReturnTrue() throws SQLException {
		try(SqlSession sqlSession = MySqlSessionFactory.openSession()){
			return sqlSession.selectList(namespace + ".getIsReturnTrue");
		}
	}

	@Override
	public Rent selectInfoRentByAll(String code) throws SQLException {
		try(SqlSession sqlSession = MySqlSessionFactory.openSession()){
			return sqlSession.selectOne(namespace + ".selectInfoRentByAll", code);
		}
	}

	//초과비용
	@Override
	public RentHour selectRentHours(Map<String, String> map) {
		try(SqlSession sqlSession = MySqlSessionFactory.openSession()){
			return sqlSession.selectOne(namespace + ".selectRentHours", map);
		}
	}

	//반납
	@Override
	public int changeisReturn(String code) {
		try(SqlSession sqlSession = MySqlSessionFactory.openSession()){
			int res = sqlSession.update(namespace + ".changeisReturn", code);
			sqlSession.commit();
			return res;
		}
	}

}
