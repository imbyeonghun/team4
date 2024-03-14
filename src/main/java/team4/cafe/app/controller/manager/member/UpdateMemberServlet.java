package team4.cafe.app.controller.manager.member;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import team4.cafe.app.model.vo.MemberVO;
import team4.cafe.app.service.MemberService;
import team4.cafe.app.service.MemberServiceImp;


@WebServlet("/manager/member/update")
public class UpdateMemberServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private MemberService ms=new MemberServiceImp();
   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String grade=request.getParameter("grade");
		String state=request.getParameter("state");
		String userId=request.getParameter("userId");
		MemberVO member=new MemberVO(userId, state, grade);
		boolean res=ms.updateMember(member);
		response.getWriter().write(res?"ok":"");
	}

}
