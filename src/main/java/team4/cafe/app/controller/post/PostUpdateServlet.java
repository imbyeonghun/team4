package team4.cafe.app.controller.post;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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

@WebServlet("/post/update")
public class PostUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private PostService postService = new PostServiceImp();
    private BoardService boardService = new BoardServiceImp();
    private MyPageService myPageService = new MyPageServiceImp();
    private MemberService memberService = new MemberServiceImp();
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//게시판, 게시글 번호를 받아온다
		int num;
		try {
			num = Integer.parseInt(request.getParameter("num"));
		} catch (Exception e) {
			num = 0;
		}
		ArrayList<BoardVO> boList = postService.getBoardList();
		ArrayList<PostTypeVO> typeList = postService.getPostTypeList();
		PostVO post = postService.getPost(num);
		request.setAttribute("boList", boList);
		request.setAttribute("typeList", typeList);
		request.setAttribute("post", post);
		request.getRequestDispatcher("/WEB-INF/views/post/update.jsp").forward(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int num=0,  bo_num=0,pt_num=1;
		try {
			num = Integer.parseInt(request.getParameter("num"));
			bo_num = Integer.parseInt(request.getParameter("bo_num"));
			pt_num = Integer.parseInt(request.getParameter("pt_num"));
		} catch (Exception e) {
			e.printStackTrace();
		}
		MemberVO user = (MemberVO) request.getSession().getAttribute("user");
		
		//게시판 등급에 따라 수정 불가
		BoardVO board = boardService.getBoard(bo_num);
		//등급 이름으로 등급 순위 가져오기 
		int boardGrRank = memberService.getGradeRank(board.getBo_gr_name());
		int userGrRank = memberService.getGradeRank(user.getMe_gr_name());
		
		//만약 유저 등급이 게시판 등급보다 크거나 같으면 글을 등록할 수 없다는 메세지 띄운 후 목록페이지 유지
		if(boardGrRank < userGrRank) {
			String str = "해당 게시판은 " + board.getBo_gr_name() +" 회원이상만 게시글을 등록할 수 있습니다.\\n당신은 " + user.getMe_gr_name() + " 회원입니다.";
			request.setAttribute("msg", str);
			request.setAttribute("url", "/post/detail?num="+num +"&bo_num="+bo_num);
			request.getRequestDispatcher("/WEB-INF/views/message.jsp").forward(request, response);
			return;
		}
		
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		Date today = new Date();
		PostVO post = new PostVO(bo_num, pt_num, title, "", content, today);
		post.setPo_num(num);
		
		boolean res = postService.updatePost(post, user);
		if(res) {
			request.setAttribute("msg", "게시글을 수정했습니다.");
			//여기
			request.setAttribute("url","/post/detail?num="+num +"&bo_num="+bo_num);
		}else {
			request.setAttribute("msg", "게시글을 수정하지 못했습니다.");
			request.setAttribute("url", "/post/detail?num="+num +"&bo_num="+bo_num);
		}
		request.getRequestDispatcher("/WEB-INF/views/message.jsp").forward(request, response);
	}

}
