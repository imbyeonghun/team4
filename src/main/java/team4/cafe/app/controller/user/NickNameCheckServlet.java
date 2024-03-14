package team4.cafe.app.controller.user;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import team4.cafe.app.service.MemberService;
import team4.cafe.app.service.MemberServiceImp;


@WebServlet("/user/nickNameCheck")
public class NickNameCheckServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	private MemberService memberService = new MemberServiceImp();
  
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String nickName = request.getParameter("nickName");
		boolean res = memberService.checkNickName(nickName);
		response.getWriter().write(""+res);
}


}
