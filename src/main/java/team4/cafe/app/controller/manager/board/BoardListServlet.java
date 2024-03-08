package team4.cafe.app.controller.manager.board;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;

import team4.cafe.app.model.vo.BoardVO;
import team4.cafe.app.service.BoardService;
import team4.cafe.app.service.BoardServiceImp;


@WebServlet("/manager/board/list")
public class BoardListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private BoardService bs=new BoardServiceImp();   
  
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int coNum=0;
		try {
			coNum=Integer.parseInt(request.getParameter("coNum"));
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		ArrayList<BoardVO> boardList=bs.getBoardList(coNum);
		JSONObject jobj = new JSONObject();
		jobj.put("coNum",coNum);
		jobj.put("boardList",boardList);
		response.setContentType("application/json; charset=utf-8");
		response.getWriter().print(jobj);
	
	}

}
