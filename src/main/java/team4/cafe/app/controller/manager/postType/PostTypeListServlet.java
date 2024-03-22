package team4.cafe.app.controller.manager.postType;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;

import com.fasterxml.jackson.databind.ObjectMapper;

import team4.cafe.app.model.vo.CategoryVO;
import team4.cafe.app.model.vo.PostTypeVO;
import team4.cafe.app.pagination.Criteria;
import team4.cafe.app.pagination.PageMaker;
import team4.cafe.app.service.PostService;
import team4.cafe.app.service.PostServiceImp;

@WebServlet("/manager/postType/list")
public class PostTypeListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private PostService ps=new PostServiceImp();
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int page;
		try {
			page = Integer.parseInt(request.getParameter("page"));
		}catch(Exception e) {
			page=1;
			e.printStackTrace();
		}
		Criteria cri=new Criteria(page, 5);
		ArrayList<PostTypeVO> list=ps.getPostTypeList(cri);
		int totalCount=ps.getPostTypeCount(cri);
		PageMaker pm=new PageMaker(5, cri, totalCount);
		
		JSONObject jobj = new JSONObject();
		ObjectMapper om=new ObjectMapper();
		
		String pmStr="";
		try {
			pmStr=om.writeValueAsString(pm);	
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		jobj.put("list", list);
		jobj.put("pm", pmStr);
		response.setContentType("application/json; charset=utf-8");
		response.getWriter().print(jobj);
	}

}
