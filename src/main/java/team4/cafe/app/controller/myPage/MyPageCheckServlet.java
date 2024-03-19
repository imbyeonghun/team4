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


@WebServlet("/mypage/check")
public class MyPageCheckServlet extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	private MyPageService myPageService = new MyPageServiceImp();
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/WEB-INF/views/mypage/check.jsp").forward(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		MemberVO user = (MemberVO)request.getSession().getAttribute("user");
		String pw = user.getMe_pw();
		String checkPw = request.getParameter("checkPw");
		
		if(pw.equals(checkPw)) {
			user.setMe_fail(0);
			request.setAttribute("msg", "본인확인 완료");
			request.setAttribute("url", "mypage/update");
		}else {
			user.setMe_fail(user.getMe_fail() + 1);
			request.setAttribute("msg", "본인확인 실패");
			request.setAttribute("url", "mypage/check");
		}
		myPageService.updateFailCount(user);
		request.getSession().setAttribute("user", user);
		
		if(user.getMe_fail() == 5) {
			myPageService.updateMemberStop(user);
			request.getSession().removeAttribute("user");
			request.setAttribute("url", "mypage/");
		}
		request.getRequestDispatcher("/WEB-INF/views/message.jsp").forward(request, response);
	}
}