package com.yi.rentcar_project.service;

import com.yi.rentcar_project.model.Customer;

public class SearchIdPwService {
	private CustomerService cusDao;

	private static final SearchIdPwService instance = new SearchIdPwService();

	public static SearchIdPwService getInstance() {
		return instance;
	}

	public SearchIdPwService() {
		cusDao = CustomerService.getInstance();
	}

	public Customer searchId(Customer customer) {
		return cusDao.searchId(customer);
	}

	public String getRandPw() {
		return cusDao.getRandomPassword();
	}

	public int changePw(Customer customer) {
		return cusDao.changePw(customer);
	}
}
