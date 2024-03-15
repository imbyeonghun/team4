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
			String str="아이디 또는 비밀번호를 잘못 입력했습니다.\\n"
					+ "비밀번호 6회 이상 불일치 할 경우 계정이 정지됩니다.";
			
			//아이디로 회원정보 불러오기
			MemberVO userFail = memberService.getMember(id);
			
			int loginFailCount;
			
			//비번만 틀렸을 때
			if(userFail != null) {
				System.out.println("LoginServlet : 비번만 틀림");
				//로그인 실패 횟수 증가
				memberService.addFailCount(userFail);
				//로그인 카운트 불러오기
				loginFailCount = userFail.getMe_fail() + 1;
			}else {
				System.out.println("LoginServlet : 아이디와 비번 다 틀림");
				loginFailCount = 1;
			}
			
			str += "\\n현재 로그인 실패 횟수 : " + loginFailCount + "회";
					
			if(loginFailCount > 5) {
				System.out.println("로그인 실패 횟수 5회됨 : 정지");
				str += "\\n로그인 실패횟수를 다 사용했습니다.\\n계정이 정지됩니다.";
				memberService.stopMember(userFail);
			}
			
			
			System.out.println(str);
			request.setAttribute("msg", str);
			request.setAttribute("url", "user/login");
			
			
			//message.jsp 화면을 전송
			request.getRequestDispatcher("/WEB-INF/views/message.jsp").forward(request, response);
		}
	}

}
