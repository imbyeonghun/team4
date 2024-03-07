package team4.cafe.app.controller.manager.board;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import team4.cafe.app.model.vo.BoardVO;
import team4.cafe.app.model.vo.CategoryVO;
import team4.cafe.app.service.BoardService;
import team4.cafe.app.service.BoardServiceImp;


@WebServlet("/manager/board")
public class BoardMainServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private BoardService bs=new BoardServiceImp();   
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<CategoryVO> categoryList=bs.getCategoryList();
		request.setAttribute("categoryList", categoryList);
		request.getRequestDispatcher("/WEB-INF/views/manager/board.jsp").forward(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int num=Integer.parseInt(request.getParameter("num"));
		ArrayList<BoardVO> boardList=bs.getBoardList(num);
		request.setAttribute("boardList", boardList);
		request.getRequestDispatcher("/WEB-INF/views/manager/board.jsp").forward(request, response);
	}
}
