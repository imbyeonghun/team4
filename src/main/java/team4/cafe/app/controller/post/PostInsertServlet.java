package team4.cafe.app.controller.post;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import team4.cafe.app.model.vo.MemberVO;
import team4.cafe.app.model.vo.PostVO;
import team4.cafe.app.service.PostService;
import team4.cafe.app.service.PostServiceImp;

@WebServlet("/post/insert")
public class PostInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private PostService postService = new PostServiceImp();
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		MemberVO user = (MemberVO) request.getSession().getAttribute("user");
		if(user == null) {
			response.sendRedirect(request.getContextPath()+"/board/list");
			return;
		}
		//게시판 번호는 현재 선택된 게시판 번호로
		int bo_num = Integer.parseInt(request.getParameter("boNum"));
		//게시글 리스트를 화면에 출력한다.
		ArrayList<PostVO> postList = postService.getPostList(bo_num);
		request.setAttribute("postList", postList);
		request.getRequestDispatcher("/WEB-INF/views/post/list.jsp").forward(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//입력한 제목 받아온다.
		String title = request.getParameter("title");
		//입력한 내용 받아온다.
		String content = request.getParameter("content");
		//유저 정보를 받아온다
		MemberVO user = (MemberVO) request.getSession().getAttribute("user");
		if(user == null) {
			response.sendRedirect(request.getContextPath()+"/board/list");
			return;
		}
		//작성자 닉네임으로 고정
		String writer = user.getMe_name();
		//작성시간 받아온다
		Date date = new Date();
		//게시판 번호는 현재 선택된 게시판 번호로
		int bo_num = Integer.parseInt(request.getParameter("boNum"));
		PostVO post = new PostVO(bo_num, title, writer, content, date);
		
		boolean res = postService.insertBoard(post);
		if(res) {
			request.setAttribute("msg", "게시글을 등록했습니다.");
			request.setAttribute("url", "/post/list");
		}
		request.getRequestDispatcher("/WEB-INF/views/post/insert.jsp").forward(request, response);
	}
}
