package com.yi.rentcar_project.dao;

import java.util.List;

import org.junit.Assert;
import org.junit.FixMethodOrder;
import org.junit.Test;
import org.junit.runners.MethodSorters;

import com.yi.rentcar_project.model.CarType;
import com.yi.rentcar_project.service.CarTypeService;

@FixMethodOrder(MethodSorters.NAME_ASCENDING)
public class CarTypeMapperTest {
	private CarTypeDao dao = CarTypeService.getInstance();
	
	
	@Test
	public void test01selectCarTypeByNo() {
		CarType searchCarType = new CarType();
		searchCarType.setCode("S1");
		
		CarType newCarType = dao.selectCarTypeByNo(searchCarType);
		Assert.assertNotNull(newCarType);
	}
	
	@Test
	public void test02selectCarTypeByAll() {
		List<CarType> list = dao.selectCarTypeByAll();
		Assert.assertNotNull(list);
		
	}
	
	@Test
	public void test03insertCarType() {
		CarType carType = new CarType();
		carType.setCode("S7");
		carType.setType("버스");
		
		int res = dao.insertCarType(carType);
		Assert.assertEquals(1, res);
	}
	
	@Test
	public void test04updateCarType() {
		CarType carType = new CarType();
		carType.setCode("S7");
		carType.setType("고급");
		
		int res = dao.updateCarType(carType);
		Assert.assertEquals(1, res);
	}
	
	@Test
	public void test05deleteCarType() {
		CarType carType = new CarType();
		carType.setCode("S7");
		
		int res = dao.deleteCarType(carType);
		Assert.assertEquals(1, res);
	}
	
	@Test
	public void test06nextTypeCode() {
		String typeCode = dao.nextTypeCode();
		Assert.assertNotNull(typeCode);
	}

}

























