package team4.cafe.app.controller.post;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import team4.cafe.app.model.vo.PostVO;
import team4.cafe.app.service.PostService;
import team4.cafe.app.service.PostServiceImp;

@WebServlet("/post/list")
public class PostListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private PostService postService = new PostServiceImp();
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//게시판 번호를 받아온다
		int bo_num;
		//게시판 번호와 일치하는 게시글 리스트를 불러온다
		try {
			bo_num = Integer.parseInt(request.getParameter("bo_num"));
		} catch (Exception e) {
			bo_num = 0;
		}
		request.setAttribute("bo_num", ""+bo_num);
		
		//게시글 리스트를 화면에 출력한다.
		ArrayList<PostVO> postList = postService.getPostList(bo_num);
		request.setAttribute("postList", postList);
		request.getRequestDispatcher("/WEB-INF/views/post/list.jsp").forward(request, response);
	}

}
