package com.yi.rentcar_project.dao;

import java.sql.SQLException;
import java.util.List;

import javax.swing.JOptionPane;

import org.apache.ibatis.session.SqlSession;
import org.junit.Assert;
import org.junit.FixMethodOrder;
import org.junit.Test;
import org.junit.runners.MethodSorters;

import com.yi.rentcar_project.model.CarModel;
import com.yi.rentcar_project.model.CarType;
import com.yi.rentcar_project.model.CustomEvent;
import com.yi.rentcar_project.model.Customer;
import com.yi.rentcar_project.model.Event;
import com.yi.rentcar_project.mvc.MySqlSessionFactory;
import com.yi.rentcar_project.service.RentService;

@FixMethodOrder(MethodSorters.NAME_ASCENDING)
public class RentMapperTest {
	private RentDao dao = RentService.getInstance();
	
/*	@Test
	public void test01SelectByCarType() throws SQLException {
	
		List<CarModel> list = dao.selectByCarType("승합");
		
		for(CarModel cm : list){
			System.out.println(cm);
		}
		Assert.assertNotNull(list);
		
	}*/
	
	@Test
	public void test02SelectById() throws SQLException{
		List<Customer> list = dao.selectById("asd132");
		
		for(Customer c : list){
			System.out.println(c);
			for(CustomEvent event : c.getEvents()){
				for(Event event2 : event.getEvents()){
					JOptionPane.showConfirmDialog(null, event2);
					System.out.println(event2.getName());
				}
			}
		}
		Assert.assertNotNull(list);
	}

}
