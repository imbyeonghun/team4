package team4.cafe.app.controller.post;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import team4.cafe.app.model.vo.BoardVO;
import team4.cafe.app.model.vo.MemberVO;
import team4.cafe.app.model.vo.PostTypeVO;
import team4.cafe.app.model.vo.PostVO;
import team4.cafe.app.service.BoardService;
import team4.cafe.app.service.BoardServiceImp;
import team4.cafe.app.service.MyPageService;
import team4.cafe.app.service.MyPageServiceImp;
import team4.cafe.app.service.PostService;
import team4.cafe.app.service.PostServiceImp;

@WebServlet("/post/insert")
public class PostInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private PostService postService = new PostServiceImp();
    private BoardService boardService = new BoardServiceImp();
    private MyPageService myPageService = new MyPageServiceImp();
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		MemberVO user = (MemberVO) request.getSession().getAttribute("user");
		if(user == null) {
			response.sendRedirect(request.getContextPath()+"/board/list");
			return;
		}
		
		int bo_num = Integer.parseInt(request.getParameter("num"));
		BoardVO board = boardService.getBoard(bo_num);
		ArrayList<PostTypeVO> typeList = postService.getPostTypeList();
		request.setAttribute("board", board);
		request.setAttribute("typeList", typeList);
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
		int bo_num,pt_num;
		try {
			bo_num = Integer.parseInt(request.getParameter("num"));
			pt_num = Integer.parseInt(request.getParameter("pt_num"));
		} catch (Exception e) {
			bo_num = 0;
			pt_num = 0;
		}
		//입력한 제목 받아온다.
		String title = request.getParameter("title");
		//입력한 내용 받아온다.
		String content = request.getParameter("content");
		//유저 아이디 받아온다
		String writer = user.getMe_id();
		//작성시간 받아온다
		Date today = new Date();
		
		
		PostVO post = new PostVO(bo_num, pt_num, title, writer, content, today);
		boolean res = postService.insertPost(post);
		String str ="";
		if(myPageService.getPostCount(user)>=10 && myPageService.getCommentCount(user)>=10) {
			str += "등급이 ";
			//레벨셋해서
			//
			//유저 등급 을 레벨2로
		}else if(myPageService.getPostCount(user)>=20 && myPageService.getCommentCount(user)>=20) {
			//유저 등급 3으로 
		}
		
		if(res) {
			str +=  "게시글을 등록했습니다.";
			request.setAttribute("msg", "게시글을 등록했습니다.");
		}else {
			request.setAttribute("msg", "게시글을 등록하지 못했습니다.");
		}
		request.setAttribute("url", "post/list?bo_num="+bo_num);
		request.getRequestDispatcher("/WEB-INF/views/message.jsp").forward(request, response);
	}
}
