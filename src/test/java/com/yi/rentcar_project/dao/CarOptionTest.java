package com.yi.rentcar_project.dao;

import java.util.List;

import org.junit.Assert;
import org.junit.FixMethodOrder;
import org.junit.Test;
import org.junit.runners.MethodSorters;

import com.yi.rentcar_project.model.CarOption;
import com.yi.rentcar_project.service.CarOptionService;

@FixMethodOrder(MethodSorters.NAME_ASCENDING)
public class CarOptionTest {
	private CarOptionDao dao = CarOptionService.getInstance();
	
	@Test
	public void test02selectCarOptionByNo() {
		CarOption searchCarOption = new CarOption();
		searchCarOption.setNo(1);
		
		CarOption newCarOption = dao.selectCarOptionByNo(searchCarOption);
		Assert.assertNotNull(newCarOption);
	}
	
	@Test
	public void test03selectCarOptionByAll() {
		List<CarOption> list = dao.selectCarOptionByAll();
		Assert.assertNotNull(list);
	}
	
	@Test
	public void test01insertCarOption() {
		CarOption carOption = new CarOption();
		carOption.setNo(5);
		carOption.setName("네비게이션");
		carOption.setPrice(5000);
		
		int res = dao.insertCarOption(carOption);
		Assert.assertEquals(1, res);
	}
	
	@Test
	public void test04updateCarOption() {
		CarOption carOption = new CarOption();
		carOption.setNo(5);
		carOption.setName("블랙박스");
		carOption.setPrice(7000);
		
		int res = dao.updateCarOption(carOption);
		Assert.assertEquals(1, res);
	}

	@Test
	public void test05deleteCarOption() {
		CarOption carOption = new CarOption();
		carOption.setNo(5);
		int res = dao.deleteCarOption(carOption);
		Assert.assertEquals(1, res);
	}
}
