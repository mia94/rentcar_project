package com.yi.rentcar_project.handler.car;

import java.io.File;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.yi.rentcar_project.mvc.CommandHandler;

public class CarImgUploadHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
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
			
			String file = multi.getFilesystemName("carImg");//file1의 키의 파일의 이름을 받아옴
			req.setAttribute("carImg", file);
			
			return "/WEB-INF/view/car/carupload.jsp";
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

}
