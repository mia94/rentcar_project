package com.yi.rentcar_project.dao;


import java.util.List;

import org.junit.Assert;
import org.junit.Test;

import com.yi.rentcar_project.model.Grade;
import com.yi.rentcar_project.service.GradeService;

public class GradeTest {
	private GradeDao dao = GradeService.getInstance();
	@Test
	public void test01selectGradeByAll() {
		List<Grade> gradList = dao.selectGradeByAll();
		System.out.println(gradList);
		Assert.assertNotNull(gradList);
	}

}
