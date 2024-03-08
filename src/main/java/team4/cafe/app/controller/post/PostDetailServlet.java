package team4.cafe.app.controller.post;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import team4.cafe.app.model.vo.PostVO;
import team4.cafe.app.service.PostService;
import team4.cafe.app.service.PostServiceImp;

@WebServlet("/post/detail")
public class PostDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private PostService postService = new PostServiceImp();
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int bo_num, po_num = 0;
		try {
			bo_num = Integer.parseInt(request.getParameter("boNum"));
			po_num = Integer.parseInt(request.getParameter("poNum"));
		} catch (Exception e) {
			bo_num = 0;
			po_num = 0;
		}
		postService.updateView(bo_num, po_num);
		PostVO post = postService.getPost(bo_num, po_num);
		request.setAttribute("post", post);
		request.getRequestDispatcher("/WEB-INF/views/post/detail.jsp").forward(request, response);
	}

}
