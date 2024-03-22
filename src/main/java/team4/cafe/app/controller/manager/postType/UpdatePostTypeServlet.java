package team4.cafe.app.controller.manager.postType;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import team4.cafe.app.service.PostService;
import team4.cafe.app.service.PostServiceImp;

@WebServlet("/manager/postType/update")
public class UpdatePostTypeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private PostService ps=new PostServiceImp(); 
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int num=0;
		try {
			num=Integer.parseInt(request.getParameter("num"));
		} catch (Exception e) {
			e.printStackTrace();
		}
		String name=request.getParameter("update");
		System.out.println(num+" "+name);
		boolean res=ps.updatePostType(num,name);
		if(res) {
			request.setAttribute("msg", "수정 완료");
		}else {
			request.setAttribute("msg", "수정 실패");
		}
		request.setAttribute("url","/manager/postType");
		request.getRequestDispatcher("/WEB-INF/views/message.jsp").forward(request, response);
	}

}
