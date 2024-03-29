package team4.cafe.app.controller.manager.category;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;

import team4.cafe.app.model.vo.CategoryVO;
import team4.cafe.app.service.BoardService;
import team4.cafe.app.service.BoardServiceImp;


@WebServlet("/manager/category")
public class CategoryMainServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private BoardService bs=new BoardServiceImp();
  
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/WEB-INF/views/manager/category.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	}
}
