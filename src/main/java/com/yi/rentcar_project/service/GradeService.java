package com.yi.rentcar_project.service;

import java.util.List;

import org.apache.ibatis.session.ResultContext;
import org.apache.ibatis.session.ResultHandler;
import org.apache.ibatis.session.SqlSession;

import com.yi.rentcar_project.dao.GradeDao;
import com.yi.rentcar_project.model.Grade;
import com.yi.rentcar_project.mvc.MySqlSessionFactory;

public class GradeService implements GradeDao{
private static final GradeService instance = new GradeService();
	
	public static GradeService getInstance() {
		return instance;
	}

	
	private GradeService() {}
	
	private static final String namespace = "com.yi.rentcar_project.dao.GradeDao";


	@Override
	public Grade selectGradeByNo(Grade grade) {
		try (SqlSession sqlSession = MySqlSessionFactory.openSession();) {
			return sqlSession.selectOne(namespace + ".selectGradeByNo", grade);
		}
	}

	@Override
	public Grade selectGradeByName(Grade gradeName) {
		try (SqlSession sqlSession = MySqlSessionFactory.openSession();) {
			return sqlSession.selectOne(namespace + ".selectGradeByName", gradeName);
		}
	}

	@Override
	public List<Grade> selectGradeByAll() {
		try (SqlSession sqlSession = MySqlSessionFactory.openSession();) {
			return sqlSession.selectList(namespace + ".selectGradeByAll");
		}
	}

	@Override
	public int insertGrade(Grade grade) {
		try (SqlSession sqlSession = MySqlSessionFactory.openSession();) {
			int res = sqlSession.insert(namespace + ".insertGrade", grade);
			sqlSession.commit();
			return res;
		}
	}

	@Override
	public int updateGrade(Grade grade) {
		try (SqlSession sqlSession = MySqlSessionFactory.openSession();) {
			int res = sqlSession.update(namespace + ".updateGrade", grade);
			sqlSession.commit();
			return res;
		}
	}

	@Override
	public int deleteGrade(Grade grade) {
		try (SqlSession sqlSession = MySqlSessionFactory.openSession();) {
			int res = sqlSession.delete(namespace + ".deleteGrade", grade);
			sqlSession.commit();
			return res;
		}
	}

	@Override
	public int chartGrade(Grade grade) {
		try (SqlSession sqlSession = MySqlSessionFactory.openSession();) {
			return sqlSession.selectOne(namespace + ".chartGrade", grade);
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

}
