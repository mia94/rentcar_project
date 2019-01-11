package com.yi.rentcar_project.handler.car;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yi.rentcar_project.model.Brand;
import com.yi.rentcar_project.mvc.CommandHandler;
import com.yi.rentcar_project.service.BrandService;

public class BrandModifyHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		
		BrandService service = BrandService.getInstance();
		
		if(req.getMethod().equalsIgnoreCase("get")){
			String no = req.getParameter("no");
			Brand brand = new Brand();
			brand.setNo(no);

			brand = service.selectBrandByNo(brand);
			
			req.setAttribute("brand", brand);
			
			return "/WEB-INF/view/car/brandmodify.jsp";
			
		}else if(req.getMethod().equalsIgnoreCase("post")){
			String no = req.getParameter("no");
			String name = req.getParameter("name");
			
			Brand brand = new Brand();
			brand.setNo(no);
			brand.setName(name);
			
			service.updateBrand(brand);
			
			return "brandlist.do";
		}
		return null;
	}

}
