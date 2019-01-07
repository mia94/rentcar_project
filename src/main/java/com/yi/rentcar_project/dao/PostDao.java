package com.yi.rentcar_project.dao;

import java.util.List;

import com.yi.rentcar_project.model.Post;

public interface PostDao {
	  List<Post> selectPostByName (Post address);
}
