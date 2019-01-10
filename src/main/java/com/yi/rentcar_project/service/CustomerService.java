package com.yi.rentcar_project.service;

import java.util.List;

import javax.swing.JOptionPane;

import org.apache.ibatis.session.ResultContext;
import org.apache.ibatis.session.ResultHandler;
import org.apache.ibatis.session.SqlSession;

import com.yi.rentcar_project.dao.CustomerDao;
import com.yi.rentcar_project.model.CustomEvent;
import com.yi.rentcar_project.model.Customer;
import com.yi.rentcar_project.model.StateCar;
import com.yi.rentcar_project.mvc.MySqlSessionFactory;

public class CustomerService implements CustomerDao {
	// SingletonPattern
	private static final CustomerService instance = new CustomerService();

	// getter,setter
	public static CustomerService getInstance() {
		return instance;
	}

	// default 생성자 만들기
	private CustomerService() {
	}

	private static final String namespace = "com.yi.rentcar_project.dao.CustomerDao";

	@Override
	public List<Customer> selectCustomerByName(Customer customer) {
		try (SqlSession sqlSession = MySqlSessionFactory.openSession();) {
			return sqlSession.selectList(namespace + ".selectCustomerByName", customer);
		}
	}

	@Override
	public List<Customer> selectCustomerByAll() {
		try (SqlSession sqlSession = MySqlSessionFactory.openSession();) {
			return sqlSession.selectList(namespace + ".selectCustomerByAll");
		}
	}

	@Override
	public Customer selectCustomerById(Customer customer) {
		try (SqlSession sqlSession = MySqlSessionFactory.openSession();) {
			return sqlSession.selectOne(namespace + ".selectCustomerById", customer);
		}
	}

	@Override
	public int insertCustomer(Customer customer) {
		try (SqlSession sqlSession = MySqlSessionFactory.openSession();) {
			int res = sqlSession.insert(namespace + ".insertCustomer", customer);
			sqlSession.commit();
			return res;
		}
	}

	@Override
	public int updateCustomer(Customer customer) {
		try (SqlSession sqlSession = MySqlSessionFactory.openSession();) {
			int res = sqlSession.update(namespace + ".updateCustomer", customer);
			sqlSession.commit();
			return res;
		}
	}

	@Override
	public int deleteCustomer(Customer customer) {
		try (SqlSession sqlSession = MySqlSessionFactory.openSession();) {
			int res = sqlSession.delete(namespace + ".deleteCustomer", customer);
			sqlSession.commit();
			return res;
		}
	}

	@Override
	public int nextCustomerCode() {
		try (SqlSession sqlSession = MySqlSessionFactory.openSession();) {
			return sqlSession.selectOne(namespace + ".nextCustomerCode");
		}
	}

	@Override
	public String nextCode() {
		StringBuilder sb = new StringBuilder();
		ResultHandler<Integer> resultHandler = new ResultHandler<Integer>() {
			@Override
			public void handleResult(ResultContext<? extends Integer> resultContext) {
				sb.append(String.format("C%03d", resultContext.getResultObject()));
			}
		};

		try (SqlSession sqlSession = MySqlSessionFactory.openSession();) {
			sqlSession.select(namespace + ".nextCode", resultHandler);
			return sb.toString();
		}
	}

	@Override
	public Customer selectCustomerByPw(Customer customer) {
		try (SqlSession sqlSession = MySqlSessionFactory.openSession();) {
			return sqlSession.selectOne(namespace + ".selectCustomerByPw", customer);
		}
	}

	@Override
	public List<Customer> selectCustomerByCode(Customer customer) {
		try (SqlSession sqlSession = MySqlSessionFactory.openSession();) {
			return sqlSession.selectList(namespace + ".selectCustomerByCode", customer);
		}
	}

	@Override
	public void insertCustomerJoin(Customer customer, CustomEvent customEvent) {
		SqlSession sqlSession = MySqlSessionFactory.openSession();
		try {
			sqlSession.insert(namespace + ".insertCustomer", customer);
			sqlSession.insert("com.yi.rentcar_project.dao.CustomEventDao.insertCustomEvent", customEvent);
			sqlSession.commit();
		} catch (Exception e) {
			e.printStackTrace();
			sqlSession.rollback();
			System.err.println("sqlSession.rollback()");
			throw new RuntimeException(e.getCause());
		} finally {
			sqlSession.close();
		}
		
	}

	@Override
	public void deleteCustomerEvent(Customer customer, CustomEvent customEvent) {
		SqlSession sqlSession = MySqlSessionFactory.openSession();
		try {
			sqlSession.delete("com.yi.rentcar_project.dao.CustomEventDao.deleteCustomEvent", customEvent);
			sqlSession.delete(namespace + ".deleteCustomer", customer);
			sqlSession.commit();
		} catch (Exception e) {
			e.printStackTrace();
			sqlSession.rollback();
			System.err.println("sqlSession.rollback()");
			throw new RuntimeException(e.getCause());
		} finally {
			sqlSession.close();
		}

	}

	@Override
	public int updateCustomerRentCnt(Customer customer) {
		try (SqlSession sqlSession = MySqlSessionFactory.openSession();) {
			int res = sqlSession.delete(namespace + ".updateCustomerRentCnt", customer);
			sqlSession.commit();
			return res;
		}
	}

	@Override
	public String selectGradeCustomer(Customer customer) {
		try (SqlSession sqlSession = MySqlSessionFactory.openSession();) {
			return sqlSession.selectOne(namespace + ".selectGradeCustomer", customer);
		}
	}

	@Override
	public int updateCustomerGrade(Customer customer) {
		try (SqlSession sqlSession = MySqlSessionFactory.openSession();) {
			int res = sqlSession.delete(namespace + ".updateCustomerGrade", customer);
			sqlSession.commit();
			return res;
		}
	}

	@Override
	public Customer searchId(Customer customer) {
		try (SqlSession sqlSession = MySqlSessionFactory.openSession();) {
			return sqlSession.selectOne(namespace + ".searchId", customer);
		}
	}

	@Override
	public String getRandomPassword() {
		try (SqlSession sqlSession = MySqlSessionFactory.openSession();) {
			return sqlSession.selectOne(namespace + ".getRandomPassword");
		}
	}

	@Override
	public int changePw(Customer customer) {
		try (SqlSession sqlSession = MySqlSessionFactory.openSession();) {
			int res = sqlSession.delete(namespace + ".changePw", customer);
			sqlSession.commit();
			return res;
		}
	}

	@Override
	public int samePwd(Customer customer) {
		try (SqlSession sqlSession = MySqlSessionFactory.openSession();) {
			return sqlSession.selectOne(namespace + ".samePwd", customer);
		}
	}

	@Override
	public int updateCustomerInfo(Customer customer) {
		try (SqlSession sqlSession = MySqlSessionFactory.openSession();) {
			int res = sqlSession.delete(namespace + ".updateCustomerInfo", customer);
			sqlSession.commit();
			return res;
		}
	}

	@Override
	public List<StateCar> chartAddr() {
		try (SqlSession sqlSession = MySqlSessionFactory.openSession();) {
			return sqlSession.selectList(namespace + ".chartAddr");

		}
	}

	@Override
	public List<StateCar> chartGrade() {
		try (SqlSession sqlSession = MySqlSessionFactory.openSession();) {
			return sqlSession.selectList(namespace + ".chartGrade");
		}
	}

}
