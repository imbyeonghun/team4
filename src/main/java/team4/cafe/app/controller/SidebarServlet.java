package team4.cafe.app.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;

import team4.cafe.app.model.vo.BoardVO;
import team4.cafe.app.model.vo.CategoryVO;
import team4.cafe.app.service.BoardService;
import team4.cafe.app.service.BoardServiceImp;
import team4.cafe.app.service.MemberService;
import team4.cafe.app.service.MemberServiceImp;
import team4.cafe.app.service.PostService;
import team4.cafe.app.service.PostServiceImp;

@WebServlet("/sidebar")
public class SidebarServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private BoardService boardService = new BoardServiceImp();
	private MemberService memberService = new MemberServiceImp();
	private PostService postService = new PostServiceImp();
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<CategoryVO> categoryList =boardService.selectCategoryList() ;
		ArrayList<BoardVO> boardList =boardService.selectBoardList();
	
		//회원 수 & 게시글 수
		int memberTotalCount = memberService.getAllMemberCount();
		int postTotalCount = postService.getAllPostCount();	//전체 게시글 수

		JSONObject jobj = new JSONObject();
		jobj.put("caList", categoryList);
		jobj.put("boList", boardList);
		jobj.put("MTC", memberTotalCount);
		jobj.put("PTC", postTotalCount);

		response.setContentType("application/json; charset=utf-8");
		response.getWriter().print(jobj);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
