package team4.cafe.app.controller.myPage;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import team4.cafe.app.model.vo.CommentVO;
import team4.cafe.app.model.vo.MemberVO;
import team4.cafe.app.pagination.Criteria;
import team4.cafe.app.pagination.PageMaker;
import team4.cafe.app.service.MyPageService;
import team4.cafe.app.service.MyPageServiceImp;


@WebServlet("/mypage/userComment")
public class MyPageUserComment extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
    private MyPageService myPageService = new MyPageServiceImp();
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 회원 정보를 가져옴
		MemberVO user = (MemberVO)request.getSession().getAttribute("user");
		
		// 회원의 총 댓글 수 가져옴
		int commentCount = myPageService.getCommentCount(user);
		
		String search = request.getParameter("search");
		int page;
		try {
			page = Integer.parseInt(request.getParameter("page"));
		}catch(Exception e) {
			// 예외가 발생하면 기본 1페이지
			page = 1;
		}
		// 검색어, 검색 타입, 현재 페이지, 한 페이지 컨텐츠 개수를 이용하여 현재 페이지 정보 객체를 생성
		Criteria cri = new Criteria(page, 2, "all", search);
		
		int totalCommentCount = myPageService.getTotalCountComment(cri, user);
		
		PageMaker pm = new PageMaker(2, cri, totalCommentCount);

		// 회원 정보를 주고, 게시글 이름 + 댓글을 가져온다
		ArrayList<CommentVO> commentList = myPageService.getCommentListByUser(user, cri);
		
		// 화면에 전송
		request.setAttribute("pm", pm);
		request.setAttribute("user", user);
		request.setAttribute("commentCount", commentCount);
		request.setAttribute("commentList", commentList);
		
		request.getRequestDispatcher("/WEB-INF/views/mypage/userComment.jsp").forward(request, response);
	}
}