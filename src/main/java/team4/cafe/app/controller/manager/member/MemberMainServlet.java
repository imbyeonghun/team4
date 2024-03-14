package team4.cafe.app.controller.manager.member;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import team4.cafe.app.model.vo.GradeVO;
import team4.cafe.app.model.vo.StateVO;
import team4.cafe.app.service.MemberService;
import team4.cafe.app.service.MemberServiceImp;




@WebServlet("/manager/member")
public class MemberMainServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private MemberService ms=new MemberServiceImp();
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<GradeVO> gradeList=ms.getGradeList();
		ArrayList<StateVO> stateList=ms.getStateList();
		request.setAttribute("gradeList", gradeList);
		request.setAttribute("stateList", stateList);
		request.getRequestDispatcher("/WEB-INF/views/manager/member.jsp").forward(request, response);
	}

}
