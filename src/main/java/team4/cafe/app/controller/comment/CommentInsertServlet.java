package team4.cafe.app.controller.comment;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import team4.cafe.app.model.vo.CommentVO;
import team4.cafe.app.model.vo.MemberVO;
import team4.cafe.app.service.MyPageService;
import team4.cafe.app.service.MyPageServiceImp;
import team4.cafe.app.service.PostService;
import team4.cafe.app.service.PostServiceImp;

@WebServlet("/comment/insert")
public class CommentInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private PostService postService = new PostServiceImp();
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String content = request.getParameter("content");
		int po_num = 0;
		try {
			po_num = Integer.parseInt(request.getParameter("po_num"));
		} catch (Exception e) {
			e.printStackTrace();
		}
		MemberVO user = (MemberVO) request.getSession().getAttribute("user");
		CommentVO comment = new CommentVO(po_num, content, user.getMe_id());
		boolean res = postService.insertComment(comment);
		

		response.getWriter().write(res?"ok":"");
	}

}
