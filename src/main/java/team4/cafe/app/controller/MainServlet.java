package team4.cafe.app.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import team4.cafe.app.model.vo.PostVO;
import team4.cafe.app.pagination.Criteria;
import team4.cafe.app.service.PostService;
import team4.cafe.app.service.PostServiceImp;


@WebServlet("/")
public class MainServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	PostService postService = new PostServiceImp();
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Criteria cri = new Criteria(1, 10, "all", "");
		ArrayList<PostVO> allPostList = postService.getAllPostList(cri);
		
		//기본 말머리 설정
//		postService.insertPostType
		
		request.setAttribute("postList", allPostList);
		request.getRequestDispatcher("/WEB-INF/views/home.jsp").forward(request, response);
	}
}
