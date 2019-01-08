package com.yi.rentcar_project.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.yi.rentcar_project.dao.PostDao;
import com.yi.rentcar_project.model.Post;
import com.yi.rentcar_project.mvc.MySqlSessionFactory;

public class PostService implements PostDao{

private static final PostService instance = new PostService();
	
	public static PostService getInstance() {
		return instance;
	}

	
	private PostService() {}
	
	private static final String namespace = "com.yi.rentcar_project.dao.PostDao";

	@Override
	public List<Post> selectPostByName(Post address) {
		  try (SqlSession sqlSession = MySqlSessionFactory.openSession();) {
		         return sqlSession.selectList(namespace + ".selectPostByName", address);
		      }
	}

}
