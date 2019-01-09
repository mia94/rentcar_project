package com.yi.rentcar_project.handler;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.codehaus.jackson.map.ObjectMapper;

import com.yi.rentcar_project.model.Post;
import com.yi.rentcar_project.mvc.CommandHandler;
import com.yi.rentcar_project.service.PostService;

public class PostHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		// TODO Auto-generated method stub
		if(req.getMethod().equalsIgnoreCase("get")){
			return "/WEB-INF/view/post/post.jsp";
		}
		if(req.getMethod().equalsIgnoreCase("post")){
			String sido = req.getParameter("sido");
			String doro = req.getParameter("doro");
			
			PostService service = PostService.getInstance();
			
			Post address = new Post(sido, doro);			
			List<Post> list = service.selectPostByName(address);
			
			ObjectMapper om = new ObjectMapper();
			String json = om.writeValueAsString(list);
			
			res.setContentType("application/json;charset=utf-8");
			PrintWriter pw = res.getWriter();
			pw.print(json);
			pw.flush();
		}
		return null;
	}

}
