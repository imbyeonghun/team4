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
import team4.cafe.app.service.MyPageService;
import team4.cafe.app.service.MyPageServiceImp;


@WebServlet("/mypage/userComment")
public class MyPageUserComment extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
    private MyPageService myPageService = new MyPageServiceImp();
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 회원 정보를 가져옴
		MemberVO user = (MemberVO)request.getSession().getAttribute("user");
		
		int commentCount = myPageService.getCommentCount(user);
		
		// 회원 정보를 주고, 게시글 이름 + 댓글을 가져온다
		ArrayList<CommentVO> commentList = myPageService.getCommentListByUser(user);
		
		// 화면에 전송
		request.setAttribute("user", user);
		request.setAttribute("commentCount", commentCount);
		request.setAttribute("commentList", commentList);
		
		request.getRequestDispatcher("/WEB-INF/views/mypage/userComment.jsp").forward(request, response);
	}
}