package com.yi.rentcar_project.dao;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import com.yi.rentcar_project.model.Brand;
import com.yi.rentcar_project.model.StateCar;

public interface BrandMapper {
	Brand selectBrandByNo(Brand brand);
	List<Brand> selectBrandByAll();
	int insertBrand(Brand brand);
	int updateBrand(Brand brand);
	int deleteBrand(Brand brand);
	
	@Select("select brand, count(*)as count from rent r join car_model m on r.car_code = m.car_code group by m.brand")
	List<StateCar> selectCountByBrand();
	
	String nextBrandNo();
}
