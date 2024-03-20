package team4.cafe.app.controller.comment;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import team4.cafe.app.model.vo.MemberVO;
import team4.cafe.app.service.PostService;
import team4.cafe.app.service.PostServiceImp;

@WebServlet("/comment/delete")
public class CommentDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private PostService postService = new PostServiceImp();

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int num = 0;
		try {
			num = Integer.parseInt(request.getParameter("num"));
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		MemberVO user = (MemberVO) request.getSession().getAttribute("user");
		boolean res = postService.deleteComment(num, user);
		response.getWriter().write(res?"ok":"");
	}

}
