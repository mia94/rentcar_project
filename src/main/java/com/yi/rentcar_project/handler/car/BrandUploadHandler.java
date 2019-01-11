package com.yi.rentcar_project.handler.car;

import java.io.File;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.yi.rentcar_project.model.Brand;
import com.yi.rentcar_project.mvc.CommandHandler;
import com.yi.rentcar_project.service.BrandService;

public class BrandUploadHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		BrandService service = BrandService.getInstance();
		
		if(req.getMethod().equalsIgnoreCase("get")){
			
			String maxCode = service.nextBrandNo();
			String sCode = maxCode.substring(1);
			int num = Integer.parseInt(sCode) + 1;
			String nextCode = "B"+num;
			
			req.setAttribute("nextCode", nextCode);
			
			return "/WEB-INF/view/car/brandupload.jsp";
		}else if(req.getMethod().equalsIgnoreCase("post")){
	
			//사진파일 저장
			String uploadPath = req.getRealPath("upload");
			
			File dir = new File(uploadPath);
			if(dir.exists()==false){//업로드 폴더가 없을때 만들어지도록
				dir.mkdirs();
			}
			
			try {
				MultipartRequest multi = new MultipartRequest(req,
															uploadPath,//서버측 업로드
															1024*1024*10,//10M
															new DefaultFileRenamePolicy()
															);
				
				String file = multi.getFilesystemName("brandImg");//brandImg의 키의 파일의 이름을 받아옴
				req.setAttribute("brandImg", file);
				
				String no = multi.getParameter("no");
				String name = multi.getParameter("name");
				
				Brand brand = new Brand(no, name);
				service.insertBrand(brand);
				
				return "brandlist.do";
			
			} catch (Exception e) {
				e.printStackTrace();
			}

			return "brandlist.do";
			
			
			
		}
		return null;
	}

}
