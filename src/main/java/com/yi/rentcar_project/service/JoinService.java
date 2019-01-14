package com.yi.rentcar_project.service;

import java.util.List;

import com.yi.rentcar_project.model.CustomEvent;
import com.yi.rentcar_project.model.Customer;

public class JoinService {
	private CustomerService cusDao;
	private CustomEventService cEvtDao;
	
	private static final JoinService instance = new JoinService();

	public static JoinService getInstance() {
		return instance;
	}

	
	private JoinService() {
		cusDao = CustomerService.getInstance();
		cEvtDao  = CustomEventService.getInstance();
	}
	
	public int addcus(Customer customer, CustomEvent customEvent) {
		int res =  cusDao.insertCustomer(customer);
		int resw = cEvtDao.insertCustomEvent(customEvent);
		return (res + resw)==2?1:0;
	}

	public List<Customer> selectCustomerByAll() {
		return cusDao.selectCustomerByAll();
	}
	
	
	public String getNextCustomerCode() {
		return cusDao.nextCode();
	}

	public Customer selectCustomerById(Customer customer) {
		return cusDao.selectCustomerById(customer);
	}
	
	
///////////////////////// 트랜잭션 처리 //////////////////////////
	public void joinCustomer(Customer customer, CustomEvent customEvent) {
		cusDao.insertCustomerJoin(customer, customEvent);
	}
///////////////////////// 트랜잭션 처리 //////////////////////////
	
}
