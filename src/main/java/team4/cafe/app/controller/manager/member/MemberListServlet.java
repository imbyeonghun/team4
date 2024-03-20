package team4.cafe.app.controller.manager.member;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;

import com.fasterxml.jackson.databind.ObjectMapper;

import team4.cafe.app.model.vo.MemberVO;
import team4.cafe.app.pagination.Criteria;
import team4.cafe.app.pagination.PageMaker;
import team4.cafe.app.service.MemberService;
import team4.cafe.app.service.MemberServiceImp;


@WebServlet("/manager/member/list")
public class MemberListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private MemberService ms=new MemberServiceImp();
  
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int page=1;
		String type,search;
		try {
			page=Integer.parseInt(request.getParameter("page"));
			type=request.getParameter("type");
			search=request.getParameter("search");
		} catch (Exception e) {
			e.printStackTrace();
			type=null;
			search=null;
		}
		Criteria cri = new Criteria(page, 5, type, search);
		ArrayList<MemberVO> list=ms.getMemberList(cri);
		int totalCount=ms.getMemberCount(cri);
		PageMaker pm=new PageMaker(page, cri, totalCount);
		JSONObject jobj = new JSONObject();
		ObjectMapper om=new ObjectMapper();
		
		String pmStr="";
		try {
			pmStr=om.writeValueAsString(pm);	
		} catch (Exception e) {
			e.printStackTrace();
		}
		jobj.put("list", list);
		jobj.put("pm", pmStr);
		response.setContentType("application/json; charset=utf-8");
		response.getWriter().print(jobj);
	}

}
