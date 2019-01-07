package com.yi.rentcar_project.dao;

import java.util.List;

import com.yi.rentcar_project.model.Fuel;

public interface FuelDao {
	Fuel selectFuelByNo(Fuel fuel);
	List<Fuel> selectFuelByAll();
	int insertFuel(Fuel fuel);
	int updateFuel(Fuel fuel);
	int deleteFuel(Fuel fuel);
	
	int nextFuelNo();
}
