package com.yi.rentcar_project.dao;

import java.util.List;

import org.junit.Assert;
import org.junit.FixMethodOrder;
import org.junit.Test;
import org.junit.runners.MethodSorters;

import com.yi.rentcar_project.model.Brand;
import com.yi.rentcar_project.service.BrandService;

@FixMethodOrder(MethodSorters.NAME_ASCENDING)
public class BrandTest {
	private BrandDao dao = BrandService.getInstance();
	
	@Test
	public void test01selectBrandByNo() {
		Brand searchBrand = new Brand();
		searchBrand.setNo("B1");
		
		Brand newBrand = dao.selectBrandByNo(searchBrand);
		Assert.assertNotNull(newBrand);
	}
	
	@Test
	public void test02selectBrandByAll() {
		List<Brand> list = dao.selectBrandByAll();
		Assert.assertNotNull(list);	
	}
	
	@Test
	public void test03insertBrand() {
		Brand brand = new Brand();
		brand.setNo("B5");
		brand.setName("GM");
		
		int res = dao.insertBrand(brand);
		Assert.assertEquals(1, res);
	}
	
	@Test
	public void test04updateBrand() {
		Brand brand = new Brand();
		brand.setNo("B5");
		brand.setName("Benz");
		
		int res = dao.updateBrand(brand);
		Assert.assertEquals(1, res);
	}
	
	@Test
	public void test05deleteBrand() {
		Brand brand = new Brand();
		brand.setNo("B5");
		int res = dao.deleteBrand(brand);
		Assert.assertEquals(1, res);
	}
}
