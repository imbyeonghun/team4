package team4.cafe.app.controller.user;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import team4.cafe.app.model.dto.LoginDTO;
import team4.cafe.app.model.vo.MemberVO;
import team4.cafe.app.service.MemberService;
import team4.cafe.app.service.MemberServiceImp;

@WebServlet("/user/login")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private MemberService memberService = new MemberServiceImp();
	
	public LoginServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/WEB-INF/views/user/login.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		
		//아이디와 비번 입력을 하지 않았다면
		if(id == null) {
			//아이디를 입력해주세요 메세지 추가
			response.getWriter().write("id");
		}else if(pw == null) {
			//비번을 입력해주세요 메세지 추가
			response.getWriter().write("pw");
		}
		
		//아이디와 비번 체크
		
		//로그인 서비스
		MemberVO user = memberService.login(new LoginDTO(id,pw));
		
		//로그인 성공 시 회원 정보를 세션에 저장해 로그인 유지
		if(user != null) {
			HttpSession session =  request.getSession();
			session.setAttribute("user", user);
			System.out.println("로그인 성공");
			request.setAttribute("msg", "환영합니다.");
			response.sendRedirect(request.getContextPath() + "/");	//메인화면으로
			
			//카페 접속 횟수++
		
			
			
//			res = true;
		}else {
			System.out.println("로그인 실패");
			request.setAttribute("msg", "아이디 또는 비밀번호를 잘못 입력했습니다.");
			//로그인 실패 횟수++
			
			doGet(request, response);
//			res = false;
		}
		
		//message.jsp 화면을 전송
		request.getRequestDispatcher("/WEB-INF/views/message.jsp").forward(request, response);
	}

}
