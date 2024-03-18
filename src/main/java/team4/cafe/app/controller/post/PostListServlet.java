package team4.cafe.app.controller.post;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import team4.cafe.app.model.vo.BoardVO;
import team4.cafe.app.model.vo.PostVO;
import team4.cafe.app.pagination.Criteria;
import team4.cafe.app.pagination.PageMaker;
import team4.cafe.app.service.PostService;
import team4.cafe.app.service.PostServiceImp;

@WebServlet("/post/list")
public class PostListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private PostService postService = new PostServiceImp();
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String search = request.getParameter("search");
		String type = request.getParameter("type");
		//게시판 번호를 받아온다
		int bo_num, page;
		//게시판 번호와 일치하는 게시글 리스트를 불러온다
		try {
			page = Integer.parseInt(request.getParameter("page"));
		} catch (Exception e) {
			page = 1;
		}
		try {
			bo_num = Integer.parseInt(request.getParameter("bo_num"));
		} catch (Exception e) {
			bo_num = 0;
		}
		System.out.println(page);
		//검색어, 검색 타입, 현재 페이지, 한 페이지 컨텐츠 개수를 이용하여 편재 페이지 정보 객체를 생성
		Criteria cri = new Criteria(page, 10, type, search);
		int totalCount = postService.getTotalCount(cri);
		PageMaker pm = new PageMaker(5, cri, totalCount);
		request.setAttribute("pm", pm);
		//게시글 리스트를 화면에 출력한다.
		request.setAttribute("bo_num", ""+bo_num);
		//검색어, 검색타입에 맞는 전체 게시글 개수를 가져옴
		ArrayList<PostVO> postList = postService.getPostList(bo_num, cri);
		request.setAttribute("postList", postList);
		request.getRequestDispatcher("/WEB-INF/views/post/list.jsp").forward(request, response);
	}

}
