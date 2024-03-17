package team4.cafe.app.controller.myPage;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import team4.cafe.app.model.vo.MemberVO;
import team4.cafe.app.service.MyPageService;
import team4.cafe.app.service.MyPageServiceImp;

/**
 * Servlet implementation class MyPageSecession
 */
@WebServlet("/mypage/secession")
public class MyPageSecession extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	private MyPageService myPageService = new MyPageServiceImp();

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 카페 탈퇴할 아이디를 가져옴
		String me_id = request.getParameter("id");
		
		// 서비스에게 아이디를 주면서 삭제하라고 시킨 후 삭제 여부를 알려달라고 요청
		if(myPageService.deleteMember(me_id)) {	// 삭제에 성공하면
			myPageService.updateMemberSecession(me_id);
			// 화면에 msg로 게시글을 삭제했습니다.라고 전송
			request.setAttribute("msg", "탈퇴했습니다.");
			// 화면에 url로 board/list로 전송
			request.setAttribute("url", "");
		}else {	// 실패하면
			// 화면에 msg로 게시글을 삭제하지 못했습니다.라고 전송
			request.setAttribute("msg", "탈퇴하지 못했습니다.");
			// 화면에 url로 board/detail?num=번호 로 전송
			request.setAttribute("url", "mypage/myPageHome");
		}
		request.getRequestDispatcher("/WEB-INF/views/message.jsp").forward(request, response);
	}
}