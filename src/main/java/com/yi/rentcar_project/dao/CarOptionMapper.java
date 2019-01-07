package com.yi.rentcar_project.dao;

import java.util.List;

import com.yi.rentcar_project.model.CarOption;

public interface CarOptionMapper {
	CarOption selectCarOptionByNo(CarOption carOption);
	List<CarOption> selectCarOptionByAll();
	int insertCarOption(CarOption carOption);
	int updateCarOption(CarOption carOption);
	int deleteCarOption(CarOption carOption);
	
	int nextOptionNo();
}
