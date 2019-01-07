package com.yi.rentcar_project.dao;

import java.sql.SQLException;

import com.yi.rentcar_project.model.Rent;

public interface RentDao {
	//추가하기
	public int insert(Rent rent) throws SQLException;
}
