package team4.cafe.app.controller.myPage;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import team4.cafe.app.model.vo.BoardVO;
import team4.cafe.app.model.vo.MemberVO;
import team4.cafe.app.pagination.Criteria;
import team4.cafe.app.service.MyPageService;
import team4.cafe.app.service.MyPageServiceImp;


@WebServlet("/mypage/userPost")
public class MyPageUserPost extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
    private MyPageService myPageService = new MyPageServiceImp();
 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 회원 정보를 가져옴
		MemberVO user = (MemberVO)request.getSession().getAttribute("user");
		
		// 회원 정보를 서비스에게 보내 게시글 조회에서 게시글 총 수를 가져오게 시킴
		int postCount = myPageService.getPostCount(user);
		
		// 회원이 작성한 게시글을 가져오는데 해당 게시글에 게시판도 가져옴
		ArrayList<BoardVO> postList = myPageService.getPostListByUser(user);
		
		int page;
		try {
			page = Integer.parseInt(request.getParameter("page"));
		}catch(Exception e) {
			// 예외가 발생하면 기본 1페이지
			page = 1;
		}
		// 현재 페이지정보를 가지고 페이지에 맞는 게시글을 가져옴
		Criteria cri = new Criteria(page, 2);
		
		// 화면에 전송
		request.setAttribute("postCount", postCount);
		request.setAttribute("postList", postList);
		request.getRequestDispatcher("/WEB-INF/views/mypage/userPost.jsp").forward(request, response);
	}
}