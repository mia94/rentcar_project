package com.yi.rentcar_project.dao;

import java.util.List;

import org.junit.Assert;
import org.junit.Test;

import com.yi.rentcar_project.model.CarModel;
import com.yi.rentcar_project.service.CarModelService;

public class CarModelTest {
private CarModelDao dao = CarModelService.getInstance();
	
	@Test
	public void test01selectCarModelByNo() {
		CarModel searchModel = new CarModel();
		searchModel.setCarCode("V001");
		
		CarModel newModel = dao.selectCarModelByNo(searchModel);
		System.out.println(newModel);
		Assert.assertNotNull(newModel);
	}
	
	@Test
	public void test02selectCarModelByAll() {
		List<CarModel> list = dao.selectCarModelByAll();
		for(CarModel cm : list) {
			System.out.println(cm+":"+ cm.getCarType().getCode());
		}
		Assert.assertNotNull(list);
	}
}
