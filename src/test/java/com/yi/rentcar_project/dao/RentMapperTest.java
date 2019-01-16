package com.yi.rentcar_project.dao;

import java.sql.SQLException;
import java.util.List;

import org.junit.Assert;
import org.junit.FixMethodOrder;
import org.junit.Test;
import org.junit.runners.MethodSorters;

import com.yi.rentcar_project.model.CarModel;
import com.yi.rentcar_project.model.CarType;
import com.yi.rentcar_project.model.Customer;
import com.yi.rentcar_project.model.Insurance;
import com.yi.rentcar_project.model.Rent;
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

/*	@Test
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
	}*/
	
/*	@Test
	public void test09insertRent() throws SQLException{
		Rent r = new Rent();
	
		r.setStart_date("2019-01-16");
		r.setStart_time("09:00:00");
		r.setEnd_date("2019-01-27");
		r.setEnd_time("09:00:00");
		r.setIs_return(false);
		r.setBasic_price(74000);
		r.setCar_code(new CarModel("V001"));
		
		Customer c = new Customer();
		c.setCode("C001");
		r.setCustomer_code(c);
		r.setInsurance_code(new Insurance("I001"));
		r.setE_code("EVT1");
		r.setOpt_price(5000);
		
		int res = dao.insert(r);
		
		Assert.assertEquals(1, res);
	}*/
/*	
	@Test
	public void test10selectRentAllByCustomerCode() throws SQLException{
		List<Rent> list = dao.selectRentAllByCustomerCode("C002");
		
		for(Rent r : list){
			System.out.println(r);
		}
		Assert.assertNotNull(list);
	}
	
	@Test
	public void test11getCustomercodeById() throws SQLException{
		Customer c = dao.getCustomercodeById("asd132");
		System.out.println(c);
		Assert.assertNotNull(c);
	}*/
	
	@Test
	public void test12getRentInfoByRentCode() throws SQLException{
		Rent r = dao.getRentInfoByRentCode("R022");
		System.out.println(r);
		Assert.assertNotNull(r);
	}
}
