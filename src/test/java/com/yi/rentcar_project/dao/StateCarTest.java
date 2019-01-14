package com.yi.rentcar_project.dao;

import java.util.List;

import org.junit.Assert;
import org.junit.FixMethodOrder;
import org.junit.Test;
import org.junit.runners.MethodSorters;

import com.yi.rentcar_project.model.StateCar;
import com.yi.rentcar_project.service.StateCarService;

@FixMethodOrder(MethodSorters.NAME_ASCENDING)
public class StateCarTest {
	private StateCarDao dao = StateCarService.getInstance();
	
	@Test
	public void test01selectCountByCarType() {
		List<StateCar> list = dao.selectCountByCarType();
		Assert.assertNotNull(list);	
	}
	
	@Test
	public void test02selectCountByBrand() {
		List<StateCar> list = dao.selectCountByBrand();
		Assert.assertNotNull(list);	
	}
}
