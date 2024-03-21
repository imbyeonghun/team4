package team4.cafe.app.controller.manager.board;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;

import com.fasterxml.jackson.databind.ObjectMapper;

import team4.cafe.app.model.vo.BoardVO;
import team4.cafe.app.pagination.BoardCriteria;
import team4.cafe.app.pagination.PageMaker;
import team4.cafe.app.service.BoardService;
import team4.cafe.app.service.BoardServiceImp;


@WebServlet("/manager/board/list")
public class BoardListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private BoardService bs=new BoardServiceImp();   
  
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int page=1;
		int coNum=0;
		try {
			page=Integer.parseInt(request.getParameter("page"));
			coNum=Integer.parseInt(request.getParameter("coNum"));
		} catch (Exception e) {
			e.printStackTrace();
		}
		BoardCriteria cri=new BoardCriteria(page, 5, coNum);
		ArrayList<BoardVO> boardList=bs.getBoardList(cri);
		int totalCount=bs.getBoardCount(cri);
		
		PageMaker pm=new PageMaker(5, cri, totalCount);
		JSONObject jobj = new JSONObject();
		ObjectMapper om=new ObjectMapper();
		String pmStr="";
		try {
			pmStr=om.writeValueAsString(pm);	
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		jobj.put("boardList",boardList);
		jobj.put("pm", pmStr);
		response.setContentType("application/json; charset=utf-8");
		response.getWriter().print(jobj);
	
	}

}
