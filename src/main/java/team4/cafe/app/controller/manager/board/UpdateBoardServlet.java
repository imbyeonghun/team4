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

@WebServlet("/manager/board/update")
public class UpdateBoardServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private BoardService bs=new BoardServiceImp();    
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int num=0;
		String gr_name=null;
		try {
			num=Integer.parseInt(request.getParameter("num"));
			gr_name=request.getParameter("grade");
		} catch (Exception e) {
			e.printStackTrace();
		}
		String bo_name=request.getParameter("update");
		BoardVO board=new BoardVO(num,bo_name,gr_name);
		boolean res=bs.updateBoard(board);
		if(res) {
			request.setAttribute("msg","수정 완료");
		}else {
			request.setAttribute("msg","수정 실패");
		}
		request.setAttribute("url","/manager/board");
		request.getRequestDispatcher("/WEB-INF/views/message.jsp").forward(request, response);
	}

}
