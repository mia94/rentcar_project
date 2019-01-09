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
		if(req.getMethod().equalsIgnoreCase("get")){
			return "/WEB-INF/view/car/brandupload.jsp";
		}else if(req.getMethod().equalsIgnoreCase("post")){
			//브랜드 추가
			String no = req.getParameter("no");
			String name = req.getParameter("name");
			
			Brand brand = new Brand(no, name);
			
			BrandService service = BrandService.getInstance();
			service.insertBrand(brand);
			
			
			return "caroptionlist.do";
			//사진파일 저장
			/*String uploadPath = req.getRealPath("upload");
			
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
				
				return "caroptionlist.do";
			
			} catch (Exception e) {
				e.printStackTrace();
			}*/
			
			
		}
		return null;
	}

}
