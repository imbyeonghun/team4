package team4.cafe.app.controller.post;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import team4.cafe.app.model.vo.CommentVO;
import team4.cafe.app.model.vo.PostVO;
import team4.cafe.app.pagination.CommentCriteria;
import team4.cafe.app.service.PostService;
import team4.cafe.app.service.PostServiceImp;

@WebServlet("/post/detail")
public class PostDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private PostService postService = new PostServiceImp();
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int num, bo_num, page = 1;
		try {
			num = Integer.parseInt(request.getParameter("num"));
			bo_num = Integer.parseInt(request.getParameter("bo_num"));
		} catch (Exception e) {
			num = 0;
			bo_num = 0;
		}
		CommentCriteria cri = new CommentCriteria(page, 2, num);
		ArrayList<CommentVO> coList = postService.getCommentList(cri);
		postService.updateView(num);
		PostVO post = postService.getPost(num);
		request.setAttribute("bo_num", bo_num);
		request.setAttribute("post", post);
		request.setAttribute("coList", coList);
		request.getRequestDispatcher("/WEB-INF/views/post/detail.jsp").forward(request, response);
	}

}
