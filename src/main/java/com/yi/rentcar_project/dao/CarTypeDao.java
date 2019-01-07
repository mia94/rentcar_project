package com.yi.rentcar_project.dao;

import java.util.List;

import com.yi.rentcar_project.model.CarType;

public interface CarTypeDao {
	CarType selectCarTypeByNo(CarType carType);
	List<CarType> selectCarTypeByAll();
	int insertCarType(CarType carType);
	int updateCarType(CarType carType);
	int deleteCarType(CarType carType);
	
	String nextTypeCode();
}
