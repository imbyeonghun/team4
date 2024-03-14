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
		
		//로그인 서비스
		MemberVO user = memberService.login(new LoginDTO(id,pw));
		
		//로그인 성공 시 회원 정보를 세션에 저장해 로그인 유지
		if(user != null) {
			//로그인 세션에 회원 정보 저장 및 유지
			HttpSession session =  request.getSession();
			session.setAttribute("user", user);

			request.setAttribute("msg", "환영합니다.");
			request.setAttribute("url", "");
			
			//message.jsp 화면을 전송
			request.getRequestDispatcher("/WEB-INF/views/message.jsp").forward(request, response);
			return;
		}else {	//로그인 실패 시
			String str="아이디 또는 비밀번호를 잘못 입력했습니다.";
			
			//비밀번호만 틀렸을 때 
			
				//로그인 실패 횟수++
				int loginFail = user.getMe_fail();
				//만약 로그인 실패 횟수가 5회면 정지
				
				if(loginFail == 5) {
					str += "\n로그인 실패횟수를 다 사용했습니다. 계정이 정지됩니다.";
					
				}
			
			request.setAttribute("msg", str);
			request.setAttribute("url", "user/login");
			
			
			//message.jsp 화면을 전송
			request.getRequestDispatcher("/WEB-INF/views/message.jsp").forward(request, response);
		}
	}

}
