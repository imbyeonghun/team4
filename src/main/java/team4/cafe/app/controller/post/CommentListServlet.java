package team4.cafe.app.controller.post;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;

import com.fasterxml.jackson.databind.ObjectMapper;

import team4.cafe.app.model.vo.CommentVO;
import team4.cafe.app.pagination.Criteria;
import team4.cafe.app.pagination.PageMaker;
import team4.cafe.app.service.PostService;
import team4.cafe.app.service.PostServiceImp;

@WebServlet("/comment/list")
public class CommentListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	private PostService postService = new PostServiceImp();
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int po_num = 0, page = 1;
		try {
			page = Integer.parseInt(request.getParameter("page"));
			po_num = Integer.parseInt(request.getParameter("poNum"));
		} catch (Exception e) {
			e.printStackTrace();
		}
		Criteria cri = new Criteria(page, 2, "", ""+po_num);
		ArrayList<CommentVO> coList = postService.getCommentList(cri);
		int totalCount = postService.getTotalCommentCount(cri);
		PageMaker pm = new PageMaker(3, cri, totalCount);
		System.out.println(pm);
		JSONObject jobj = new JSONObject();
		
		ObjectMapper om = new ObjectMapper();
		String pmStr = "";
		try {
			pmStr = om.writeValueAsString(pm);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		jobj.put("coList", coList);
		jobj.put("pm", pmStr);
		response.setContentType("application/json; charset=utf-8");
		response.getWriter().print(jobj);
	}
}
