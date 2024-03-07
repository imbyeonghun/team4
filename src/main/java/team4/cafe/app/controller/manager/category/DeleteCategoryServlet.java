package team4.cafe.app.controller.manager.category;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import team4.cafe.app.service.BoardService;
import team4.cafe.app.service.BoardServiceImp;

@WebServlet("/manager/category/delete")
public class DeleteCategoryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private BoardService bs=new BoardServiceImp();
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int co_num;
		try {
			co_num=Integer.parseInt(request.getParameter("num")); 
		} catch (Exception e) {
			co_num=0;
		}
		boolean res=bs.deleteCategory(co_num);
		
		if(res) {
			request.setAttribute("msg","삭제 완료");
		}else {
			request.setAttribute("msg","삭제 실패");
		}
		request.setAttribute("url","/manager/category");
		request.getRequestDispatcher("/WEB-INF/views/message.jsp").forward(request, response);
	}

}
