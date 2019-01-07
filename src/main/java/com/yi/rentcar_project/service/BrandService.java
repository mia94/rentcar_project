package com.yi.rentcar_project.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.yi.rentcar_project.dao.BrandDao;
import com.yi.rentcar_project.model.Brand;
import com.yi.rentcar_project.mvc.MySqlSessionFactory;

public class BrandService {
	private static final BrandService service = new BrandService();//자기자신 생성
	//get,set
	public static BrandService getInstance() {
		return service;
	}
	// -1 : 저장실패
	// -2 : 특수경우
	//  0 : success
	public int insertBrand(String brandCode,String name){
		SqlSession session = null;
		
		try {
			session = MySqlSessionFactory.openSession();
			BrandDao brandDao = session.getMapper(BrandDao.class);
			Brand brand = new Brand(brandCode, name);
			
			brandDao.insertBrand(brand);
			String code = brandDao.nextBrandNo();
			if(code==null){
				return -1;
			}
			session.commit();
			return 0;
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		return -2;//특수경우
	}
	
	
	/*public List<Brand> brandList(){
		SqlSession session = null;
		
		
	}*/
}


























