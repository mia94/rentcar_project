package com.yi.rentcar_project.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.yi.rentcar_project.dao.CustomerDao;
import com.yi.rentcar_project.exception.LoginFailException;
import com.yi.rentcar_project.model.CustomEvent;
import com.yi.rentcar_project.model.Customer;
import com.yi.rentcar_project.model.Employee;
import com.yi.rentcar_project.mvc.MySqlSessionFactory;

public class LoginService {
	private EmployeeService empDao;
	private CustomerService cusDao;
	private CustomEventService ceDao;
	
	
private static final LoginService instance = new LoginService();
	
	public static LoginService getInstance() {
		return instance;
	}

	
	private LoginService() {
		cusDao = CustomerService.getInstance();
		empDao = EmployeeService.getInstance();
		ceDao  = CustomEventService.getInstance();
	}
	
	
	public Customer selectCustomerByPw(Customer customer) throws LoginFailException {
		
		Customer resCustomer = cusDao.selectCustomerByPw(customer);
	
		if (resCustomer == null) {
			throw new LoginFailException("아이디와 비밀번호를 다시 확인해 주세요.");
		}
		return resCustomer;
	}
	
	public Employee selectEmployeeByPw(Employee employee) throws LoginFailException {
		Employee resEmp =  empDao.selectEmployeeByPw(employee);
		if (resEmp == null) {
			throw new LoginFailException("아이디와 비밀번호를 다시 확인해 주세요.");
		}
		return resEmp;
	}
	
	public Customer selectCustomerByCode(Customer customer) {
		return cusDao.selectCustomerByCode(customer);
	}
	
	public int insertCustomEvent(CustomEvent customEvent) {
		return ceDao.insertCustomEvent(customEvent);
	}


	public int checkLoginMember(String id, String password) {
		SqlSession session = null;

		try {
			session = MySqlSessionFactory.openSession();
			CustomerDao dao = session.getMapper(CustomerDao.class);
			Customer customer = dao.selectCustomerById(null);
			if (customer == null) {
				return -2;
			}
			if (customer.getPasswd().equals(password) == false) {
				return -1;
			}
			return 0;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return -3;
	}
}


