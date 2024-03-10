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

@WebServlet("/mypage/update")
public class MyPageUpdateServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;
	private MyPageService myPageService = new MyPageServiceImp();
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/WEB-INF/views/mypage/update.jsp").forward(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 로그인 된 아이디를 가져옴
		MemberVO user = (MemberVO)request.getSession().getAttribute("user");
		
		// 입력받은 비밀번호,닉네임,이메일을 불러옴
		String pw = request.getParameter("pw");
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		
		// pw가 없을때
		if(pw == "") {
			pw = user.getMe_pw();
		}
		// name이 없을때
		if(name == "") {
			name = user.getMe_name();
		}
		// email이 없을때
		if(email == "") {
			email = user.getMe_email();
		}
		
		// 로그인된 아이디와 해당 정보들을 가지는 객체를 생성
		MemberVO updateUser = new MemberVO(user.getMe_id(), pw, email, name);
		
		// 생성된 객체를 서비스에게 보내서 업데이트
		if(myPageService.updateUserInfo(updateUser)) {
			request.setAttribute("msg", "정보를 수정했습니다");
			request.setAttribute("url", "mypage/myPageHome");
		}else {
			request.setAttribute("msg", "정보를 수정하지 못했습니다");
			request.setAttribute("url", "mypage/update");
		}
		request.getRequestDispatcher("/WEB-INF/views/message.jsp").forward(request, response);
	}
}