package com.yi.rentcar_project.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.yi.rentcar_project.dao.EmployeeDao;
import com.yi.rentcar_project.model.Employee;
import com.yi.rentcar_project.mvc.MySqlSessionFactory;

public class EmployeeService implements EmployeeDao{
	
	private static final EmployeeService instance = new EmployeeService();
	
	public static EmployeeService getInstance() {
		return instance;
	}

	
	private EmployeeService() {}
	
	private static final String namespace = "com.yi.rentcar_project.dao.EmployeeDao";

	
	@Override
	public Employee selectEmployeeByNo(Employee employee) {
		try (SqlSession sqlSession = MySqlSessionFactory.openSession();) {
			return sqlSession.selectOne(namespace + ".selectEmployeeByNo", employee);
		}
	}

	@Override
	public List<Employee> selectEmployeeByAll() {
		try (SqlSession sqlSession = MySqlSessionFactory.openSession();) {
			return sqlSession.selectList(namespace + ".selectEmployeeByAll");
		}
	}

	@Override
	public int insertEmployee(Employee employee) {
		try (SqlSession sqlSession = MySqlSessionFactory.openSession();) {
			int res = sqlSession.insert(namespace + ".insertEmployee", employee);
			sqlSession.commit();
			return res;
		}
	}

	@Override
	public int deleteEmployee(Employee employee) {
		try (SqlSession sqlSession = MySqlSessionFactory.openSession();) {
			int res = sqlSession.delete(namespace + ".deleteEmployee", employee);
			sqlSession.commit();
			return res;
		}
	}

	@Override
	public int updateEmployee(Employee employee) {
		try (SqlSession sqlSession = MySqlSessionFactory.openSession();) {
			int res = sqlSession.update(namespace + ".updateEmployee", employee);
			sqlSession.commit();
			return res;
		}
	}

	@Override
	public int selectEmployeeById(Employee employee) {
		try (SqlSession sqlSession = MySqlSessionFactory.openSession();) {
			Employee selectedEmployee = sqlSession.selectOne(namespace + ".selectEmployeeById", employee);
			if (selectedEmployee == null) {
				return 0;
			}
			return 1;
		}
	}

	@Override
	public Employee selectEmployeeByPw(Employee employee) {
		try (SqlSession sqlSession = MySqlSessionFactory.openSession();) {
			return sqlSession.selectOne(namespace + ".selectEmployeeByPw", employee);
		}
	}

}
