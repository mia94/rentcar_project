package com.yi.rentcar_project.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.annotations.Select;

import com.yi.rentcar_project.model.CarModel;
import com.yi.rentcar_project.model.Customer;
import com.yi.rentcar_project.model.Insurance;
import com.yi.rentcar_project.model.Rent;
import com.yi.rentcar_project.model.StateCar;

public interface RentDao {
	//검색 -> 조건에 소형 입력해서 소형에 해당하는 차량들의 이름, 브랜드, 연료종류 가지고오기
	public List<CarModel> selectByCarType(String name) throws SQLException;
	
	//고객 id 검색해서 고객정보 들고오기
	public List<Customer> selectById(String id) throws SQLException;
	
	//보험
	public Insurance selectInsuranceByCarType(String carType) throws SQLException;
	
	//브랜드별 카운트 select
	@Select("SELECT DATE_FORMAT(start_date,'%Y-%m') as title, b.name as brand, COUNT(*) as count FROM rent r join car_model cm on r.car_code = cm.car_code join brand b on cm.brand = b.no GROUP BY title, brand having b.name = #{brand}")
	List<StateCar> selectCountRentByMonthWithBrand(String brand);
	
	//대여코드
	@Select("select concat('R', lpad((round(substring(max(code), 2,3)) + 1), 3, '0')) from rent")
	String getNextRentNo();
	
	//추가
	public int insert(Rent rent) throws SQLException;
}
