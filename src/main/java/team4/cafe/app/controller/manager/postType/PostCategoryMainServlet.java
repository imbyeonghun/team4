package team4.cafe.app.controller.manager.postType;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

<<<<<<<< HEAD:src/main/java/team4/cafe/app/controller/manager/postType/PostCategoryMainServlet.java
import team4.cafe.app.model.vo.PostTypeVO;
import team4.cafe.app.service.PostService;
import team4.cafe.app.service.PostServiceImp;

@WebServlet("/manager/postCategory")
public class PostCategoryMainServlet extends HttpServlet {
@WebServlet("/manager/postType")
public class PostTypeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private PostService postService = new PostServiceImp();
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<PostTypeVO> postTypeList = postService.getPostTypeList();
		request.setAttribute("postTypeList", postTypeList);
		request.getRequestDispatcher("/WEB-INF/views/manager/postCategory.jsp").forward(request, response);
		request.getRequestDispatcher("/WEB-INF/views/manager/postType.jsp").forward(request, response);
	}

}
