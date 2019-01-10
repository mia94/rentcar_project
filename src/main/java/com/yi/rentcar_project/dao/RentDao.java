package com.yi.rentcar_project.dao;

import java.sql.SQLException;
import java.util.List;

import com.yi.rentcar_project.model.CarModel;

public interface RentDao {
	//검색 -> 조건에 소형 입력해서 소형에 해당하는 차량들의 이름, 브랜드, 연료종류 가지고오기
	public List<CarModel> selectByCarType(String name) throws SQLException;
}
