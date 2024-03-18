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
//	private CategoryService
       
    public SidebarServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//전체 카테고리 리스트 가져오기
		ArrayList<CategoryVO> categoryAllList = boardService.selectCategoryList();
		//전체 게시판 리스트 가져오기
		ArrayList<BoardVO> boardAllList = boardService.getAllBoardList();
	
		//회원 수 & 게시글 수
		int memberTotalCount = memberService.getAllMemberCount();
		int postTotalCount = 2;
//		int postTotalCount = postService.getAllPostCount();	//전체 게시글 수

		JSONObject jobj = new JSONObject();
		
		jobj.put("caList", categoryAllList);
		jobj.put("boList", boardAllList);
		jobj.put("MTC", memberTotalCount);
		jobj.put("PTC", postTotalCount);
		
		response.setContentType("application/json; charset=utf-8");
		response.getWriter().print(jobj);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
