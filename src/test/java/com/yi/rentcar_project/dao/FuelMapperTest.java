package com.yi.rentcar_project.dao;

import java.util.List;

import org.junit.Assert;
import org.junit.FixMethodOrder;
import org.junit.Test;
import org.junit.runners.MethodSorters;

import com.yi.rentcar_project.model.Fuel;
import com.yi.rentcar_project.service.FuelService;


@FixMethodOrder(MethodSorters.NAME_ASCENDING)
public class FuelMapperTest {
private FuelDao dao = FuelService.getInstance();
	
	@Test
	public void test01selectFuelByNo() {
		Fuel searchFuel = new Fuel();
		searchFuel.setCode("lpg");
		
		Fuel newFuel = dao.selectFuelByNo(searchFuel);
		Assert.assertNotNull(newFuel);
	}
	
	@Test
	public void test02selectFuelByAll() {
		List<Fuel> list = dao.selectFuelByAll();
		Assert.assertNotNull(list);
	}
	
	@Test
	public void test03insertFuel() {
		Fuel fuel = new Fuel();
		fuel.setCode("수소");
		fuel.setNo(6);
		int res = dao.insertFuel(fuel);
		Assert.assertEquals(1, res);
	}

	@Test
	public void test05deleteFuel() {
		Fuel fuel = new Fuel();
		fuel.setNo(6);
		int res = dao.deleteFuel(fuel);
		Assert.assertEquals(1, res);
	}
	
	@Test
	public void test04updateFuel() {
		Fuel fuel = new Fuel();
		fuel.setNo(6);
		fuel.setCode("수소2");
		int res = dao.updateFuel(fuel);
		Assert.assertEquals(1, res);
	}
}
























