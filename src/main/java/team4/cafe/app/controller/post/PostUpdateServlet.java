package team4.cafe.app.controller.post;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import team4.cafe.app.model.vo.BoardVO;
import team4.cafe.app.model.vo.MemberVO;
import team4.cafe.app.model.vo.PostVO;
import team4.cafe.app.service.PostService;
import team4.cafe.app.service.PostServiceImp;

@WebServlet("/post/update")
public class PostUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private PostService postService = new PostServiceImp();
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//게시판, 게시글 번호를 받아온다
		int num, bo_num;
		try {
			num = Integer.parseInt(request.getParameter("num"));
			bo_num = Integer.parseInt(request.getParameter("bo_num"));
		} catch (Exception e) {
			num = 0;
			bo_num = 0;
		}
		PostVO post = postService.getPost(num);
		//현재 게시글 출력
		request.setAttribute("post", post);
		//현재 게시판 출력
		request.setAttribute("bo_num", bo_num);
		request.getRequestDispatcher("/WEB-INF/views/post/update.jsp").forward(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int num, bo_num;
		try {
			num = Integer.parseInt(request.getParameter("num"));
			bo_num = Integer.parseInt(request.getParameter("bo_num"));
		} catch (Exception e) {
			num = 0;
			bo_num = 0;
		}
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		Date today = new Date();
		PostVO post = new PostVO(bo_num, title, "", content, today);
		post.setPo_num(num);
		MemberVO user = (MemberVO) request.getSession().getAttribute("user");
		
		boolean res = postService.updatePost(post, user);
		if(res) {
			request.setAttribute("msg", "게시글을 수정했습니다.");
		}else {
			request.setAttribute("msg", "게시글을 수정하지 못했습니다.");
		}
		request.setAttribute("url", "/");
		request.getRequestDispatcher("/WEB-INF/views/message.jsp").forward(request, response);
	}

}
