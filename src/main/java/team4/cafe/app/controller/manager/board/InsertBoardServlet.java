package team4.cafe.app.controller.manager.board;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import team4.cafe.app.model.vo.BoardVO;
import team4.cafe.app.service.BoardService;
import team4.cafe.app.service.BoardServiceImp;


@WebServlet("/manager/board/insert")
public class InsertBoardServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private BoardService bs=new BoardServiceImp();    
   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int co_num=0;
		try {
			co_num=Integer.parseInt(request.getParameter("coNum"));
		} catch (Exception e) {
			e.printStackTrace();
		}
		String bo_name=request.getParameter("boName");
		BoardVO board=new BoardVO(bo_name, co_num);
		boolean res=bs.insertBoard(board);
		response.getWriter().write(res?"ok":"");
	}

}
