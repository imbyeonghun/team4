package team4.cafe.app.controller.user;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import team4.cafe.app.model.vo.MemberVO;
import team4.cafe.app.service.MemberService;
import team4.cafe.app.service.MemberServiceImp;


@WebServlet("/user/signup")
public class SignupServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private MemberService memberService = new MemberServiceImp();
       
    public SignupServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/WEB-INF/views/user/signup.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String email = request.getParameter("email");
		String nickName = request.getParameter("nickName");
		
		if(memberService.signup(new MemberVO(id, pw, email, nickName))) {
			//회원가입에 성공하면 메인 페이지로 이동
			System.out.println("회원가입 성공");
			response.sendRedirect(request.getContextPath()+"/");
		}
		else {
			//실패하면 안내문구 출력 후 회원가입 페이지 유지
			System.out.println("회원가입 실패");
			doGet(request, response);
		}
	}

	private void alert(String string) {
		// TODO Auto-generated method stub
		
	}

}
