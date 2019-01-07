package com.yi.rentcar_project.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Update;

import com.yi.rentcar_project.model.CarModel;
import com.yi.rentcar_project.model.CarType;

public interface CarModelMapper {

	CarModel selectCarModelByNo(CarModel carModel);
	List<CarModel> selectCarModelByAll();
	int insertCarModel(CarModel carModel);
	int updateCarModel(CarModel carModel);
	int deleteCarModel(CarModel carModel);
	
	List<CarModel> selectCarModelWithCarOptionByAll();
	List<CarModel> selectCarModelWithCarOptionByCode(CarModel carModel);

	List<CarModel> selectCarModelByCarType(CarType carType);
	
	List<CarModel> SelectCarModelWithWhere(Map<String, String> map);
	
	String nextCarCode();
	
	
	// rent 등록 시 대여중으로변경
	@Update("update car_model set is_rent = 1, rent_cnt = rent_cnt + 1 where car_code = #{carCode}")
	int updateCarModelRent(CarModel carModel);
	
	// rent 반납시 시 대여가능으로변경
	@Update("update car_model set is_rent = 0 where car_code = #{carCode}")
	int updateCarModelRentReturn(CarModel carModel);
	///////
	List<CarModel> selectCarModel();
}
