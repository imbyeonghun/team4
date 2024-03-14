package team4.cafe.app.controller.post;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import team4.cafe.app.model.vo.BoardVO;
import team4.cafe.app.model.vo.MemberVO;
import team4.cafe.app.model.vo.PostVO;
import team4.cafe.app.service.BoardService;
import team4.cafe.app.service.BoardServiceImp;
import team4.cafe.app.service.PostService;
import team4.cafe.app.service.PostServiceImp;

@WebServlet("/post/insert")
public class PostInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private PostService postService = new PostServiceImp();
    private BoardService boardService = new BoardServiceImp();
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		MemberVO user = (MemberVO) request.getSession().getAttribute("user");
		if(user == null) {
			response.sendRedirect(request.getContextPath()+"/board/list");
			return;
		}
		
		int bo_num = Integer.parseInt(request.getParameter("num"));
		BoardVO board = boardService.getBoard(bo_num);
		request.setAttribute("board", board);
		request.getRequestDispatcher("/WEB-INF/views/post/insert.jsp").forward(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//유저 정보를 받아온다
		MemberVO user = (MemberVO) request.getSession().getAttribute("user");
		if(user == null) {
			response.sendRedirect(request.getContextPath()+"/post/list");
			return;
		}
		//게시판 번호는 현재 선택된 게시판 번호로
		int bo_num = Integer.parseInt(request.getParameter("num"));
		//입력한 제목 받아온다.
		String title = request.getParameter("title");
		//입력한 내용 받아온다.
		String content = request.getParameter("content");
		//유저 아이디 받아온다
		String writer = user.getMe_id();
		//작성시간 받아온다
		Date today = new Date();
		
		
		PostVO post = new PostVO(bo_num, title, writer, content, today);
		boolean res = postService.insertPost(post);
		
		if(res) {
			request.setAttribute("msg", "게시글을 등록했습니다.");
		}else {
			request.setAttribute("msg", "게시글을 등록하지 못했습니다.");
		}
		request.setAttribute("url", "");
		request.getRequestDispatcher("/WEB-INF/views/message.jsp").forward(request, response);
	}
}
