package com.yi.rentcar_project.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.junit.Assert;
import org.junit.FixMethodOrder;
import org.junit.Test;
import org.junit.runners.MethodSorters;

import com.yi.rentcar_project.model.CarModel;
import com.yi.rentcar_project.model.CarType;
import com.yi.rentcar_project.mvc.MySqlSessionFactory;
import com.yi.rentcar_project.service.RentService;

@FixMethodOrder(MethodSorters.NAME_ASCENDING)
public class RentMapperTest {
	private RentDao dao = RentService.getInstance();
	
	@Test
	public void test01SelectByCarType() throws SQLException {
	
		List<CarModel> list = dao.selectByCarType("승합");
		
		for(CarModel cm : list){
			System.out.println(cm);
		}
		Assert.assertNotNull(list);
		
	}

}
