package com.yi.rentcar_project.dao;

import java.sql.SQLException;
import java.util.List;

import com.yi.rentcar_project.model.CarModel;
import com.yi.rentcar_project.model.Customer;

public interface RentDao {
	//검색 -> 조건에 소형 입력해서 소형에 해당하는 차량들의 이름, 브랜드, 연료종류 가지고오기
	public List<CarModel> selectByCarType(String name) throws SQLException;
	
	//고객 id 검색해서 고객정보 들고오기
	public List<Customer> selectById(String id) throws SQLException;
}
