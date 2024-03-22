package team4.cafe.app.controller.post;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import team4.cafe.app.model.vo.BoardVO;
import team4.cafe.app.model.vo.MemberVO;
import team4.cafe.app.model.vo.PostTypeVO;
import team4.cafe.app.model.vo.PostVO;
import team4.cafe.app.service.BoardService;
import team4.cafe.app.service.BoardServiceImp;
import team4.cafe.app.service.MemberService;
import team4.cafe.app.service.MemberServiceImp;
import team4.cafe.app.service.MyPageService;
import team4.cafe.app.service.MyPageServiceImp;
import team4.cafe.app.service.PostService;
import team4.cafe.app.service.PostServiceImp;

@WebServlet("/post/insert")
public class PostInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private PostService postService = new PostServiceImp();
    private BoardService boardService = new BoardServiceImp();
    private MyPageService myPageService = new MyPageServiceImp();
    private MemberService memberService = new MemberServiceImp();
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		MemberVO user = (MemberVO) request.getSession().getAttribute("user");
		if(user == null) {
			response.sendRedirect(request.getContextPath()+"/board/list");
			return;
		}
		int bo_num = Integer.parseInt(request.getParameter("num"));
		BoardVO board = boardService.getBoard(bo_num);
		ArrayList<PostTypeVO> typeList = postService.getPostTypeList();
		request.setAttribute("board", board);
		request.setAttribute("typeList", typeList);
		System.out.println("보드 등급 : " + board.getBo_gr_name());
		System.out.println("유저 등급 : " + user.getMe_gr_name());
		//등급 이름으로 등급 순위 가져오기 
		int boardGrRank = memberService.getGradeRank(board.getBo_gr_name());
		int userGrRank = memberService.getGradeRank(user.getMe_gr_name());
		
		System.out.println("boardGrRank : " + boardGrRank + " userGrRank : " + userGrRank);

		//만약 유저 등급이 게시판 등급보다 크거나 같으면 글을 등록할 수 없다는 메세지 띄운 후 목록페이지 유지
		if(boardGrRank < userGrRank) {
			String str = "해당 게시판은 " + board.getBo_gr_name() +" 회원이상만 게시글을 등록할 수 있습니다.\\n당신은 " + user.getMe_gr_name() + " 회원입니다.";
			request.setAttribute("msg", str);
			request.setAttribute("url", "post/list?bo_num="+bo_num);
			request.getRequestDispatcher("/WEB-INF/views/message.jsp").forward(request, response);
			return;
		}
		request.getRequestDispatcher("/WEB-INF/views/post/insert.jsp").forward(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//유저 정보를 받아온다
		MemberVO user = (MemberVO) request.getSession().getAttribute("user");
		if(user == null) {
			response.sendRedirect(request.getContextPath()+"/post/list");
			return;
		}
		//게시판 번호는 현재 선택된 게시판 번호로
		int bo_num,pt_num;
		try {
			bo_num = Integer.parseInt(request.getParameter("num"));
			pt_num = Integer.parseInt(request.getParameter("pt_num"));
		} catch (Exception e) {
			bo_num = 0;
			pt_num = 0;
		}

		if(pt_num == 0) {
			pt_num = 1;
		}
		
		//입력한 제목 받아온다.
		String title = request.getParameter("title");
		//입력한 내용 받아온다.
		String content = request.getParameter("content");
		//유저 아이디 받아온다
		String writer = user.getMe_id();
		//작성시간 받아온다
		Date today = new Date();
		
		PostVO post = new PostVO(bo_num, pt_num, title, writer, content, today);
		
		boolean res = postService.insertPost(post);
		String str ="";
		if(myPageService.getPostCount(user)>=10) {
			str += "등급이 Level2로 올랐습니다.";
			//레벨셋해서
			//유저 등급 을 레벨2로
			user.setMe_gr_name("Level2");
			//DB에 저장
			myPageService.updateUserInfo(user);
			//세션에 저장
			HttpSession session =  request.getSession();
			session.setAttribute("user", user);
		}else if(myPageService.getPostCount(user)>=20) {
			str += "등급이 Level3로 올랐습니다.";
			//유저 등급 3으로 
			user.setMe_gr_name("Level3");
			//DB에 저장
			myPageService.updateUserGrade(user);
			//세션에 저장
			HttpSession session =  request.getSession();
			session.setAttribute("user", user);
		}
		
		if(res) {
			str +=  "\\n게시글을 등록했습니다.";
			request.setAttribute("msg", str);
		}else {
			str +=  "\\n게시글을 등록하지 못했습니다.";
			request.setAttribute("msg", str);
		}
		request.setAttribute("url", "post/list?bo_num="+bo_num);
		request.getRequestDispatcher("/WEB-INF/views/message.jsp").forward(request, response);
	}
}
