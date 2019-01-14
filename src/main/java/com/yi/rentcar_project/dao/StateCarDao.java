package com.yi.rentcar_project.dao;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import com.yi.rentcar_project.model.StateCar;

public interface StateCarDao {

	@Select("select cartype as title, count(*) as count from car_type t left join car_model m on t.code = m.cartype group by cartype")
	List<StateCar> selectCountByCarType();
	@Select("select brand as title, count(*) as count from brand b left join car_model m on b.no = m.brand group by brand")
	List<StateCar> selectCountByBrand();
}
