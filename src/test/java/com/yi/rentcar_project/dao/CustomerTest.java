package com.yi.rentcar_project.dao;


import org.junit.Assert;
import org.junit.Test;

import com.yi.rentcar_project.model.Customer;
import com.yi.rentcar_project.service.CustomerService;

public class CustomerTest {
	private CustomerDao dao = CustomerService.getInstance();
	
	@Test
	public void test() {
		String rndPwd = dao.getRandomPassword();
		System.out.println("임시비밀번호" +rndPwd);
		
		Customer customer = new Customer();
		customer.setName("김재영");
		customer.setId("xbmhw325");
		customer.setEmail("xbmhw325@daum.com");
		customer.setPasswd(rndPwd);
		System.out.println(customer);
		int res = dao.changePw(customer);
		System.out.println(res);
		Assert.assertEquals(1, res);
	}

}
