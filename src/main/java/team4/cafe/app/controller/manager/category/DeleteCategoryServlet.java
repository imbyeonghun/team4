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
   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int co_num;
		try {
			co_num=Integer.parseInt(request.getParameter("num")); 
		} catch (Exception e) {
			co_num=0;
		}
		boolean res=bs.deleteCategory(co_num);
		
		response.getWriter().write(res?"ok":"");
	}

}
