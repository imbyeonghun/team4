package team4.cafe.app.controller.manager.category;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import team4.cafe.app.service.BoardService;
import team4.cafe.app.service.BoardServiceImp;


@WebServlet("/manager/category/insert")
public class InsertCategoryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private BoardService bs=new BoardServiceImp();
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String category=request.getParameter("coName");
		boolean res=bs.insertCategory(category);
		response.getWriter().write(res?"ok":"");
	}

}
