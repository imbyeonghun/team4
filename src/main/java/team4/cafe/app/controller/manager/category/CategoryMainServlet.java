package team4.cafe.app.controller.manager.category;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import team4.cafe.app.model.vo.CategoryVO;
import team4.cafe.app.service.BoardService;
import team4.cafe.app.service.BoardServiceImp;


@WebServlet("/manager/category")
public class CategoryMainServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private BoardService bs=new BoardServiceImp();
  
    //카테고리 기능 유저 확인기능만 추가하면 됨
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<CategoryVO> categoryList=bs.getCategoryList();
		request.setAttribute("categoryList",categoryList);
		request.getRequestDispatcher("/WEB-INF/views/manager/category.jsp").forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
