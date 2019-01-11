package com.yi.rentcar_project.handler.car;

import java.io.File;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.yi.rentcar_project.model.CarType;
import com.yi.rentcar_project.mvc.CommandHandler;
import com.yi.rentcar_project.service.CarTypeService;

public class CarTypeUploadHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		CarTypeService service = CarTypeService.getInstance();
		
		
		
		if(req.getMethod().equalsIgnoreCase("get")){

			String maxCode = service.nextTypeCode();
			String sCode = maxCode.substring(1);
			int num = Integer.parseInt(sCode) + 1;//숫자로 출력 앞에 0 사라짐
			String nextCode = "S"+num;
			
			req.setAttribute("nextCode", nextCode);
			
			return "/WEB-INF/view/car/cartypeupload.jsp";
		}else if(req.getMethod().equalsIgnoreCase("post")){
			//사진
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
				
				String file = multi.getFilesystemName("icon");//file1의 키의 파일의 이름을 받아옴
				
				req.setAttribute("file", file);
				
				String code = multi.getParameter("code");
				String type = multi.getParameter("type");
				
				CarType cartype = new CarType();
				cartype.setCode(code);
				cartype.setType(type);

				service.insertCarType(cartype);
				
				return "cartypelist.do";

			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}

		}
		return null;
	}

}
