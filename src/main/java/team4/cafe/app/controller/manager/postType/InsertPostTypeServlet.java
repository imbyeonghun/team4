package team4.cafe.app.controller.manager.postType;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import team4.cafe.app.service.PostService;
import team4.cafe.app.service.PostServiceImp;

@WebServlet("/manager/postType/insert")
public class InsertPostTypeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private PostService ps=new PostServiceImp();   
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String ptName=request.getParameter("ptName");
		boolean res=ps.insertPostType(ptName);
		response.getWriter().write(res?"ok":"");
	}

}
