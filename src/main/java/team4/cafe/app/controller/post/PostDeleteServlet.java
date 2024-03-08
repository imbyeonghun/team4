package team4.cafe.app.controller.post;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import team4.cafe.app.dao.BoardDAO;
import team4.cafe.app.model.vo.MemberVO;
import team4.cafe.app.service.BoardService;
import team4.cafe.app.service.BoardServiceImp;
import team4.cafe.app.service.PostService;
import team4.cafe.app.service.PostServiceImp;

@WebServlet("/post/delete")
public class PostDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private PostService postService = new PostServiceImp();
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//num을 가져옴
		int po_num, bo_num = 0;
		try {
			po_num = Integer.parseInt(request.getParameter("poNum"));
			bo_num = Integer.parseInt(request.getParameter("boNum"));
		} catch (Exception e) {
			po_num = 0;
		}
		//회원정보를 가져옴
		MemberVO user = (MemberVO) request.getSession().getAttribute("user");
		
		//board에게 삭제라하고 시킴
		boolean res = postService.deletePost(user, bo_num, po_num);
		//회원이면 게시글을 삭제한다
		if(res) {
			request.setAttribute("msg", "게시글을 삭제했습니다.");
			request.setAttribute("url", "/post/list");
		}else {
			request.setAttribute("msg", "게시글을 삭제하지 못했습니다.");
			request.setAttribute("url", "/post/list");
		}
		//게시글을 삭제하고 메세지 띄움
		request.getRequestDispatcher("/WEB-INF/views/message.jsp").forward(request, response);
	}

}
