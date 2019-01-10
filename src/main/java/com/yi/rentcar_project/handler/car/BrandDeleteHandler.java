package com.yi.rentcar_project.handler.car;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yi.rentcar_project.model.Brand;
import com.yi.rentcar_project.mvc.CommandHandler;
import com.yi.rentcar_project.service.BrandService;

public class BrandDeleteHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		String no = req.getParameter("no");
		Brand brand = new Brand();
		brand.setNo(no);

		BrandService service = BrandService.getInstance();
		service.deleteBrand(brand);
		
		return "caroptionlist.do";
	}

}
