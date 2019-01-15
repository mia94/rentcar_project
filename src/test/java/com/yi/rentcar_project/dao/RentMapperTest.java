package com.yi.rentcar_project.dao;

import java.sql.SQLException;
import java.util.List;

import org.junit.Assert;
import org.junit.FixMethodOrder;
import org.junit.Test;
import org.junit.runners.MethodSorters;

import com.yi.rentcar_project.model.CarType;
import com.yi.rentcar_project.model.Insurance;
import com.yi.rentcar_project.model.StateCar;
import com.yi.rentcar_project.service.RentService;

@FixMethodOrder(MethodSorters.NAME_ASCENDING)
public class RentMapperTest {
	private RentDao dao = RentService.getInstance();
	
/*	@Test
	public void test01SelectByCarType() throws SQLException {
	
		List<CarModel> list = dao.selectByCarType("승합");
		
		for(CarModel cm : list){
			System.out.println(cm);
		}
		Assert.assertNotNull(list);
		
	}*/
	
/*	@Test
	public void test02SelectById() throws SQLException{
		List<Customer> list = dao.selectById("asd132");
		
		for(Customer c : list){
			System.out.println(c);
		}
		Assert.assertNotNull(list);
	}
*/

	@Test
	public void test03selectInsuranceByCarType() throws SQLException{
		CarType ct = new CarType();
		ct.setCode("S1");
		ct.setType("경형");
		Insurance i = new Insurance("I001", ct, 6500);
		
		i = dao.selectInsuranceByCarType("경형");
		System.out.println(i);
	}
	
	@Test
	public void test08selectCountRentByMonthWithBrand() {
		
		List<StateCar> list = dao.selectCountRentByMonthWithBrand("kia");
		Assert.assertNotNull(list);
	}
}
